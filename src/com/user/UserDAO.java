package com.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	private static UserDAO instance = new UserDAO();
	
	private UserDAO() {
		
	}
	
	public static UserDAO getInstance() {
		return instance;
	}
	//커넥션
	public Connection getConnection() {
		 String userid = "hr";
		 String userpassword = "1234";
		 String url = "jdbc:oracle:thin:@localhost:1521:xe";
		 try {
	 Class.forName("oracle.jdbc.driver.OracleDriver"); 
	 } catch(ClassNotFoundException e){
		 e.printStackTrace();
	}
	 
	 try { 
		 conn= DriverManager.getConnection(url,userid,userpassword);
		 } catch(SQLException e) {
			 e.printStackTrace(); 
		} 
	 return conn;
	}
	
	//close 메서드
	private void closeConnection(Connection conn, PreparedStatement pstmt , Statement stmt, ResultSet rs) {
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			if(stmt!=null) stmt.close();
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
