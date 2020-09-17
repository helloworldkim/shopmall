package com.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.mybatis.config.MybatisManager;

/**
 * Servlet implementation class UserIDCheck
 */
@WebServlet("/UserIdCheck")
public class UserIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId =  request.getParameter("userId");
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		SqlSession sqlsession = sqlSessionFactory.openSession();
		
		int result = sqlsession.selectOne("idCheck",userId);
		PrintWriter out = response.getWriter();
		out.println(result);//결과값 return
	}

}
