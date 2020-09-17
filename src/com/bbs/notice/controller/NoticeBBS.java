package com.bbs.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.dto.NoticeDTO;
import com.mybatis.config.MybatisManager;

/**
 * Servlet implementation class NoticeBBS
 */
@WebServlet("/Notice")
public class NoticeBBS extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		int pageNumber=1;
		if(request.getParameter("pageNumber")!=null) {
			pageNumber= Integer.parseInt(request.getParameter("pageNumber"));
		}
		int totalPage; //총 페이지 수
		int lastNumber; //마지막페이지 넘버
		//int totalNoitce = NoticeDAO.getInstance().getNoticeCount();
		SqlSession sqlsession = sqlSessionFactory.openSession();
		int totalNotice = sqlsession.selectOne("getNoticeCount");
		
		if(totalNotice%10==0) {
			totalPage =	totalNotice/10;
			lastNumber = totalPage;
		}else {
			
			totalPage =	totalNotice/10+1;
			lastNumber = totalPage;
		}
		
		//ArrayList<NoticeDTO> noticeList = NoticeDAO.getInstance().getNoticeList(pageNumber);
		//RowBounds row = new RowBounds(offset , limit);
		sqlsession = sqlSessionFactory.openSession();
		List<NoticeDTO> noticeList = sqlsession.selectList("getNoticeList",pageNumber);
		sqlsession.close();
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("lastNumber", lastNumber);
		
		
		request.getRequestDispatcher("./view/noticeBBS.jsp").forward(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//noticeList를 ajax사용해서 주는 작업
		//가장 최신 공지사항 10개 받아올 메서드
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		SqlSession sqlsession = sqlSessionFactory.openSession();
		List<NoticeDTO> noticeList = sqlsession.selectList("getAllNoticeList");
		sqlsession.close();
		//수정가능??
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
