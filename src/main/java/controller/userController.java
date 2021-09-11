package controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.CartDAO;
import dao.UserDAO;
import model.Cart;
import model.User;


@WebServlet({"/user/*"})
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String uri[] = request.getRequestURI().split("/");
		
		try {
			if(uri[3].equals("sign-in") || uri[3].equals("sign-out")) { // sign-in
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
			}
		}catch (Exception e) {
			//get user
			User user = (User) request.getSession().getAttribute("user");
			// tạo cart dao
			CartDAO cartDAO = new CartDAO();
			// lấy list carts dựa vào user (hiển thị lịch sử mua hàng)
			List<Cart> carts = cartDAO.selectAllByUser(user.getId());
			try {
				//lây id cart trên url
				int id = Integer.parseInt(request.getParameter("id"));
				//nếu có id -> xem danh sách cart details
				Cart cart = cartDAO.selectById(id);
				//set list cartDetails để hiển thị
				request.setAttribute("cartDetailsByCart", cart.getCartDetails());
			}catch (Exception ex) {}
			// set lịch sữ mua hàng
			request.setAttribute("History_Carts", carts);
			request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url[] = request.getRequestURI().split("/");
		if(url[3].equals("sign-in")) {
			this.doSignIn(request,response);
		}else if(url[3].equals("sign-out")) {
			this.doSignOut(request, response);
		}else if(url[3].equals("sign-up")) {
			this.doSignUp(request, response);
		}
		
		
	}
	
	private void doSignUp(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		try {
			//DAO
			UserDAO userDAO = new UserDAO();
			//tạo user
			User user = new User();
			//get value từ form vào user
			BeanUtils.populate(user, request.getParameterMap());
			if(userDAO.selectById(user.getId()) != null) {
				//kiểm tra nếu có tài khản
				request.setAttribute("message", "Tài khoản đã có người sử dụng");
				request.getRequestDispatcher("/views/login.jsp").forward(request, response);
				return;
			};
			//chưa có người sữ dùng thì tạo mới
			userDAO.insert(user);
			//set user vào session
			request.getSession().setAttribute("user", user);
			String loginURI = request.getServletContext().getContextPath()+"/user";
			response.sendRedirect(loginURI);
			
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void doSignIn(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// DAO
		UserDAO userDAO = new UserDAO();
		//lấy user name và password
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		//lấy user từ username
		User user = userDAO.selectById(username);
		if(user != null) {
			//nếu có thì kiểm tra username và password
			if(user.getId().equals(username) && user.getPassword().equals(password)) {
				//set user vào session
				request.getSession().setAttribute("user", user);
				String loginURI = request.getServletContext().getContextPath();
				if(user.isRole() == true) {
					// nếu là admin thì gửi send qua trang admin
					loginURI += "/admin";
					response.sendRedirect(loginURI);
				}else {
					// send qua user
					loginURI += "/user";
					response.sendRedirect(loginURI);
				}
				return;
			}
		}
		//nếu user = null thì gửi message
		request.setAttribute("message", "Sai tài khoản hoặc mật khẩu");
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		
		
	}



	private void doSignOut(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//remove user
		request.getSession().invalidate();	
		String loginURI = request.getServletContext().getContextPath()+"/user";
		response.sendRedirect(loginURI);
	}

}
