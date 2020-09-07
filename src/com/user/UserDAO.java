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
		 String userid = "shopmall";
		 String userpassword = "shopmall";
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
	//유저insert
	public int insertUser(UserDTO user) {
		String sql= "insert into shopuser values(?,?,?,?,?,?,?,?,'Y','Y',?,?)";
		int result =0;
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2, user.getUserId());
			pstmt.setString(3, user.getUserPwd());
			pstmt.setString(4, user.getUserPhone());
			pstmt.setString(5, user.getUserBirth());
			pstmt.setString(6, user.getUserEmail());
			pstmt.setInt(7, user.getAdmin());
			pstmt.setString(8,user.getEmailAgreement());
			pstmt.setInt(9, user.getUserZipcode());
			pstmt.setString(10, user.getUserAddress());
			result = pstmt.executeUpdate(); //insert 됬을때 1반환
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, null);
		}
		return result; //안된경우 기본값 0반환
	}
	//login때 사용되는 함수
	public int findUserById(String userId,String userPwd) {
		String sql= "select * from shopuser where userId=?";
		String tempPwd="";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				tempPwd =rs.getString("userpwd");
				if(tempPwd.equals(userPwd)) {
					return 1; //db등록된 비밀번호와 사용자가 입력한 비밀번호가 같을경우 1
				}else {
					return 2; //등록된 사용자는 있지만 비밀번호가 다를경우 2
				}
			}
			return 0; //아이디로 조회되는값이 없는경우 0

			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}
		return -1; //db오류 -1
	}
	//id중복체크 메서드
	public int idCheck(String userId) {
		String sql = "select count(userid) from shopuser where userid=?";
		int count=0;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			return count = rs.getInt(1);//실행결과가 있으면 1반환
			}
			return count; //없으면 0;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}

		return count; //-1 db오류
	}

	public int getAdmin(String userId) {
		String sql = "select admin from shopuser where userid=?";
		int count=-1;
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			return count = rs.getInt(1);//실행결과가 있으면 admin반환
			}
			return count; //없으면 0;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, rs);
		}

		return count; //db오류 -1
	}
}
