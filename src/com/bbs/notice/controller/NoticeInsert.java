package com.bbs.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dto.NoticeDTO;
import com.mybatis.config.MybatisManager;

/**
 * Servlet implementation class NoticeInsert
 */
@WebServlet("/NoticeInsert")
public class NoticeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if((int)session.getAttribute("admin")!=1) { //관리자계정 확인
			response.sendRedirect("/Notice");
		}
		String bbsAdminId = (String) session.getAttribute("userId");
		String bbsTitle = request.getParameter("bbsTitle");
		String bbsContent = request.getParameter("bbsContent");
		NoticeDTO notice = new NoticeDTO();
		notice.setBbsAdminId(bbsAdminId);
		notice.setBbsTitle(bbsTitle);
		notice.setBbsContent(bbsContent);
		//insert메서드 수행
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		SqlSession sqlsession = sqlSessionFactory.openSession();
		sqlsession.insert("insertNotice",notice);
		sqlsession.commit();
		sqlsession.close();
		

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('공지사항 작성완료')");
		script.println("location.href='/Notice'");
		script.println("</script>");
		
	}

}
