package com.product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
			String sql= "insert into product values(PRODUCT_SEQ.nextval,?,?,?,?,?,?,?,?,sysdate,0)";
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
		//기본 카테고리로 검색!
		public ArrayList<ProductDTO> getProductList(String category) {
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			String sql = "select * from product where productcategory like ?";
			try {
				conn= getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+category+"%");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProductDTO pDTO =new ProductDTO();
					pDTO.setProductId(rs.getInt("productid"));
					pDTO.setProductName(rs.getString("productname"));
					pDTO.setShortDetail(rs.getString("shortdetail"));
					pDTO.setProductDetail(rs.getString("productdetail"));
					pDTO.setProductPrice(rs.getInt("productprice"));
					pDTO.setProductSalePer(rs.getInt("productsaleper"));
					pDTO.setProductSalePrice(rs.getInt("productsaleprice"));
					pDTO.setProductCategory(rs.getString("productcategory"));
					pDTO.setProductDate(rs.getString("productdate"));
					pDTO.setProductImg(rs.getString("productImg"));
					pDTO.setProductHit(rs.getInt("producthit"));
					list.add(pDTO);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}
			
			return list;
		}
		//bestitem 정렬함 기본 category는 공백으로해서 모든제품중 hit가 가장 많은순서대로!
		public ArrayList<ProductDTO> getProductListByHit(String category) {
			ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
			String sql = "select * from (select * from product order by producthit desc) where productcategory like ?";
			try {
				conn= getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+category+"%");
				rs = pstmt.executeQuery();
				while(rs.next()) {
					ProductDTO pDTO =new ProductDTO();
					pDTO.setProductId(rs.getInt("productid"));
					pDTO.setProductName(rs.getString("productname"));
					pDTO.setShortDetail(rs.getString("shortdetail"));
					pDTO.setProductDetail(rs.getString("productdetail"));
					pDTO.setProductPrice(rs.getInt("productprice"));
					pDTO.setProductSalePer(rs.getInt("productsaleper"));
					pDTO.setProductSalePrice(rs.getInt("productsaleprice"));
					pDTO.setProductCategory(rs.getString("productcategory"));
					pDTO.setProductDate(rs.getString("productdate"));
					pDTO.setProductImg(rs.getString("productImg"));
					pDTO.setProductHit(rs.getInt("producthit"));
					list.add(pDTO);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}
			
			return list;
		}
		//신상품은 등록 날짜를 기준으로해서 검색한 리스트!
				public ArrayList<ProductDTO> getProductListByDate(String category) {
					ArrayList<ProductDTO> list = new ArrayList<ProductDTO>();
					String sql = "select * from (select * from product order by productdate desc) where productcategory like ?";
					try {
						conn= getConnection();
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%"+category+"%");
						rs = pstmt.executeQuery();
						while(rs.next()) {
							ProductDTO pDTO =new ProductDTO();
							pDTO.setProductId(rs.getInt("productid"));
							pDTO.setProductName(rs.getString("productname"));
							pDTO.setShortDetail(rs.getString("shortdetail"));
							pDTO.setProductDetail(rs.getString("productdetail"));
							pDTO.setProductPrice(rs.getInt("productprice"));
							pDTO.setProductSalePer(rs.getInt("productsaleper"));
							pDTO.setProductSalePrice(rs.getInt("productsaleprice"));
							pDTO.setProductCategory(rs.getString("productcategory"));
							pDTO.setProductDate(rs.getString("productdate"));
							pDTO.setProductImg(rs.getString("productImg"));
							pDTO.setProductHit(rs.getInt("producthit"));
							list.add(pDTO);
						}
						
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						closeConnection(conn, pstmt, null, rs);
					}
					
					return list;
				}
		//상품 상세보기 페이지를위한 id로 조회하는부분
		public ProductDTO getProductById(int productId) {
			String sql= "select * from product where productid=?";
			try {
				conn= getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, productId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					ProductDTO p = new ProductDTO();
					p.setProductId(rs.getInt("productid"));
					p.setProductName(rs.getString("productname"));
					p.setShortDetail(rs.getString("shortdetail"));
					p.setProductDetail(rs.getString("productdetail"));
					p.setProductPrice(rs.getInt("productprice"));
					p.setProductSalePer(rs.getInt("productsaleper"));
					p.setProductSalePrice(rs.getInt("productsaleprice"));
					p.setProductCategory(rs.getString("productcategory"));
					p.setProductDate(rs.getString("productdate"));
					p.setProductImg(rs.getString("productImg"));
					p.setProductHit(rs.getInt("producthit"));
					return p;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}
			return null;
			
		}

		//조회수 증가
		public void increaseHit(int productId) {
			String sql="update product set producthit = producthit+1 where productId=?";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, productId);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, null);
			}

		}
		

		
		
}
