package study2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StudyDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	public StudyDAO() {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/javaclass";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 없음 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연결 실패 : " + e.getMessage());
		}	
	}
		
	public void connClose() {
		if(conn != null)
			try { conn.close(); } catch (SQLException e) {}
	}
	
	public void pstmtClose() {
		if(pstmt != null)
			try { pstmt.close(); } catch (SQLException e) {}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmtClose();
			} catch (SQLException e) {}
		}
	}

	// hoewon테이블에서 아이디 검색 후 성명(name) 반환하기
	public String getIdSearch(String mid) {
		String name = "";
		
		try {
			sql = "select name from hoewon where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
	
			if(rs.next()) name = rs.getString("name");
			
		} catch (SQLException e) {
			System.out.println("SQL 오류(아이디검색) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return name;
	}
}















