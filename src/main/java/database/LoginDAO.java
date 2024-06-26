package database;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LoginDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	LoginVO vo = null;
	private String sql = "";
	
	public LoginDAO() {
		String url = "jdbc:mysql://localhost:3306/javaclass";
		String user = "root";
		String password = "1234";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 못찾음 : " + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 연동 실패 : " + e.getMessage());
		}
		
	}
		
		// conn 객체의 반납
		public void connClose() {
			if(conn != null) {
				try {
					conn.close();
				} catch (Exception e) {}
			}
		}
	
		// pstmt 객체의 반납
		public void pstmtClose() {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {}
			}
		}
		
		// rs 객체의 반납
		public void rsClose() {
			if(pstmt != null) {
				try {
					rs.close();
					pstmtClose();
				} catch (Exception e) {}
			}
		}

		// 아이디, 비밀번호 체크
		public LoginVO getLoginIdCheck(String mid, String pwd) {
			LoginVO vo = new LoginVO();
				try {
					sql = "select * from hoewon where mid=? and pwd=?;";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mid);
					pstmt.setString(2, pwd);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						vo.setIdx(rs.getInt("idx"));
						vo.setMid(rs.getString("mid"));
						vo.setPwd(rs.getString("pwd"));
						vo.setName(rs.getString("name"));
						vo.setAge(rs.getInt("age"));
						vo.setGender(rs.getString("gender"));
						vo.setAddress(rs.getString("address"));
					}
					
				} catch (Exception e) {
					System.out.println("SQL 오류(아이디체크) : " + e.getMessage());
				} finally {
					rsClose();
				}
				
			return vo;
		}
		
		// 최근 가입한 회원 5명 정보 가져오기
		public ArrayList<LoginVO> getLoginFiveList() {
			ArrayList<LoginVO> vos2 = new ArrayList<LoginVO>();
			
			try {
				sql = "select * from hoewon order by idx desc limit 5;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();			
				
				while(rs.next()) {
					vo = new LoginVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setAddress(rs.getString("address"));
					vos2.add(vo);
				}		
			} catch (Exception e) {
				System.out.println("SQL 오류(최근 5명 회원) : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos2;
		}		
					
		// 전체회원정보검색
		public ArrayList<LoginVO> getLoginList() {
			ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
			
			try {
				sql = "select * from hoewon";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new LoginVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setAddress(rs.getString("address"));
					vos.add(vo);
				}
				
			} catch (Exception e) {
				System.out.println("SQL 오류(전체회원조회) : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}
		
		// 회원가입하기
		public int setLoginInput(LoginVO vo) {
			int res = 0;			
			try {
				sql = "insert into hoewon values (default, ?, ?, ?, ?, ?, ?);";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,vo.getMid());
				pstmt.setString(2,vo.getPwd());
				pstmt.setString(3,vo.getName());
				pstmt.setInt(4,vo.getAge());
				pstmt.setString(5,vo.getGender());
				pstmt.setString(6,vo.getAddress());
				res = pstmt.executeUpdate();
				
			} catch (Exception e) {
				System.out.println("SQL 오류(회원가입) : " + e.getMessage());
			} finally {
				pstmtClose();
			}		
		  return res;
		}

		// 최근 가입한 5명 정보 검색하기! (선생님 예시)
		public ArrayList<LoginVO> getRecentFiveMember() {
			ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
			
			try {
				sql = "select * from hoewon order by idx desc limit 5;";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new LoginVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setAddress(rs.getString("address"));
					vos.add(vo);
				}
				
			} catch (Exception e) {
				System.out.println("SQL 오류(전체회원조회) : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}

		// 개별회원조회
		public ArrayList<LoginVO> getLoginSearch(String name) {
			ArrayList<LoginVO> vos = new ArrayList<LoginVO>();		
			try {
				sql = "select * from hoewon where name like ? order by name";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+name+"%");
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new LoginVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setAddress(rs.getString("address"));
					vos.add(vo);
				}
				
			} catch (Exception e) {
				System.out.println("SQL 오류(개별회원조회-이름) : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}

		// idx로 검색
		public LoginVO getLoginIdxsearch(int idx) {
			LoginVO vo = new LoginVO();
			try {
				sql = "select * from hoewon where idx=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setAddress(rs.getString("address"));
				}
			} catch (Exception e) {
				System.out.println("SQL 오류(idx로 검색) : " + e.getMessage());
			} finally {
				rsClose();
			}			
			return vo;	
		}

		// 회원정보수정
		public int setLoginUpdate(LoginVO vo) {
			int res = 0;
			
			try {
				sql = "update hoewon set pwd=?, name=?, age=?, gender=?, address=? where idx=?;";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getPwd());
				pstmt.setString(2, vo.getName());
				pstmt.setInt(3, vo.getAge());
				pstmt.setString(4, vo.getGender());
				pstmt.setString(5, vo.getAddress());
				pstmt.setInt(6, vo.getIdx());
				res = pstmt.executeUpdate();
				System.out.println("res : " + res);
				
			} catch (Exception e) {
				System.out.println("SQL 오류(회원정보수정) : " + e.getMessage());
			} finally {
				pstmtClose();
			}	
			return res;
		}

		// 회원탈퇴처리
		public void setLoginDelete(String mid) {
			try {
				sql = "delete from hoewon where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL 오류 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
		}

		// 전체회원조회(정렬)
		public ArrayList<LoginVO> SortList(String sort) {
			ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
			
			try {
				sql = "select * from hoewon order by "+sort;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new LoginVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setAddress(rs.getString("address"));
					vos.add(vo);
				}
				
			} catch (Exception e) {
				System.out.println("SQL 오류(전체회원조회-정렬) : " + e.getMessage());
			} finally {
				rsClose();
			}	
			return vos;
		}

		// 전체회원 건수를 구한다
		public int gettotRecCnt() {
			int totRecCnt = 0;
			
			try {
				sql = "select count(*) as cnt from hoewon";
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

		// 아이디 검색하여 vo객체에 담아 반환
		public LoginVO getLoginIdSearch(String mid) {
			vo = new LoginVO();
			try {
				sql = "select * from hoewon where mid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setAddress(rs.getString("address"));
				}
			} catch (Exception e) {
				System.out.println("SQL 오류(mid로 검색) : " + e.getMessage());
			} finally {
				rsClose();
			}			
			return vo;	
		}

		// (조건 없이)전체자료조회
		public ArrayList<LoginVO> getLoginAllList() {
			ArrayList<LoginVO> vos = new ArrayList<LoginVO>();
			
			try {
				sql = "select * from hoewon order by idx desc";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					vo = new LoginVO();
					vo.setIdx(rs.getInt("idx"));
					vo.setMid(rs.getString("mid"));
					vo.setPwd(rs.getString("pwd"));
					vo.setName(rs.getString("name"));
					vo.setAge(rs.getInt("age"));
					vo.setGender(rs.getString("gender"));
					vo.setAddress(rs.getString("address"));
					vos.add(vo);
				}
				
			} catch (Exception e) {
				System.out.println("SQL 오류(전체회원조회) : " + e.getMessage());
			} finally {
				rsClose();
			}
			return vos;
		}
		
			// 아이디 중복확인
			public LoginVO getLoginIdIsHere(String mid) {
				vo = new LoginVO();
				try {
					sql = "select * from hoewon where mid=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, mid);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						vo.setIdx(rs.getInt("idx"));
						vo.setMid(rs.getString("mid"));
						vo.setPwd(rs.getString("pwd"));
						vo.setName(rs.getString("name"));
						vo.setAge(rs.getInt("age"));
						vo.setGender(rs.getString("gender"));
						vo.setAddress(rs.getString("address"));
					}
				} catch (Exception e) {
					System.out.println("SQL 오류(mid로 검색) : " + e.getMessage());
				} finally {
					rsClose();
				}			
				return vo;	
			}

		
		
}




