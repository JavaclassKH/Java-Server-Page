package webMessage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.complain.ComplainVO;
import admin.review.ReviewVO;
import common.GetConn;
import member.MemberVO;

public class WebMessageDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private WebMessageVO vo = null;
	private String sql = "";
	
	public WebMessageDAO() {}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null)
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
	}

	// 메세지 전체 리스트 보기
	public ArrayList<WebMessageVO> getMessageList(String mid, int mSw) {
		ArrayList<WebMessageVO> vos = new ArrayList<WebMessageVO>();
		
		try {
			if(mSw == 1) { // 받은 메세지(처음에는 전체 메세지를 가져옴)
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from webMessage where receiveId=? and (receiveSw='n' or receiveSw='r') order by idx desc";
			}
			else if(mSw == 2) { // 신규 메세지
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from webMessage where receiveId=? and receiveSw='n' order by idx desc";
			}
			else if(mSw == 3) { // 보낸 메세지
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from webMessage where sendId=? and sendSw='s' order by idx desc";
			}
			else if(mSw == 4) { // 수신 확인
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from webMessage where sendId=? and receiveSw='n' order by idx desc";
			}
			else if(mSw == 5) { // 휴지통
				sql = "select *,timestampdiff(hour, sendDate, now()) as hour_diff from webMessage where (receiveId = ? and receiveSw = 'g') or (sendId = ? and sendSw = 'g') order by idx desc";
			}
			else { // mSw가 0(메세지작성)이나 6(내용보기)일때
				return vos;
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			if(mSw == 5) {
				pstmt.setString(2, mid);				
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new WebMessageVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setSendId(rs.getString("sendId"));
				vo.setSendSw(rs.getString("sendSw"));
				vo.setSendDate(rs.getString("sendDate"));
				vo.setReceiveId(rs.getString("receiveId"));
				vo.setReceiveSw(rs.getString("receiveSw"));
				vo.setReceiveDate(rs.getString("receiveDate"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(메세지 전체리스트 보기[webMessageDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 메세지 보내기
	public int setWmInputOk(WebMessageVO vo) {
		int res = 0;
		System.out.println("vo : " + vo);
		try {
			sql = "insert into webMessage values (default,?,?,?,default,default,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getSendId());
			pstmt.setString(4, vo.getReceiveId());
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(메세지 보내기[webMessageDAO].) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 한 건의 메세지 내용 보기
	public WebMessageVO getWebMessageContent(int idx, int mFlag) {
		vo = new WebMessageVO();
		
		try {
			if(mFlag != 15) { // 휴지통이 아닌 받은 메세지,보낸 메세지에서의 처리
				sql = "update webMessage set receiveSw = 'r', receiveDate = now() where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				pstmt.executeUpdate();
				pstmtClose();
			}
			sql = "select * from webMessage where idx = ?";				
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setTitle(rs.getString("title"));
			vo.setContent(rs.getString("content"));
			vo.setSendId(rs.getString("sendId"));
			vo.setSendSw(rs.getString("sendSw"));
			vo.setSendDate(rs.getString("sendDate"));
			vo.setReceiveId(rs.getString("receiveId"));
			vo.setReceiveSw(rs.getString("receiveSw"));
			vo.setReceiveDate(rs.getString("receiveDate"));
			
		} catch (SQLException e) {
			System.out.println("SQL오류(메세지 한건 보기[webMessageDAO]) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 메세지 휴지통으로 이동
	public int WmDeleteCheck(int idx, int mSw) {
		int res = 0;
		
		try {
			if(mSw == 11) { // 받은편지함 => 휴지통
				sql = "update webMessage set receiveSw = 'g' where idx = ?";				
			}
			else {
				sql = "update webMessage set sendSw = 'x' where idx = ?";
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(메세지 휴지통으로 이동[webMessageDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 메세지 전체삭제(휴지통 비우기) [이때 receiveSw와 sendSw 모두 'x'면 실제로 자료 삭제처리]
	public int setWmDeleteAll(String mid) {
		int res = 0;
		
		try {			
			// 받은메세지에서의 완전삭제처리
			sql = "update webMessage set receiveSw = 'x' where receiveId = ? and receiveSw = 'g'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
			pstmt.close();
			
			// 보낸메세지에서의 완전삭제처리
			sql = "update webMessage set sendSw = 'x' where sendId = ? and sendSw = 'g'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
			pstmt.close();
			
			sql = "delete webMessage set sendSw = 'x' where sendId = ? and sendSw = 'g'";
			pstmt = conn.prepareStatement(sql);
			res = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			System.out.println("SQL오류(메세지 전체삭제(휴지통 비우기)[webMessageDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	
}
	


	

	
	
	



