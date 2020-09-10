package com.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.product.ProductDAO;
import com.product.ProductDTO;

/**
 * Servlet implementation class NoticeBBS
 */
@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		
		String category="";
		if(request.getParameter("category")!=null) {
			category=request.getParameter("category");
		}

		ArrayList<ProductDTO> productList = ProductDAO.getInstance().getProductList(category);
		
		request.setAttribute("productList", productList);

		request.getRequestDispatcher("./view/productList.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
