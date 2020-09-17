package com.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dto.ProductDTO;
import com.mybatis.config.MybatisManager;

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
		//내가본 상품 등록위한 session객체
		HttpSession session = request.getSession();
		//상품을 등록하는 리스트
		ArrayList<Integer> productList;
		//값을 비교할 리스트
		ArrayList<Integer> resultList = new ArrayList<Integer>();
		if (session.getAttribute("productIdList") == null) {
			productList = new ArrayList<Integer>();
			productList.add(productId);
			session.setAttribute("productIdList", productList);
		}else {
			productList =(ArrayList<Integer>) (session.getAttribute("productIdList"));
			productList.add(productId);
			for(Integer p: productList) {
				if(!resultList.contains(p)) {
					resultList.add(p);
				}
			}
			session.setAttribute("productIdList", resultList);
			
		}
		System.out.println(session.getAttribute("productIdList"));
		
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		SqlSession sqlsession = sqlSessionFactory.openSession();
		//해당아이디 게시물을 불러옴
		ProductDTO product = sqlsession.selectOne("getProductById",productId);
		//상품을 조회했으니 조회수(hit) 1증가시킴
		sqlsession.selectOne("productIncreaseHit",productId);
		sqlsession.commit();
		sqlsession.close();
		
		request.setAttribute("product", product);
		
		request.getRequestDispatcher("./view/productView.jsp").forward(request, response);	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
