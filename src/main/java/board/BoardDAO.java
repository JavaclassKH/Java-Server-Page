package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;
import member.MemberVO;

public class BoardDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private BoardVO vo = null;
	private String sql = "";
	
	
	public BoardDAO() {}
	
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
	
	
	/*  ======================================================================
	  -- 시간단위 날짜비교 , 23이 나오면 작성한지 23시간이 지났다는 것
			select *, timestampdiff(hour, wDate, now()) as hour_diff from board;

		-- 날짜단위 비교 , 0은 오늘 , -1은 하루 지남
			select *, datediff(wDate, now()) as date_diff from board;
	
	
	
	
	
	
	
	
	
	
	
	
	                      
	
	
	
	
	
	====================================================================== */

// 전체 게시글 보기
	public ArrayList<BoardVO> getBoardList(int startIndexNo, int pageSize) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "select *, datediff(wDate, now()) as date_diff, timestampdiff(hour, wDate, now()) as hour_diff from board order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				
				vo.setHour_diff(rs.getInt("hour_diff"));
				vo.setDate_diff(rs.getInt("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("SQL 오류(게시글목록보기) : " + e.getMessage());
		} finally {
			rsClose();			
		}
		return vos;
	}

	// 게시글 등록
	public int setBoardInput(BoardVO vo) {
		int res = 0;
		try {
			sql = "insert into board values (default,?,?,?,?,default,?,?,default,default);";
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getHostIp());
			pstmt.setString(6, vo.getOpenSw());
				
			res = pstmt.executeUpdate();		
			
		} catch (SQLException e) {
			System.out.println("SQL오류(게시글등록) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 게시글 내용보기
	public BoardVO getBoardContent(int idx) {
		BoardVO vo = new BoardVO();
		
		try {
			sql = "select * from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setHostIp(rs.getString("hostIp"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
			}			
		
		} catch (SQLException e) {
			System.out.println("SQL오류(게시글보기) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 조회수 증가 
	public void setBoardReadNumPlus(int idx) {	
		
		try {
			sql = "update board set readNum = readNum + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);	
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("SQL오류(조회수 증가) : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 게시글 삭제하기
	public int setBoardDelete(int idx) {
		int res = 0;
		try {
			sql = "delete from board where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);	
			res = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("SQL오류(게시글 삭제) : " + e.getMessage());
		} finally {
			pstmtClose();
		}		
		return res;
	}

	// 게시물 총 레코드 건수 구하기 [게시판 페이징 처리]
	public int gettotRecCnt() {
		int totRecTot = 0;
		try {
			sql = "select count(*) as cnt from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totRecTot = rs.getInt("cnt");		
			
		} catch (SQLException e) {
			System.out.println("SQL오류(게시물 개수 구하기,페이징처리) : " + e.getMessage());
		} finally {
			rsClose();
		}		
		return totRecTot;
	}

	// 이전글, 다음글의 idx와 title 가져오기
	public BoardVO getPreNextSearch(int idx, String str) {
		BoardVO vo = new BoardVO();
		try {
			if(str.equals("preVo")) sql = "select idx, title from board where idx < ? order by idx desc limit 1";
			else sql = "select idx, title from board where idx > ? order by idx limit 1";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setTitle(rs.getString("title"));
			}
		} catch (SQLException e) {
			System.out.println("SQL오류(게시물 개수 구하기,페이징처리) : " + e.getMessage());
		} finally {
			rsClose();
		}				
		return vo;
	}

	// 좋아요 수 증가 처리
	public int setBoardGoodCheck(int idx) {
		int res = 0;
		
		try {
			sql = "update board set good = good + 1 where idx = ?";		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			System.out.println("SQL오류(좋아요수증가) : " + e.getMessage());
		} finally {
			pstmtClose();
		}		
		return res;
	}

	// 좋아요 수 증가,감소 같이 처리
	public void setBoardGoodCheckPlusMinus(int idx, int goodCnt) {
		
		try {
			sql = "update board set good = good + ? where idx = ?";		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodCnt);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(좋아요수증가,감소 동시처리) : " + e.getMessage());
		} finally {
			pstmtClose();
		}		
	}

	// 게시글 수정 처리
	public int setBoardUpdateOk(BoardVO vo) {
		int res = 0;
		
		try {
			sql = "update board set title = ? , content = ? , opensw = ? , hostIp = ? , wDate = now() where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getOpenSw());
			pstmt.setString(4, vo.getHostIp());
			pstmt.setInt(5, vo.getIdx());
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(게시글수정) : " + e.getMessage());
		} finally {
			pstmtClose();
		}		
		return res;
	}


	
	
	
	


}


	
