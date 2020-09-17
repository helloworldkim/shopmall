package com.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dto.ProductDTO;
import com.mybatis.config.MybatisManager;

/**
 * Servlet implementation class NoticeBBS
 */
@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category="";
		if(request.getParameter("category")!=null) {
			category=request.getParameter("category");
		}
		String title="";
		if(request.getParameter("title")!=null) {
			title=request.getParameter("title");
		}
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		SqlSession sqlsession = sqlSessionFactory.openSession();
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		if(title.equals("신상품")) { //날짜를 기준으로 정렬한 리스트
			//productList = ProductDAO.getInstance().getProductListByDate(category);
			productList = sqlsession.selectList("getProductListByDate",category);
		}else if(title.equals("베스트아이템")){ //조회수를 기준으로 정렬한 리스트
			//productList = ProductDAO.getInstance().getProductListByHit(category);
			productList = sqlsession.selectList("getProductListByHit",category);
		}else { //그냥 카테고리별 리스트
			//productList = ProductDAO.getInstance().getProductList(category);
			productList = sqlsession.selectList("getProductList",category);
		}
		sqlsession.close();

		request.setAttribute("productList", productList);

		request.getRequestDispatcher("./view/productList.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

}
