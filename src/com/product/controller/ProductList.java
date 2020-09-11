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
		String title="";
		if(request.getParameter("title")!=null) {
			title=request.getParameter("title");
		}
		ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
		if(title.equals("신상품")) { //날짜를 기준으로 정렬한 리스트
			productList = ProductDAO.getInstance().getProductListByDate(category);
		}else if(title.equals("베스트아이템")){ //조회수를 기준으로 정렬한 리스트
			productList = ProductDAO.getInstance().getProductListByHit(category);
		}else { //그냥 카테고리별 리스트
			productList = ProductDAO.getInstance().getProductList(category);
		}

		
		
		request.setAttribute("productList", productList);

		request.getRequestDispatcher("./view/productList.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
