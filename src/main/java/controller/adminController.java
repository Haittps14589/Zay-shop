package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.beanutils.BeanUtils;

import dao.CallProcedure;
import dao.CartDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.UserDAO;
import model.Cart;
import model.Product;
import model.ReportProduct;



@WebServlet({"/admin/*"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30, maxRequestSize = 1024 * 1024 * 50)
public class adminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String uri[] = request.getRequestURI().split("/");
		
		try {
			if(uri[4].equals("product")) {
				//"product"
				this.doProduct(request, response, uri);
			}else if(uri[4].equals("cart")) {
				//"cart"
				this.doCart(request, response,uri);
			}else if(uri[4].equals("user")) {
				this.doUser(request, response, uri);
			}
		}catch (Exception e) {
			this.doDashboard(request, response);
		}
		
	}

	private void doUser(HttpServletRequest request, HttpServletResponse response, String[] uri) throws ServletException, IOException {
		request.setAttribute("users", new UserDAO().selectAll());
		//gửi qua table
		request.getRequestDispatcher("/views/admin/table_user.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String uri[] = request.getRequestURI().split("/");
			request.setCharacterEncoding("UTF-8");
			if(uri[3].equals("cre-upd")) {
				//tạo mới hoặc update product
				if(uri[4].equals("product")) {
					this.doCreOrUpd(request, response);
					
				}
			}
	}
	

	private void doCreOrUpd(HttpServletRequest request, HttpServletResponse response) {
		try {
			// tạo DAO
			ProductDAO productDAO = new ProductDAO();
			CategoryDAO categoryDAO = new CategoryDAO();
			//tạo product
			Product product = new Product();
			//get value từ form vào product
			BeanUtils.populate(product,request.getParameterMap());
			//tạo producttemp get từ id mới lấy từ form
			Product productTemp = productDAO.selectById(product.getId());
			
			//kiểm tra hình
			if(request.getPart("image").getSubmittedFileName().length() > 0) {
				//nếu có thì set vào image
				product.setImage(getImage(request));
			}else {
				//nếu ko có hình - kiểm tra product temp có tồn tại ko (update)
				if(productTemp != null) {
					//nếu có thì set tên hình cũ, vì image ko có nên set lại như cũ
					product.setImage(productTemp.getImage());
				}
			}
			//lấy id category
			String id = request.getParameter("category_id");
			//set category vào product
			product.setCategory(categoryDAO.selectById(id));
			
			if( productTemp == null) {
				try {
					//nếu product temp ko có => là create 
					productDAO.insert(product);
				}catch (Exception e) {}
				
			}else {
				//nếu c product temp thì là update
				productDAO.update(product);
			}
			
			response.sendRedirect(request.getServletContext().getContextPath()+"/admin/table/product");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void doDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//nếu ko có uri delete || table || product -> vào dashboard
		//lấy month từ url lưu vào String để check trước khi chuyển qua số
		String Smonth = request.getParameter("month");
		//tạo list report
		List<ReportProduct> RP_Products;
		//lấy tháng hiện tại -> nếu trên url ko có month
		int month = Integer.parseInt(new SimpleDateFormat("MM").format(new Date()));
		if(Smonth != null) {
			// nếu có month thì lưu vào
			month = Integer.parseInt(Smonth);
		}
		//Call procedure
		RP_Products = new CallProcedure().spReportProduct(month);
		
		request.setAttribute("month", month);
		request.setAttribute("RP_Products", RP_Products);
		request.getRequestDispatcher("/views/admin/dashboard.jsp").forward(request, response);
	}
	
	private void doCart(HttpServletRequest request, HttpServletResponse response, String[] uri) throws ServletException, IOException {
		//tạo cart DAO
		CartDAO cartDAO = new CartDAO();
		if(uri[3].equals("table")) {
			//get danh sách cart
			request.setAttribute("carts",cartDAO.selectAll());
			try {
				//lấy id từ url
				int id = Integer.parseInt(request.getParameter("id"));
				//nếu có id -> xem danh sách cartDetail
				Cart cart = cartDAO.selectById(id);
				request.setAttribute("cartDetailsByCart", cart.getCartDetails());
			}catch (Exception e) {}
			
		}
		//gửi qua table
		request.getRequestDispatcher("/views/admin/table_cart.jsp").forward(request, response);
	}



	private void doProduct(HttpServletRequest request, HttpServletResponse response, String uri[]) throws ServletException, IOException {
		//tạo product DAO và category DAO
		ProductDAO productdao = new ProductDAO();
		CategoryDAO categorydao = new CategoryDAO();
		
		if(uri[3].equals("table")) {
			//"table"
			//lấy danh sách product
			request.setAttribute("products", productdao.selectAll());
		}if(uri[3].equals("delete")) {
			//"delete"
			//lấy id từ url
			String id = request.getParameter("id");
			//xóa product theo id
			productdao.delete(id);
			//gửi lại table
			response.sendRedirect(request.getServletContext().getContextPath()+"/admin/table/product");
			return;
		}else { 
			// "form"
			//lấy id từ url
			String id =request.getParameter("id");
			if(id != null) {
				//nếu có id -> edit
				request.setAttribute("product", productdao.selectById(id));
			}
			//get danh mục để điền vào form select
			request.setAttribute("categorys", categorydao.selectAll());
		}
		//gửi qua form || table
		request.getRequestDispatcher("/views/admin/"+uri[3]+"_product.jsp").forward(request, response);
	}



	



	private String getImage(HttpServletRequest request) throws IOException, ServletException {
		String applicationPath = request.getServletContext().getRealPath("/");
		String uploadPath = applicationPath + "resources/assets/img/img_product";
		System.out.println(applicationPath);
		Part photo = request.getPart("image");
		if(photo.getSize() <=0 ) return null;
		
		photo.write(uploadPath + "/"+photo.getSubmittedFileName());		
		return photo.getSubmittedFileName();
	}
	
	
	

}
