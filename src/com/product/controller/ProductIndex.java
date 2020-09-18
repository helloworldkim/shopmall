package com.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dto.ProductDTO;
import com.google.gson.Gson;
import com.mybatis.config.MybatisManager;


@WebServlet("/ProductIndex")
public class ProductIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//기본값 공백으로 아무거나 검색되게하고 베스트 아이템은 hit수가 가장 많은순서대로 조회해서 뿌려줌
		String category = "";
		if(request.getParameter("category")!=null) {
			category=request.getParameter("category");
		}
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		SqlSession sqlsession = sqlSessionFactory.openSession();
		List<ProductDTO> pList = sqlsession.selectList("getProductListByHit",category);
		sqlsession.close();
		
		//ajax 데이터 보내주는부분
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("jarr", pList);
		Gson gson = new Gson();
		String Obj = gson.toJson(map);
		PrintWriter out = response.getWriter();
		out.print(Obj.toString());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
