package com.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class MyProductList
 */
@WebServlet("/MyProductList")
public class MyProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		SqlSession sqlsession = sqlSessionFactory.openSession();
		//조회한 상품이 없을때 접근할경우
		if(session.getAttribute("productIdList")==null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아직까지 조회하신 상품이 없습니다')");
			script.println("history.back(-1)");
			script.println("</script>");
			return;
		}
		//내가본 상품들의 productId값이 담겨있는 list
		ArrayList<Integer> productIdList = (ArrayList<Integer>)session.getAttribute("productIdList");
		//view페이지로 뿌려줄 list생성
		ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
		for(Integer productId: productIdList) {
			ProductDTO product = sqlsession.selectOne("getProductById",productId);
			productList.add(product);
		}
		sqlsession.close();
		request.setAttribute("myProductList", productList);
		
		request.getRequestDispatcher("./view/myProductList.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
