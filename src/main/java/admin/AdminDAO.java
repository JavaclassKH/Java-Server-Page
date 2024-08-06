package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.complain.ComplainVO;
import admin.review.ReviewVO;
import common.GetConn;
import member.MemberVO;

public class AdminDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private MemberVO vo = null;
	private String sql = "";
	
	public AdminDAO() {}
	
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
	
	// 전체/부분 회원 가입리스트
	public ArrayList<MemberVO> getMemberlist(int level) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		
		try {
			if(level == 999) {
				sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select *, timestampdiff(day, lastDate, now()) as deleteDiff from member where level = ? order by idx";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, level);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNickName(rs.getString("nickName"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setHomePage(rs.getString("homePage"));
				vo.setJob(rs.getString("job"));
				vo.setHobby(rs.getString("hobby"));
				vo.setPhoto(rs.getString("photo"));
				vo.setContent(rs.getString("content"));
				vo.setUserInfor(rs.getString("userInfor"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setPoint(rs.getInt("point"));
				vo.setLevel(rs.getInt("level"));
				vo.setVisitCnt(rs.getInt("visitCnt"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setTodayCnt(rs.getInt("todayCnt"));
				
				vo.setDeleteDiff(rs.getInt("deleteDiff"));
				
				vos.add(vo);
			}			
		} catch (SQLException e) {
			System.out.println("SQL오류(전체회원리스트) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원등급변경
	public int setMemberLevelChange(int idx, int level) {
		int res = 0;
		
		try {
			sql = "update member set level = ?  where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL오류() : " + e.getMessage());
		} finally {
			pstmtClose();
		}	
		return res;
	}

	// 회원 영구탈퇴처리
	public int setMemberDeleteOk(int idx) {
		int res = 0;
		
		try {
			sql = "delete from member where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL오류(회원영구탈퇴) : " + e.getMessage());
		} finally {
			pstmtClose();
		}	
		return res;
	}

	// 신고내용 저장
	public int setBoardComplainInput(ComplainVO vo) {
		int res = 0;
		try {
			sql = "insert into complain values(default,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getCpMid());
			pstmt.setString(4, vo.getCpContent());
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SQL오류(신고내용 저장) : " + e.getMessage());
		} finally {
			pstmtClose();
		}	
		return res;
	}

	// 현재 게시글의 신고 유무 확인
	public String getReportCheck(String part, int idx) {
		String report = "NO";
		
		try {
			sql = "select idx from complain where part = ? and partIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part);
			pstmt.setInt(2, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) report = "OK";
			
		} catch (Exception e) {
			System.out.println("SQL오류(현재 게시글 신고여부 확인) : " + e.getMessage());
		} finally {
			rsClose();
		}	
		return report;
	}

	// 신고글항목 전체조회!
	public ArrayList<ComplainVO> ComplainList() {
		ArrayList<ComplainVO> vos = new ArrayList<ComplainVO>();
		ComplainVO vo = null;
		try {
			sql = "select date_format(c.cpDate, '%Y-%m-%d %H:%i') as cpDate, c.* , b.title as title , b.nickName as nickName, b.mid as mid, b.complain as complain "
					+ "from complain c, board b where c.partIdx = b.idx order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new ComplainVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setPart(rs.getString("part"));
				vo.setPartIdx(rs.getInt("partIdx"));
				vo.setCpMid(rs.getString("cpMid"));
				vo.setCpDate(rs.getString("cpDate"));
				vo.setCpContent(rs.getString("cpContent"));
				vo.setComplain(rs.getString("complain"));
				
				vo.setTitle(rs.getString("title"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				
				vos.add(vo);
			}
		} catch (Exception e) {
			System.out.println("SQL오류(신고글항목 전체조회) : " + e.getMessage());
		} finally {
			rsClose();
		}			
		return vos;
	}

	// 신고글 게시판 공개 여부 조정 처리
	public void setComplainNoShow(String part, int partIdx, String complain) {	
		try {
			if(complain.equals("NO")) {
				sql = "update "+part+" set complain = 'OK' where idx = ?";				
			}
			else {
				sql = "update "+part+" set complain = 'NO' where idx = ?";			
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, partIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(신고글 게시판 공개 여부 조정 처리) : " + e.getMessage());
		} finally {
			pstmtClose();
		}			
	}

	// 리뷰를 작성했는지 여부 체크
	public int getReviewSearch(ReviewVO vo) {
		int res = 0;
		try {
			sql = "select * from review where part = ? and partIdx = ? and mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getMid());
			rs = pstmt.executeQuery();
			if(rs.next()) res = 1;
		} catch (SQLException e) {
			System.out.println("SQL오류(리뷰작성여부체크[adminDAO])) : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return res;
	}

	//리뷰작성 처리하기
	public int setReviewInputOk(ReviewVO vo) {
		int res = 0;
		try {
			sql = "insert into review values (default,?,?,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getMid());
			pstmt.setString(4, vo.getNickName());
			pstmt.setInt(5, vo.getStar());
			pstmt.setString(6, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(리뷰작성[adminDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();			
		}
		return res;
	}

	// 리뷰 내역 전체리스트 가져오기
	public ArrayList<ReviewVO> getReviewList(int idx, String part) {
		ArrayList<ReviewVO> rVos = new ArrayList<ReviewVO>();
		try {
			sql = "select * from review where part = ? and partIdx = ? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, part);
			pstmt.setInt(2, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewVO vo = new ReviewVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setPart(rs.getString("part"));
				vo.setPartIdx(rs.getInt("partIdx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setStar(rs.getInt("star"));
				vo.setContent(rs.getString("content"));
				vo.setrDate(rs.getString("rDate"));
				
				rVos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(리뷰전체가져오기[adminDAO]) : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return rVos;
	}

	// 리뷰 삭제하기
	public int setReviewDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from review where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL오류(리뷰삭제[adminDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();			
		}
		return res;
	}

	// 리뷰 답글 저장하기
	public int setReviewReplyInputOk(ReviewVO vo) {
		int res = 0;
		try {
			sql = "insert into reviewReply values (default,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getIdx());
			pstmt.setString(2, vo.getReplyMid());
			pstmt.setString(3, vo.getReplyNickName());
			pstmt.setString(4, vo.getReplyContent());
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(리뷰답글저장[adminDAO]) : " + e.getMessage());
		} finally {
			pstmtClose();			
		}
		return res;
	}
	

	
	
	


}
