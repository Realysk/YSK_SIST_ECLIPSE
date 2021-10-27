package javaexp.a00_exp.a07;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javaexp.a00_exp.z01_vo.Member;

public class A02_0708 {
	// 필드 선언.
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	// 공통메서드.
	public void setCon() throws SQLException{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String info = "jdbc:oracle:thin:@localhost:1521:XE";
		con = DriverManager.getConnection(info,"scott","tiger");
		System.out.println("접속성공!");
	}
	public Member login(String id, String pass) {
		Member mem = null;
		try {
			setCon();
			String sql = "SELECT * FROM MEMBER WHERE id = ? AND pass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				// Member(int mno, String id, String pass, String name, String auth, int point, Date regdte) 
				mem = new Member(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(6),
						rs.getDate(7)
					);
			}
			rs.close(); pstmt.close();con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return mem;
	}
	public boolean login(Member m) {
		boolean hasMember=false;
		try {
			setCon();
			String sql = "SELECT * FROM MEMBER WHERE id = ? AND pass = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			rs = pstmt.executeQuery();
			hasMember = rs.next();
			rs.close(); pstmt.close();con.close();		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(con!=null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return hasMember;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		A02_0708 dao = new A02_0708();
		Member m = dao.login("himan", "7777");
		if(m!=null)
		System.out.println(m.getName());
		System.out.println("회원 등록 여부:"
				+dao.login(new Member("higirl1","8888")));
		
		
		
/*
# 전날 정리문제
1. sql을 통해서 DAO에서 다중행 데이터와 단일행 데이터 처리방법의 차이를 기술하세요.
	1) 단일행 데이터 처리 : sql의 결과 내용이 단일행의 데이터 일때,
		if(rs.next()){
			참조변수 =  new 생성자(rs.get데이터유형(순서), .... );
		}
	2) 다중행 데이터 처리 : sql의 결과 내용이 다중행의 데이터 일때,
		while(rs.next()){
			list.add( new 생성자(rs.get데이터유형(순서), .... ) );
		}

2. PreparedStatement를 사용하는 이유와 기본 형식을 기술하세요.
	1) sql injection 방지 : 동적 sql로 우회적으로 데이터를 인증 처리 되는 것을
		막는다.
	2) 속도의 향상 : 매개값을 따로 전달함으로 동일한 sql로 인식하게 하여,
		컴파일 속도에 대한 향상으로 빠른 데이터 처리가 가능하게 한다.
	# 기본형식
	con.autoCommit(false);
	sql = "insert into emp02 values(?,?,?,?.....);
	pstmt = con.preparedStatement(sql);	
	pstmt.setInt(1, ins.getEmpno());
	pstmt.setString(2, ins.getEname());
	pstmt.setString(3, ins.getJob());
	....
	rs = pstmt.executeUpdate();
	con.commit();

3. DML처리의 기본 절차를 기본예제와 함께 기술하세요.
	1) sql 작성 확인
	2) sql 맞는 전달할 VO 객체 생성
	3) 기본 메서드형식 작성.
		public void XXXX( VO객체 ){}
	4) 오토커밋설정 :con.autoCommit(false);
	5) 대화, 실행
	6) 커밋처리 : con.commit();
	7) 자원해제
	8) 예외 처리 SQLException 에서 con.rollback();
4. 회원 테이블 member를 만들고, id, pass받아 로그인 처리하는 프로그램을 
	PreparedStatement 처리형식으로 만들어 보세요.
	1) 회원 테이블 만들기, 데이터 입력 member (회원번호, 아이디, 패스워드, 회원명, 권한, 포인트, 등록일 )
	2) sql 작성 및 확인  insert into member values(... );
	3) VO 객체 작성 Member
	4) 기본 전역변수 및 공통 연결 메서드 선언.
	5) public void insertMember(Member ins)
	6) ...
	
	
	
	
 * */
	}

}
