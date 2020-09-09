package com.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ProductDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	private static ProductDAO instance = new ProductDAO();
	
	public static ProductDAO getInstance() {
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

		public int InsertProduct(ProductDTO product) {
			String sql= "insert into product values(PRODUCT_SEQ.nextval,?,?,?,?,?,?,?,?,sysdate)";
			int result =0;
			try {
				conn= getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, product.getProductName());
				pstmt.setString(2, product.getShortDetail());
				pstmt.setString(3, product.getProductDetail());
				pstmt.setInt(4, product.getProductPrice());
				pstmt.setInt(5, product.getProductSalePer());
				pstmt.setInt(6, product.getProductSalePrice());
				pstmt.setString(7, product.getProductCategory());
				pstmt.setString(8,product.getProductImg());
				result = pstmt.executeUpdate(); //insert 됬을때 1반환
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, null);
			}
			return result; //안된경우 기본값 0반환
			
		}


		
		
}
