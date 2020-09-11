package com.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.product.ProductDAO;
import com.product.ProductDTO;

/**
 * Servlet implementation class MyProductList
 */
@WebServlet("/MyProductList")
public class MyProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProductDAO pDAO = ProductDAO.getInstance();
		//내가본 상품들의 productId값이 담겨있는 list
		ArrayList<Integer> productIdList = (ArrayList<Integer>)session.getAttribute("productIdList");
		//view페이지로 뿌려줄 list생성
		ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
		for(Integer p: productIdList) {
			ProductDTO product = pDAO.getProductById(p);
			productList.add(product);
		}
		
		request.setAttribute("myProductList", productList);
		
		request.getRequestDispatcher("./view/myProductList.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
