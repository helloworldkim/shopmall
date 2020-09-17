package com.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.mybatis.config.MybatisManager;
import com.dto.ProductDTO;


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
		
		JSONArray jarr = new JSONArray();
		for(ProductDTO p : pList) {
			JSONObject jobj = new JSONObject();
			jobj.put("productId", p.getProductId());
			jobj.put("productName", p.getProductName());
			jobj.put("shortDetail", p.getShortDetail());
			jobj.put("productDetail", p.getProductDetail());
			jobj.put("productPrice", p.getProductPrice());
			jobj.put("productSalePer", p.getProductSalePer());
			jobj.put("productSalePrice", p.getProductSalePrice());
			jobj.put("productImg", p.getProductImg());
			jobj.put("productDate", p.getProductDate());
			jobj.put("productHit",p.getProductHit());
			jarr.add(jobj);
		}
		PrintWriter out = response.getWriter();
		out.print(jarr);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
