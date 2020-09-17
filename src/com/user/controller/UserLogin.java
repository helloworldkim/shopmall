package com.user.controller;

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

import com.dto.UserDTO;
import com.mybatis.config.MybatisManager;


@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//view페이지 주소를 안보여주면서 접근하도록 변경
		request.getRequestDispatcher("./view/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션객체 생성
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();
		//이미 로그인이 되어있는경우
		if(session.getAttribute("userId")!=null) {
			script.println("<script>");
			script.println("alert('이미 로그인 하셨습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else {//로그인이 안되어있는경우
			String userId="";
			String userPwd="";
			if(request.getParameter("userId")!=null) {
				userId = request.getParameter("userId");
			}
			if(request.getParameter("userPwd")!=null) {
				userPwd = request.getParameter("userPwd");
			}
			UserDTO user = new UserDTO();
			user.setUserId(userId);
			user.setUserPwd(userPwd);
			
			
			SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
			SqlSession sqlsession = sqlSessionFactory.openSession();
			int result = sqlsession.selectOne("findUserById", user);
			//0,1 아이디 비밀번호가 모두 맞을경우에만 로그인해줌
			int admin=sqlsession.selectOne("getAdmin",userId); 
			sqlsession.close();
			
			//아이디가 조회안되는경우
			if(result==0) {
				script.println("<script>");
				script.println("alert('아이디 또는 비번호를 확인해주세요')");
				script.println("history.back()");
				script.println("</script>");
			}else {
					//session객체에 userId와 admin를 저장함 admin값으로 구별 후 관리자의 경우 관리자페이지로 가는 링크를 넣음
					session.setAttribute("userId", userId);
					session.setAttribute("admin", admin);
					script.println("<script>");
					script.println("alert('로그인성공')");
					script.println("location.href='./view/index.jsp'");
					script.println("</script>");
			}
			
		}
		
		
		
	}

}
