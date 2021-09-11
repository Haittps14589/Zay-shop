package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import dao.CartDetailDAO;
import model.Cart;
import model.CartDetail;
import model.User;



@WebServlet({"/cart/*"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50)
public class cartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String uri[] = request.getRequestURI().split("/");
		
		try {
			//get List Cart
			@SuppressWarnings("unchecked")
			List<CartDetail> cartDetails = (List<CartDetail>) request.getSession().getAttribute("cartDetails");
			
			
			if(uri[3].equals("increase")) {
				this.doIncrease(cartDetails,request, response);	
				
			}else if(uri[3].equals("decrease")) {
				this.doDecrease(cartDetails,request, response);
				
			}else if(uri[3].equals("remove")){
				this.doRemove(cartDetails,request, response);
				
			}else if (uri[3].equals("payment")){
				//lấy user
				User user = (User) request.getSession().getAttribute("user");
				if(user != null) {
					System.err.println("Thanh toán nè");
					this.doPayment(user,cartDetails,request, response);
					return;
				}else {
					//nếu chưa có user gửi về trong user -> sign-in
					String loginURI = request.getServletContext().getContextPath()+"/user";
					response.sendRedirect(loginURI);
					return;
				}
			}
			//set lại cart trong session
			request.getSession().setAttribute("cartDetails", cartDetails);
			//gửi lại trang cart
			response.sendRedirect(request.getServletContext().getContextPath()+"/cart");
			return;
		}catch (Exception e) {}
			request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
	}

	private void doPayment(User user,List<CartDetail> cartDetails, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, AddressException, MessagingException {
		//dao
		CartDAO cartDAO = new CartDAO();
		CartDetailDAO cartDetailDAO = new CartDetailDAO();
		//khởi tạo tổng tiền -
		int totalCart = 0;
		// tạo mã dựa theo ngày giờ sắp xếp lộn xộn
		int cart_id = Integer.parseInt(new SimpleDateFormat("ddhhssmm").format(new Date()));
		// tạo cart
		Cart cart = new Cart(cart_id,totalCart,user.getId(), new Date());
		//insert cart vào db
		cartDAO.insert(cart);
		
		for (CartDetail cartDetail : cartDetails) {
			//lấy tổng của 1 sản phẩm
			int total = cartDetail.getProduct().getPrice() * cartDetail.getquantity();
			//cộng vào tổng tiền
			totalCart += total;
			//set giỏ hàng cho ghct
			cartDetail.setCart(cart);
			//insert ghct vào db
			cartDetailDAO.insert(cartDetail);
		}
		//update lại tổng tiền của gh
		cart.setTotal(totalCart);
		cartDAO.update(cart);
		//xóa hết trong list
		
		sendMail(user.getEmail(), cartDetails, totalCart);
		cartDetails.removeAll(cartDetails);
		
		//set lại session
		request.getSession().setAttribute("cartDetails", cartDetails);
		request.setAttribute("message", "Đơn hàng của bạn đã được ghi nhận, Vui lòng kiểm tra mail để xem thông tin chi tiết về đơn hàng. "
				+ "cảm ơn bạn đã mua hàng tại ZAY STORE");
		System.err.println("Thanh toán xong");
		request.getRequestDispatcher("/views/cart.jsp").forward(request, response);
		
	}

	private void sendMail(String email, List<CartDetail> cartDetails, int totalCart) throws AddressException, MessagingException {
		//Thông số kết nối smtp server
				Properties props = new Properties();
				props.setProperty("mail.smtp.auth", "true");
				props.setProperty("mail.smtp.starttls.enable", "true");
				props.setProperty("mail.smtp.host", "smtp.gmail.com");
				props.setProperty("mail.smtp.port", "587");
				
				Session session = Session.getInstance(props, new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						String username = "tranhai01se@gmail.com";
						String password = "2810282tth";
						return new PasswordAuthentication(username, password);
					}
				});
				
				//tao message
				String msgEmail = "";
				for (CartDetail cartDetail : cartDetails) {
					msgEmail += cartDetail.toString() + "<br>";
				}
				
				
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress("tranhai01@gmail.com"));
				message.setRecipients(Message.RecipientType.TO, email);
				message.setSubject("Zay srote - Đơn hàng của bạn","utf-8");
				message.setText(msgEmail +"<br>" + "Tổng tiền của bạn là: "+totalCart +"<br>"+"Cảm ơn bạn đã mua hàng tại ZAY STORE" , "utf-8","html");
				message.setReplyTo(message.getFrom());
				
				//gui message
				Transport.send(message);
	}

	private void doRemove(List<CartDetail> cartDetails, HttpServletRequest request, HttpServletResponse response) {
		//get index
		int cart_index = Integer.parseInt(request.getParameter("index"));
		//xóa dựa vào index
		cartDetails.remove(cart_index);
		
	}

	private void doDecrease(List<CartDetail> cartDetails, HttpServletRequest request, HttpServletResponse response) {
		//get index
		int cart_index = Integer.parseInt(request.getParameter("index"));
		//lấy số lương
		int quantityCart = cartDetails.get(cart_index).getquantity();
		if(quantityCart-1 == 0) {
			//nếu  số lượng còn 1 thì xóa
			cartDetails.remove(cart_index);
		}else {
			//nếu nhiều hơn 1 thì giảm 1
			cartDetails.get(cart_index).setquantity(quantityCart-1);
		}
		
		
	}

	private void doIncrease(List<CartDetail> cartDetails ,HttpServletRequest request, HttpServletResponse response) {
		//get index
		int cart_index = Integer.parseInt(request.getParameter("index"));
		//lấy số lượng của ghct
		int quantityCart = cartDetails.get(cart_index).getquantity();
		//tăng lên 1
		cartDetails.get(cart_index).setquantity(quantityCart+1);
		
	}
}
