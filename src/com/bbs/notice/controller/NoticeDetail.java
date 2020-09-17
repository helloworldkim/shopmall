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
		
		//아이디로 해당 게시물 찾아옴
		//NoticeDTO notice = nDAO.getNoticeById(bbsId);
		SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
		SqlSession sqlSession = sqlSessionFactory.openSession();
		NoticeDTO notice = sqlSession.selectOne("getNoticeById",bbsId);
		
		//게시글을 읽었으니 조회수(hit) 1증가시킴
		sqlSession.update("noiceIncreaseHit",bbsId);
		sqlSession.commit();
		//이전글 다음글 찾는 메서드
		NoticeDTO nextBbs = sqlSession.selectOne("getNextBbs",bbsId);
		NoticeDTO prevBbs = sqlSession.selectOne("getPrevBbs",bbsId);
		
		sqlSession.close();
		
		
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
