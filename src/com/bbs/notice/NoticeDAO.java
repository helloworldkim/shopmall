package com.bbs.notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class NoticeDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	private static NoticeDAO instance = new NoticeDAO();
	
	private NoticeDAO() {
		
	}
	
	public static NoticeDAO getInstance() {
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
	//notice글 생성
	public int insertNotice(String bbsTitle, String bbsContent,String bbsAdminId) {
									//bbsid title content date adminid hit available 순서
		String sql = "insert into noticebbs values(notice_seq.nextval,?,?,sysdate,?,0,1)";
		try {
			conn=getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setString(3, bbsAdminId);
			return pstmt.executeUpdate(); //성공적으로 insert되면 양수반환
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			closeConnection(conn, pstmt, null, null);
		}
		return -1;//db오류
	}
	//모든 notice를 상위 10개 출력
		public ArrayList<NoticeDTO> getAllNoticeList() {
			ArrayList<NoticeDTO> list = new ArrayList<NoticeDTO>();
			//추후 참고용
			//String sql ="select bbsid,bbstitle,bbsdate,bbsadminId,bbshit,countBbsId from (select rownum num, N.* from(select * from bbsview where "+field+" like ? order by bbsdate desc) N) WHERE NUM BETWEEN ? AND ?";
			String sql="select * from (select * from noticebbs order by bbsdate desc) where rownum <=10";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				rs =pstmt.executeQuery();
				while(rs.next()) {
					NoticeDTO notice = new NoticeDTO();
					notice.setBbsId(rs.getInt(1));
					notice.setBbsTitle(rs.getString(2));
					notice.setBbsContent(rs.getString(3));
					notice.setBbsDate(rs.getString(4));
					notice.setBbsAdminId(rs.getString(5));
					notice.setBbsHit(rs.getInt(6));
					notice.setBbsAvailable(rs.getInt(7));
					list.add(notice);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}
				
			return list;
		}
		//글한개 리턴
		public NoticeDTO getNoticeById(int bbsId) {
			String sql = "select * from noticebbs where bbsid=?";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					NoticeDTO notice = new NoticeDTO();
					notice.setBbsId(rs.getInt(1));
					notice.setBbsTitle(rs.getString(2));
					notice.setBbsContent(rs.getString(3));
					notice.setBbsDate(rs.getString(4));
					notice.setBbsAdminId(rs.getString("bbsAdminId"));
					notice.setBbsHit(rs.getInt(6));
					notice.setBbsAvailable(rs.getInt(7));
					
					return notice;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}
			return null;
		}
		//조회수 증가
		public void increaseHit(int bbsId) {
			String sql="update noticebbs set bbshit = bbshit+1 where bbsid=?";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsId);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}

		}
		//Notice 글 한개 삭제
		public int deleteNoticeById(int bbsId) {
			int result=-1;
			String sql="delete from noticebbs where bbsid=?";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsId);
				return pstmt.executeUpdate(); //성공적으로 실행된경우 양수반환

			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, null);
			}
			return -1; //db오류
		}
		
		//다음글을 가져오는 메서드
		public NoticeDTO getNextBbs(int bbsId) {
			
			String sql = "select bbsid,bbstitle from noticebbs where bbsid = (select bbsid from noticebbs where bbsdate > (select bbsdate from noticebbs where bbsid=?) and rownum =1)";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					NoticeDTO notice = new NoticeDTO();
					notice.setBbsId(rs.getInt(1));
					notice.setBbsTitle(rs.getString(2));
					
					return notice;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}
			return null;	
		}
		//이전글을 가져오는 메서드
		public NoticeDTO getPrevBbs(int bbsId) {
			String sql = "select bbsid,bbsTitle from (select * from noticebbs order by bbsdate desc) where bbsdate < (select bbsdate from noticebbs where bbsid=?) and rownum=1";
			try {
				conn=getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bbsId);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					NoticeDTO notice = new NoticeDTO();
					notice.setBbsId(rs.getInt(1));
					notice.setBbsTitle(rs.getString(2));
					
					return notice;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				closeConnection(conn, pstmt, null, rs);
			}
			return null;		
		}
		
		
}