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
import com.bbs.notice.NoticeDTO;

/**
 * Servlet implementation class NoticeInsert
 */
@WebServlet("/NoticeDetail")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//기본값
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
		//아이디로 해당 게시물 찾아옴
		NoticeDTO notice = nDAO.getNoticeById(bbsId);
		//게시글을 읽었으니 조회수(hit) 1증가시킴
		nDAO.increaseHit(bbsId);
		//이전글 다음글 찾는 메서드
		NoticeDTO nextBbs = nDAO.getNextBbs(bbsId);
		NoticeDTO prevBbs = nDAO.getPrevBbs(bbsId);
		
		String bbsAdminId = notice.getBbsAdminId();
		String bbsTitle = notice.getBbsTitle();
		String bbsDate = notice.getBbsDate();
		String bbsContent = notice.getBbsContent();
		int bbsHit =  notice.getBbsHit();
		bbsId = notice.getBbsId();

		request.setAttribute("bbsAdminId", bbsAdminId);
		request.setAttribute("bbsTitle", bbsTitle);
		request.setAttribute("bbsDate", bbsDate);
		request.setAttribute("bbsContent", bbsContent);
		request.setAttribute("bbsId", bbsId);
		request.setAttribute("bbsHit", bbsHit);
		
		request.setAttribute("nextNotice", nextBbs);
		request.setAttribute("prevNotice", prevBbs);

		request.getRequestDispatcher("./view/noticeDetail.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
