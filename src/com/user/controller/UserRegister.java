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

import com.dto.UserDTO;
import com.mybatis.config.MybatisManager;

/**
 * Servlet implementation class userRegister
 */
@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String userName= request.getParameter("userName");
			String userId= request.getParameter("userId");
			String userPwd= request.getParameter("userPwd");
			String userPhone= request.getParameter("userPhone");
			String userBirth= request.getParameter("userBirth");
			String userEmail= request.getParameter("userEmail");
			int userZipcode= Integer.parseInt(request.getParameter("userZipcode"));
			String userAddress= request.getParameter("userAddress");
			int admin= Integer.parseInt(request.getParameter("admin"));
			String emailAgreement= request.getParameter("emailAgreement");

			UserDTO user = new UserDTO();
			user.setUserName(userName);
			user.setUserId(userId);
			user.setUserPwd(userPwd);
			user.setUserPhone(userPhone);
			user.setUserBirth(userBirth);
			user.setUserEmail(userEmail);
			user.setUserZipcode(userZipcode);
			user.setUserAddress(userAddress);
			user.setAdmin(admin);
			user.setEmailAgreement(emailAgreement);
			
			SqlSessionFactory sqlSessionFactory = MybatisManager.getSqlSessionFactory();
			SqlSession sqlSession = sqlSessionFactory.openSession();
			int result = sqlSession.insert("insertUser",user); //0,1 쿼리실행결과
			sqlSession.commit();
			sqlSession.close();
			if(result==1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('가입성공')");
				script.println("location.href='./view/index.jsp'");
				script.println("</script>");
			}else {
				
			}
			
		
			//다된경우 메인화면으로!
			//response.sendRedirect("./view/index.jsp");
	}

}
