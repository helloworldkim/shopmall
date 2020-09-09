package com.bbs.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.bbs.notice.NoticeDAO;
import com.bbs.notice.NoticeDTO;

/**
 * Servlet implementation class NoticeBBS
 */
@WebServlet("/Notice")
public class NoticeBBS extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int pageNumber=1;
		if(request.getParameter("pageNumber")!=null) {
			pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
		}
		int totalPage; //총 페이지 수
		int lastNumber; //마지막페이지 넘버
		int totalNoitce = NoticeDAO.getInstance().getNoticeCount();
		if(totalNoitce%10==0) {
			totalPage =	totalNoitce/10;
			lastNumber = totalPage;
		}else {
			
			totalPage =	totalNoitce/10+1;
			lastNumber = totalPage;
		}
		ArrayList<NoticeDTO> noticeList = NoticeDAO.getInstance().getNoticeList(pageNumber);
		
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("lastNumber", lastNumber);
		
		request.getRequestDispatcher("./view/noticeBBS.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//noticeList를 ajax사용해서 주는 작업
		//가장 최신 공지사항 10개 받아올 메서드
		ArrayList<NoticeDTO> noticeList = NoticeDAO.getInstance().getAllNoticeList();
		JSONArray jarr = new JSONArray();
		for(NoticeDTO n : noticeList) {
			JSONObject jobj = new JSONObject();
			//제목만 표시할예정
			jobj.put("title", n.getBbsTitle());
			jobj.put("bbsId",n.getBbsId());
			jarr.add(jobj);
		}
		PrintWriter out = response.getWriter();
		out.println(jarr);
		
	}
	

}
