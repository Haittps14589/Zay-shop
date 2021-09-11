package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.CartDetail;
import model.Product;

@WebServlet({ "/shop/*" })
public class shopController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url[] = request.getRequestURI().split("/");
		CategoryDAO categoryDAO = new CategoryDAO();

		if (url[2].equals("shop")) { 
			// shop
			try {
				if (url[3].equals("add")) {
					request.setCharacterEncoding("UTF-8");
					try {
						this.doAddOrUpdateCartDetail(request, response);
						doGetShop(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else if (url[3] != null) { 
					// mã category
					boolean check = doGetCategory(url, request, response);
					if (check == true) {
					// check vì nó forward qua trang web khác trong method
						return;
					}

				}
			} catch (Exception e) {
				// if url[3] = null, không có mã category
				doGetShop(request, response);
			}
		}

		request.setAttribute("categorys", categoryDAO.selectAll());

		request.getRequestDispatcher("/views/shop.jsp").forward(request, response);
	}

	private void doAddOrUpdateCartDetail(HttpServletRequest request, HttpServletResponse response) {
		// tạo id cardetail 
		int cartDetails_id = Integer.parseInt(new SimpleDateFormat("hhmmss").format(new Date()));
		//get list cart details
		@SuppressWarnings("unchecked")
		List<CartDetail> cartDetails = (List<CartDetail>) request.getSession().getAttribute("cartDetails");
		
		//get id product
		String idProduct = request.getParameter("id");
		//get quantity product
		int quantity_product = Integer.parseInt(request.getParameter("quantity"));
 		// get product được chọn
		Product product = new ProductDAO().selectById(idProduct);

		// kiểm tra product có tồn tại chưa - lấy index nếu tồn tại
		int index_cartDetails = isExist(product, cartDetails);
		if (index_cartDetails == -1) { 
			// chưa - tạo mới và add cartdetail
			CartDetail cartDetail = new CartDetail(cartDetails_id, product, quantity_product);
			cartDetails.add(cartDetail);
		} else {
			// rồi - tăng số lượng lên 1
			int quantity = cartDetails.get(index_cartDetails).getquantity() + 1;
			cartDetails.get(index_cartDetails).setquantity(quantity);
		}

		request.getSession().setAttribute("cartDetails", cartDetails);
		request.setAttribute("message", "Đã thêm vào giỏ hàng!");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private int isExist(Product product, List<CartDetail> cartDetails) {

		for (int i = 0; i < cartDetails.size(); i++) {
			if (cartDetails.get(i).getProduct().getId().equals(product.getId())) {
				return i;
			}
		}
		return -1;
	}

	protected void doGetShop(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// khởi tạo page là 1
		int page = 1;
		try {
			//nếu có page trên url
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {}
		//tạo product dao
		ProductDAO productDAO = new ProductDAO();
		//get sản phẩm theo page
		request.setAttribute("products", productDAO.selectPage(page, 9));
	}

	protected boolean doGetCategory(String url[], HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//tạo categoryDAO
		CategoryDAO categoryDAO = new CategoryDAO();
		//tạo list product lầy từ category.getProduct -> get sản phẩm theo danh mục, url[3] là mã danh mục
		List<Product> products = categoryDAO.selectById(url[3]).getProducts();

		try {
			if (url[4] != null) { 
				// url[4] mã product
				dogetProduct(url[4], products, request, response);
				return true;
			}
		} catch (Exception e) {
			// if url[4] = null, ko có mã product
			request.setAttribute("products", products);
		}
		return false;
	}

	protected void dogetProduct(String id, List<Product> products, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		for (Product product : products) {
			//kiểm tra id có bằng với id cần lấy
			if (product.getId().equals(id)) {
				//set product -> get product chi tiết
				request.setAttribute("product", product);
				//set list product có chung category (sản phẩm có thể thích)
				request.setAttribute("products", products);
				break;
			}
		}
		request.getRequestDispatcher("/views/product_details.jsp").forward(request, response);
	}
}
