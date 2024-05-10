package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GuestDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	GuestVO vo = null;
	String sql = "";
	
	public GuestDAO() {
		String url = "jdbc:mysql://localhost:3306/javaclass";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 검색 실패~~" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("DB연동 실패~~");
		}
	}
	
	
	public void connClose() {
		if(conn != null)
		try { conn.close(); } 
		catch (SQLException e) {}
	}
	
	public void pstmtClose() {
		if(pstmt != null)
		try { pstmt.close(); } 
		catch (SQLException e) {}
	}
	
	public void rsClose() {
		if(rs != null)
			try { 
				rs.close(); 
				pstmtClose();
			} 
		catch (SQLException e) {}
	}


	// 방명록 전체자료검색
	public ArrayList<GuestVO> getGuestList(int startIndexNo, int pageSize) {
		ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
		
		try {
			sql = "select * from guest order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
		
			while(rs.next()) {
				vo = new GuestVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setName(rs.getString("name"));
				vo.setContent(rs.getString("content"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homepage"));
				vo.setVisitDate(rs.getString("visitDate"));
				vo.setHostIp(rs.getString("hostIp"));
				vos.add(vo);
			}
		} catch (Exception e) {
			System.out.println("SQL오류(전체자료검색) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}


	// 방명록 글 등록
	public int setGuestInput(GuestVO vo) {
		int res = 0;
		
		try {
			sql = "insert into guest values (default,?,?,?,?,default,?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getHomePage());
			pstmt.setString(5, vo.getHostIp());
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL오류(방명록글등록) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}


	public int setGuestDelete(int idx) {
		int res = 0;
		
		try {
			sql = "delete from guest where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL오류(방명록글삭제) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}


	// 방명록 글 총 개수 구하기 
	public int gettotRecCnt() {
		int totRecCnt = 0;
		
		try {
			sql = "select count(*) as cnt from guest";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			totRecCnt = rs.getInt("cnt"); 
				
		} catch (Exception e) {
			System.out.println("SQL오류(방명록글개수구하기) : " + e.getMessage());
		} finally {
			rsClose();
		}		
		return totRecCnt;
	}


	// 로그인한 회원이 방명록에 올린글 리스트 가져오기
	public ArrayList<GuestVO> getMemberGuestSearch(String mid, String name, String nickName) {
			ArrayList<GuestVO> vos = new ArrayList<GuestVO>();
			try {
				sql = "select * from guest where name=? or name=? or name=? order by idx desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, name);
				pstmt.setString(3, nickName);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new GuestVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setName(rs.getString("name"));
					vo.setContent(rs.getString("content"));
					vo.setEmail(rs.getString("email"));
					vo.setHomePage(rs.getString("homePage"));
					vo.setVisitDate(rs.getString("visitDate"));
					vo.setHostIp(rs.getString("hostIp"));
					vos.add(vo);
				}
			} catch (SQLException e) {
				System.out.println("SQL 오류(메인화면에 띄울 방명록 글 개수) : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}
	
	
	
	
	
	
}

















