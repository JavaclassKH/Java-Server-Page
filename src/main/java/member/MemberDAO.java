package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class MemberDAO {
	
	private Connection conn = GetConn.getConn();
	private Connection conn2 = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private MemberVO vo = null;
	private String sql = "";
	
	
	public MemberDAO() {}
	
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

	// 로그인시 아이디 체크하기 , 개인회원정보!
	public MemberVO getMemberIdCheck(String mid) {
		MemberVO vo = new MemberVO();
		
		try {
			sql = "select * from member where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
			}			
		} catch (SQLException e) {
			System.out.println("SQL오류(로그인시 아이디) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 회원가입 처리
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,default,default,default,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getName());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthday());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getHomePage());
			pstmt.setString(11, vo.getJob());
			pstmt.setString(12, vo.getHobby());
			pstmt.setString(13, vo.getPhoto());
			pstmt.setString(14, vo.getContent());
			pstmt.setString(15, vo.getUserInfor());
			res = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("SQL오류(회원가입) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

  // // 로그인 시 변경된 정보들(방문카운트 포인트 등)을 DB에 업데이트
	public void setLoginUpdate(MemberVO vo) { 
		 sql = "update member set point = ?, lastDate = now(), visitCnt = visitCnt + 1, todayCnt = ? where mid = ?";

		 try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, vo.getPoint());
			 pstmt.setInt(2, vo.getTodayCnt());
			 pstmt.setString(3, vo.getMid());
			 pstmt.executeUpdate();
		 } catch (SQLException e) {
			 	System.out.println("SQL 오류(방문카운트,포인트,오늘접속날짜) : " + e.getMessage());
		 }		 
	 }

	// 전체회원 가입리스트
	public ArrayList<MemberVO> getMemberlist() {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		
		try {
			sql = "select * from member order by idx";
			pstmt = conn.prepareStatement(sql);
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
				
				vos.add(vo);
			}			
		} catch (SQLException e) {
			System.out.println("SQL오류(전체회원리스트) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 비밀번호 변경!
	public int setMemberPwdChange(String mid, String pwd) {
		int res = 0;
		 try {
			 sql = "update member set pwd = ? where mid = ?";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, pwd);
			 pstmt.setString(2, mid);
			 res = pstmt.executeUpdate();
		 } catch (SQLException e) {
			 	System.out.println("SQL 오류(비밀번호 수정) : " + e.getMessage());
		 }		 
		 return res;
	 }

	public int setMemberUpdate(MemberVO vo) {
		int res = 0;
		
		try {
			sql = "update member set nickName = ?, name = ?, gender = ?, birthday = ?, tel = ?, address = ?, "
					+ "email = ?, homePage = ?, job = ?, hobby = ?, photo = ?, content = ?, userInfor = ? where mid = ?";                         
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getGender());
			pstmt.setString(4, vo.getBirthday());
			pstmt.setString(5, vo.getTel());
			pstmt.setString(6, vo.getAddress());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getHomePage());
			pstmt.setString(9, vo.getJob());
			pstmt.setString(10, vo.getHobby());
			pstmt.setString(11, vo.getPhoto());
			pstmt.setString(12, vo.getContent());
			pstmt.setString(13, vo.getUserInfor());
			pstmt.setString(14, vo.getMid());
			res = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("SQL오류(회원정보수정) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	// 회원탈퇴처리
	public int setMemberDeleteUpdate(String mid) {
		int res = 0;		
		
		try {
			sql = "update member set userDel = 'OK' , level = 99 where mid = ?";                         
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			res = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("SQL오류(회원탈퇴처리) : " + e.getMessage());
		} finally {
			pstmtClose();
		}			
		return res;
	}

	// 관리자메뉴에서 회원리스트 보기(회원레벨별)
	public ArrayList<MemberVO> getAdminMemberlist(int level) {
	ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		
		try {
			sql = "select * from member where level = " + level;
			pstmt = conn.prepareStatement(sql);
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
				
				vos.add(vo);
			}			
		} catch (SQLException e) {
			System.out.println("SQL오류(전체회원리스트-관리자) : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

}
