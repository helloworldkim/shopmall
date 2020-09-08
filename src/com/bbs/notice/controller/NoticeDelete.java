package com.bbs.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bbs.notice.NoticeDAO;

/**
 * Servlet implementation class NoticeDelete
 */
@WebServlet("/NoticeDelete")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int admin=-1;
		if(session.getAttribute("admin")!=null) {
			admin = (int) session.getAttribute("admin");
		}
		
		int bbsId=-1;
		 if(request.getParameter("bbsId")!=null){
			bbsId =Integer.parseInt(request.getParameter("bbsId")); 
		}
		 if(bbsId==-1){//bbsId값은 1부터 시작함으로 음수가 될수없음
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('유효하지 않은 글입니다'))");
				script.println("history.back()");
				script.println("</script>");
		}
		 NoticeDAO nDAO = NoticeDAO.getInstance();
		 int result=nDAO.deleteNoticeById(bbsId);
		
		 PrintWriter out = response.getWriter();
		 out.println(result);
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
