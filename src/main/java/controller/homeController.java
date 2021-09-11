package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;


@WebServlet({"/home/*"})
public class homeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		//mở session
		request.getSession().setAttribute("", 0);
		
		//get random product
		request.setAttribute("RandomProduct", new ProductDAO().RandomProduct());
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/Table_Bai3.jsp").forward(request, response);
	}

}
