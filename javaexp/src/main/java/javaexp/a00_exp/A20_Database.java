package javaexp.a00_exp;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

import javaexp.a00_exp.z01_vo.Product;

public class A20_Database {
	
	/*
	 # 0708 정리 문제 #
		1. Dao의 주요 필드 4가지 역할을 기술하세요.
	
				private Connection con;
				private Statement stmt;
				private PreparedStatement pstmt; : sql을 실행하는 객체
				private ResultSet rs; : select의 결과를 2차원 형식으로 받는 객체
				필드는 각 기능 메서드에서 공통/중복적으로 사용되기 때문에 선언하여 참조변수로 활용할 수 있다.
				ex) setCon() 기능 메서드에 의해서 Connection 객체에 데이터를 할당 처리한다.
	
		2. jdbc 드라이버의 역할에 대하여 기술하세요.
	
			java로 서버에 접속하기 위해 복잡한 프로그램이 필요하다.
			이 중에서 공통적인 부분을 클래스로 만들어 압축하여 개발자의 서버 접속에 필요하는 대부분의 내용 중
			변경이 필요 없는 부분은 각 DB 서버 회사에서 만들어 제공하고 있다. 이것을 드라이버라고 한다.
			java database connection driver 접속할 때 메모리에 로딩하여 시작한다.
			
			jdbc 드라이버는 소켓 통신을 통해 여러 모듈을 필요로 하며 각 DB 서버를 다루는 회사에서 지원한다.
			(XX.jar 형태로 지원)
	
		3. 특정 서버 접속정보 처리 기능 객체와 메서드의 매개변수값을 기술하세요.
		
			1) jdbc 드라이버를 Class.forName("드라이버명") 메모리 로딩.
			
			2) DriverManager.getConnection("드라이버,접속IP,port,sid","계정","비밀번호")
				=> 결과 return값으로 Connection에 메모리를 할당 처리한다.
	
	
				public void setCon() throws SQLException {
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					String info = "jdbc:oracle:thin:@localhost:1521:xe";
					con = DriverManager.getConnection(info,"scott","tiger");
					System.out.println("Database에 연결 되었습니다!");
				}
	
		4. 기능 메서드(조회) 구현의 순서와 핵심 코드를 기술하세요.
		
			- 강사님 답 -
		
			0) SQL 작성
				- 입력, 결과값 확인
					select *
					from emp
					where ename like '%'||'A'||'%'
					and job like '%'||'B'||'%';
					
			1) 기능 메서드의 구조를 만들기
				- 결과로 어떤 데이터를 가져올 것인가? return값 형식/객체 ArrayList
				- DB 서버에 입력 데이터는 무엇인가? 매개변수 선언
				- return할 객체 선언과 할당
				- public ArrayList<Emp> emplist(Emp sch) {
					ArrayList<Emp> list = new ArrayList<Emp>();
					
					return list;
				}
				  
			2) 공통 연결 메서드 호출 setCon()과 기본 try {} catch(SQLException) {} 예외처리
				Connection con 에 메모리가 로딩 된 상황
				
			3) Statement 필드에 선언한 대화겍체에 메모리 로딩
				stmt = con.createStatement();
				- 대화객체 만들기
				
			4) ResultSet 객체 만들기, stmt에 sql로 수행 된 결과 객체 메모리 로딩
				rs = stmt.executeQuery(sql);
				
			5) while문 if문을 통해서 rs의 next()로 행 단위로 이동하면서 rs.getXXX("컬럼명"|순서index)로 가져 온 데이터를 객체에 할당
			  while(rs.next()) {
			  	list.add(new EMP(rs.getInt("empno"),.......));
			  }
			
			6) 자원의 해제 : 역순위 자원헤제 처리
				rs.close(); stmt.close(); con.close();
				
			7) 기타 예외 내용 처리
	
           ---------------------------------------------------------------------------------------------------
	
			1) 연결 할 공통 메서드를 호출한다.
				try {
					setCon();
			
			2) SQL에 있는 컬럼명을 문자열로 할당한다.
				String sql = "SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno \r\n"
						+ "FROM emp02";
			
			3) Statement 객체를 생성 한다.
				stmt = con.createStatement();
			
			4) ResultSet 객체를 생성 후 DB를 불러온다.
				rs = stmt.executeQuery(sql);
			
			5) 생성한 역순으로 자원을 해제 한다.
				rs.close(); stmt.close(); con.close();
			
			6) 예외처리를 통해 기타 예외처리를 한다.
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	
 		   ---------------------------------------------------------------------------------------------------
	
		5. ResultSet 객체의 주요 메서드와 그 기능을 기술하세요.
		
			- 강사님 답 -
		
			rs.next() : 행 단위로 이동하면서 다음 행의 데이터가 있는지 여부(true/false)를 나타냄
			rs.get데이터유형("컬럼명")
			rs.get데이터유형(1부터 시작하는 번호) select의 선언 된 순서로 호출한다.
				
			ex)
			while(rs.next()) {
				rs.getInt("empno")
				rs.getString(2)
			}
	
	 	   ---------------------------------------------------------------------------------------------------

			SQL에서 조회 후 행의 위치에 따른 결과만 출력이 가능하다.
			
			한 행당 rs.next()로 건너뛸 수 있고, 해당 행의 정보를 출력하려면
			
			rs.next();
			System.out.println("해당 행의 정보 : " + rs.get데이터유형(컬럼명 or 인덱스(1)));
			
			로 출력이 가능하다.
			
		6. ResultSet의 ArrayList 변환 과정을 기술하세요.
		
			- 강사님 답 -
			
			ArrayList<VO>가 선언 된 내용을
			while(rs.next()) { // 반복문을 호출하면서
				// 리스트에 각 행의 단위 객체를 추가 할당 처리
				list.add(new EMP(rs.getInt("empno")....);
			}
		
		   ---------------------------------------------------------------------------------------------------
			
			while문으로 반복하며 다음과 같이 변환한다.
			
			while(rs.next()) {
				System.out.print(rs.get데이터유형(컬럼명 or 인덱스(1)) + "\t");
				..
				..
				
				생성자.add(new VO(
							rs.get데이터유형(컬럼명 or 인덱스(1)),
							..
							..
						));
				}
				System.out.println("ArrayList의 데이터 수량 : " + 생성자.size());
				
	 # 0709 정리 문제 #
		1. sql을 통해서 DAO에서 다중 행 데이터와 단일 행 데이터 처리 방법의 차이를 기술하세요.
		
		1) 단일행 데이터 처리 : sql의 결과 내용일 단일행의 데이터일때 
		
 			if(rs.next(()) {
   				참조변수 = new 생성자 (rs.get데이터유형(순서), ....);
   			}
   			
		2) 다중행 데이터 처리: sql의 결과 내용이 다중행의 데이터일때
		
		   while(rs.next()) {
		   		list.add(new 생성자(rs.get데이터유형(순서),....));
		   	} 

		2. PreparedStatement를 사용하는 이유와 기본 형식을 기술하세요.
		
			1) sql injectrion 방지 : 동적 sql로 우회적으로 데이터를 인증 처리되는 것을 만든다. 
			2) 속도의 향상 : 매개값을 따로 전달함으로 동일한 sql로 인식하게 하여 컴파일 속도에 대한 향상으로 빠른 데이터 처리가 가능하게 한다.
			 
			# 기본 형식
				sql ="insert into emp02 values(?,?,?,?.....);
				pstmt = con.preparedStatement(Sql);
				pstmt.setInt(1,ins.getEmpno());
				pstmt.setInt(2,ins.getEname());
				pstmt.setInt(1,ins.getJob());
				.....
			
				rs = pstmt.excuteUpdate(); 
		
		3. DML 처리의 기본 절차를 기본 예제와 함께 기술하세요.
		
			1) SQL 작성 확인
			2) SQL 맞는 전달할 VO 객체 생성
			3) 기본 메서드 형식 작성
				public void XXXX(VO객체){}
			4) 오토커밋 설정 : con.autoCommit(false);
			5) 대화, 실행
			6) 커밋 처리 : con.commit();
			7) 자원 해제
			8) 예외 처리 SQLException 에서 con.rollback();
		
		4. 회원 테이블 member02를 만들고 id, pass를 받아 로그인 처리하는 프로그램을 PreparedStatement 형식으로 만들어 보세요.
		
			1) 회원 테이블 만들기, 데이터 입력 member (회원번호, 아이디, 패스워드, 회원명, 권한, 포인트, 등록일)
			2) SQL 작성 및 확인 insert into member values(...);
			3) VO 객체 작성 Member
			4) 기본 전역변수 및 공통 연결 메서드 선언
			5) public void insertMember(Member ins)
			6) ...
		
			*/
				// 필드 선언
				private Connection con;
				private PreparedStatement pstmt;
				private ResultSet rs;
				
				// 공통 메서드
				public void setCon() throws SQLException {
					try {
						Class.forName("oracle.jdbc.driver.OracleDriver");
					} catch (ClassNotFoundException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					String info = "jdbc:oracle:thin:@localhost:1521:XE";
					con = DriverManager.getConnection(info,"scott","tiger");
					System.out.println("Database On");
				}
				
//				public boolean login(Member m) {
//					
//					boolean hasMember = false;
//					
//					try {
//						setCon();
//						con.setAutoCommit(false);
//						String sql = "SELECT * FROM member02 WHERE id = ? AND pass = ?";
//						
//						pstmt = con.prepareStatement(sql);
//						pstmt.setString(1, m.getId());
//						pstmt.setString(2, m.getPass());						
//						rs = pstmt.executeQuery();
//						hasMember = rs.next();
//						con.commit();
//						pstmt.close(); con.close();
//						
//					} catch (SQLException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					} catch (Exception e) {
//						System.out.println(e.getMessage());
//					} finally {
//						if(rs!=null)
//							try {
//								rs.close();
//							} catch (SQLException e) {
//								// TODO Auto-generated catch block
//								e.printStackTrace();
//							}
//						if(pstmt!=null)
//							try {
//								pstmt.close();
//							} catch (SQLException e) {
//								// TODO Auto-generated catch block
//								e.printStackTrace();
//							}
//						if(con!=null)
//							try {
//								con.close();
//							} catch (SQLException e) {
//								// TODO Auto-generated catch block
//								e.printStackTrace();
//							}
//					}
//					
//					return hasMember;
//				}
			/*
			
	# 0712 정리 문제 #		
		3. DML 처리 순서를 정리하세요.
 
 			1) SQL 작성 : 생성 및 insert, update, delete, sequence
 			2) 조건이나 입력 할 데이터를 받은 구조 VO 클래스 선언
 			3) con.autoCommit(false);
 			4) pstmt = con.preparedStatement(sql)
 			5) 매개변수 처리
 				pstmt.setXXXX(순서, 데이터);
 				pstmt.setXXXX(순서, 데이터);
 			6) rs = pstmt.executeUpdate();
 			7) con.commit();
 			8) 자원 해제
 			9) 예외 처리 (SQLException) block에 con.rollback(); 
 		
 		4. PreparedStatement를 활용하여, Product 테이블을 만들고 물건정보 등록, 조회, 수정 처리하세요.
 		
 			1) 테이블 생성 및 SQL 작성
 			2) VO 객체 생성
 			3) 공통 전역 변수, 공통 기능 메서드 setCon() 선언
 			4) 기능 메서드 return 값 선언
 			5) SQL 변수 선언
		
			*/
				// 조회
				public ArrayList<Product> plist (Product sch) {
					ArrayList<Product> plist = new ArrayList<Product>();
					
					try {
						setCon();
						String sql = "SELECT *\r\n"
								+ "FROM product02\r\n"
								+ "WHERE name LIKE '%'||?||'%'\r\n"
								+ "AND price BETWEEN ? AND ?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, sch.getName());
						pstmt.setInt(2, sch.getFr_price());
						pstmt.setInt(3, sch.getTo_price());
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							plist.add(new Product (
									rs.getString(1),
									rs.getString(2),
									rs.getInt(3),
									rs.getInt(4)
									));
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
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
					
					return plist;
				}
				
				// 등록
				public ArrayList<Product> insertPlist (Product ins) {
					ArrayList<Product> insPlist = new ArrayList<Product>();
					
					try {
						setCon();
						
						con.setAutoCommit(false);
						
						String sql = "INSERT INTO product02 VALUES('PRO'||prod_seq.nextval,?,?,?)";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, ins.getName());
						pstmt.setInt(2, ins.getPrice());
						pstmt.setInt(3, ins.getCnt());

						pstmt.executeUpdate();
						
						pstmt.close(); con.close();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println(e.getMessage());
						try {
							con.rollback();
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
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
					return insPlist;
					
				}				
				
				// 수정
				
				public ArrayList<Product> updatePlist (Product upt) {
					ArrayList<Product> uptPlist = new ArrayList<Product>();
					
					try {
						setCon();
						
						con.setAutoCommit(false);
						
						String sql = "UPDATE product02\r\n"
								+ "	SET name = ?,\r\n"
								+ "		price = ?,\r\n"
								+ "		cnt = ?\r\n"
								+ "	WHERE pno = ?";
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, upt.getName());
						pstmt.setInt(2, upt.getPrice());
						pstmt.setInt(3, upt.getCnt());
				
						pstmt.executeUpdate();
						
						pstmt.close(); con.close();
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println(e.getMessage());
						try {
							con.rollback();
						} catch (SQLException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					} catch (Exception e) {
						System.out.println(e.getMessage());
					} finally {
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
					return uptPlist;
					
				}


				

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// 위에서 설정이 다 되면 main() 메서드에서 해당 객체를 호출시킨다.
		A20_Database dao = new A20_Database();
		
//		Member m = dao.login("himan", "7777");
//		if(m != null)
//			System.out.println(m.getName());
//		System.out.println("회원 등록 여부 : " + dao.login(new Member("higirl1", "8888")));
		
//		dao.insertPlist(new Product(null,"오렌지",2500,300));
		dao.updatePlist(new Product("PRO1006","망고",4500,200));
		
		for(Product pro:dao.plist(new Product("",0,9999))) {
			System.out.print(pro.getPno()+"\t");
			System.out.print(pro.getName()+"\t");
			System.out.print(pro.getPrice()+"\t");
			System.out.print(pro.getCnt()+"\n");
		}
		
		

	}

}
