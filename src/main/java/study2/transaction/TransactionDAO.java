package study2.transaction;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.core.ContextNamingInfoListener;

import study2.transaction.BankBookVO;

public class TransactionDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	public TransactionDAO() {
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


	// mid를 bankBook 테이블에서 검색하여 해당 항목의 idx를 구해온다
	public BankBookVO getBankBookMidSearch(String mid) {
		BankBookVO vo = new BankBookVO();
		try {
			sql = "select * from bankBook where mid = ? order by idx desc limit 1";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(mid);
				vo.setBalance(rs.getInt("balance"));
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}
	
	
	// 사용내역 저장하기
	public void setBankBookHistoryInput(BankBookVO vo) {
		try {
			// false를 인자값으로 설정하여 수동 commit으로 지정
			conn.setAutoCommit(false);
			sql = "insert into bankBookHistory values (default, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getIdx());
			pstmt.setString(2, vo.getContent());
			pstmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			try {
				if(conn != null) conn.rollback();   // 예외오류 발생시 기존에 작업된 sql문이 모두 롤백된다
			} catch (Exception e2) {}
		} finally {
			pstmtClose();
		}		
	}

	// 실제 잔고에 적용
	public void setBankBookInput(BankBookVO vo) {
		try {
			sql = "insert into bankBook values (default, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setInt(2, vo.getBalance());
			pstmt.executeUpdate();
			
			// 정상적으로 작업단위가 종료된 후에 트랙잭션을 commit
			conn.commit();
		} catch (SQLException e) {
			System.out.println("SQL 오류 : " + e.getMessage());
			try {
				if(conn != null) conn.rollback();   // 예외오류 발생시 기존에 작업된 sql문이 모두 롤백된다
			} catch (Exception e2) {}
		} finally {
			pstmtClose();
		}		
	}


}















