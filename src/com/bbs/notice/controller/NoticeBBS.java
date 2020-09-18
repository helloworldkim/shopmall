package com.bbs.notice.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dto.NoticeDTO;
import com.google.gson.Gson;
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
		String sort="";
		if(request.getParameter("sort")!=null) {
			sort = request.getParameter("sort");
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
		
		//RowBounds row = new RowBounds(offset , limit);
		sqlsession = sqlSessionFactory.openSession();
		HashMap hMap = new HashMap();
		hMap.put("pageNumber", pageNumber);
		hMap.put("sort", sort);
		//List<NoticeDTO> noticeList = sqlsession.selectList("getNoticeList",pageNumber);
		List<NoticeDTO> noticeList = sqlsession.selectList("getNoticeListdesc",hMap);
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
		
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("jarr", noticeList);
		Gson gson = new Gson();
		String Obj = gson.toJson(map);
		PrintWriter out = response.getWriter();
		//toString ?? 그냥??
		out.println(Obj.toString());
		
	}
	

}
