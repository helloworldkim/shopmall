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
 * Servlet implementation class ProductView
 */
@WebServlet("/ProductView")
public class ProductView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productId=0;
		if(request.getParameter("productId")!=null) {
			productId = Integer.parseInt(request.getParameter("productId"));
		}
		
		HttpSession session = request.getSession();
		//내가본 상품 등록위한 session객체
		ArrayList<Integer> productList;
		ArrayList<Integer> resultList = new ArrayList<Integer>();
		if (session.getAttribute("productList") == null) {
			productList = new ArrayList<Integer>();
			productList.add(productId);
			session.setAttribute("productList", productList);
		}else {
			productList =(ArrayList<Integer>) (session.getAttribute("productList"));
			productList.add(productId);
			for(Integer p: productList) {
				if(!resultList.contains(p)) {
					resultList.add(p);
				}
			}
			session.setAttribute("productList", resultList);
			
		}
		System.out.println(resultList);
				
		ProductDAO pDAO = ProductDAO.getInstance();
		ProductDTO product = pDAO.getProductById(productId);
		
		request.setAttribute("product", product);
		
		request.getRequestDispatcher("./view/productView.jsp").forward(request, response);	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
