package javaexp.z99_database;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javaexp.z01_vo.Emp;

public class A05_PreparedDao {

		private Connection con;
		private Statement stmt;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		public void setCon() throws SQLException {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String info = "jdbc:oracle:thin:@localhost:1521:xe"; // 개인 DB
			con = DriverManager.getConnection(info,"scott","tiger"); // 개인 DB 로그인 정보
			System.out.println("접속 성공!");
		}
		
		public ArrayList<Emp> getEmpList() {
			ArrayList<Emp> emplist = new ArrayList<Emp>();
			
			try {
				setCon();
				
				// 2. SQL 문자열로 할당
				String sql = "SELECT * \r\n"
						+ "FROM emp02";

				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				// DB에서 정보 불러오기 (주석 해제하면 됨)
				
				/*
				System.out.println(rs.next());
				//		4) ResultSet의 getXXX("컬럼명")
				//		   모든 컬럼은 데이터 유형(XXX)에 따라 데이터를 가져올 수 있다.
				//		   정수형일 경우 getInt(), 실수형 getDouble(), 문자열 getString()
				//		   일단, 어떤 유형이든 상관없이 getString()은 다 지원을 한다.
				//		   getString("컬럼명") : next() 이동한 행의 해당 컬럼에 데이터를 가져온다.
				System.out.println(rs.getString("job")); // 첫번째 행의 column job
				
				System.out.println(rs.next());
				System.out.println(rs.getString("ename")); // 두번쨰 행의 column ename
				
				// ex) 3번째 행의 부서번호와 5번째 행의 입사일, 8번째 행의 급여를 출력하세요.
				rs.next();
				System.out.println("세 번째 행의 부서번호 : " + rs.getString("deptno"));
				rs.next();
				rs.next();
				System.out.println("다섯 번째 행의 입사일 : " + rs.getString("hiredate"));
				
				// ex) 첫 번째 행의 사원 번호, 세 번째 행의 급여, 다섯 번째 핸의 관리자 번호를 출력하세요.
				rs.next();
				System.out.println("첫 번쨰 행의 사원 번호 : " + rs.getInt("empno"));
				rs.next();
				rs.next();
				System.out.println("세 번쨰 행의 급여 : " + rs.getDouble("sal"));
				rs.next();
				rs.next();
				System.out.println("다섯 번쨰 행의 관리자 번호 : " + rs.getInt("mgr"));
								
				int rowCnt=1;
				// rs.next() : 다음 행의 데이터가 있는지 여부를 boolean으로 return하기 때문에 While 안에 넣으면 데이터가 있는 행까지 반복해준다.
				while(rs.next()) {
					System.out.print(rowCnt++ + "번째 행 : ");
					System.out.println(rs.getDouble("sal"));
				}
				*/
				
				// ex) 부서번호, 사원번호, 사원명을 데이터 유형에 맞게 출력하세요.
				int rowCnt2 = 1;
				System.out.println("번호\t부서번호\t사원번호\t사원명\t직책\t관리자번호\t입사일\t급여\tcomm\t부서번호");
				// rs.getInt("컬럼명")
				// select ename, job
				// rs.getInt(1) 출력하는 컬럼을 1부터 시작하는 순서로 컬럼명 대신에 사용할 수 있다.
				while(rs.next()) {
					System.out.print(rowCnt2++ + "\t");
					// select ename, job
					// rs.getString("ename"), rs.getString("job")
					System.out.print(rs.getInt(1) + "\t");
					System.out.print(rs.getString(2) + "\t");
					System.out.print(rs.getString(3) + "\t");
					System.out.print(rs.getInt(4) + "\t");
					System.out.print(rs.getDate(5) + "\t");
					System.out.print(rs.getDouble(6) + "\t");
					System.out.print(rs.getDouble(7) + "\t");
					System.out.print(rs.getInt(8) + "\n");
					// int empno, String ename, String job, int mgr, Date hiredate, double sal,
					// double comm, int deptno
					emplist.add(new Emp(
								rs.getInt("empno"),
								rs.getString("ename"),
								rs.getString("job"),
								rs.getInt("mgr"),
								rs.getDate("hiredate"),
								rs.getDouble("sal"),
								rs.getDouble("comm"),
								rs.getInt("deptno")
							));
					}
					System.out.println("ArrayList의 데이터 수량 : " + emplist.size());
				
				// 5. 자원 해제 : 생성 된 역순으로 자원을 해제해준다.
				rs.close(); stmt.close(); con.close();
				
				// 6. 예외처리를 통한 기타 예외처리
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL 예외 발생!!" + e.getMessage());
				
			} catch(Exception e) {
				
				System.out.println("일반 예외 발생!!" + e.getMessage());
				
			} finally {
				
				if(rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
			return emplist;
		}

		// 조건을 받아서 데이터 처리
		/*
		 # PreparedStatement 객체 활용
		 */
		public ArrayList<Emp> emplist2(int deptno) {
			
			ArrayList<Emp> list = new ArrayList<Emp>();
			// 1. 연결 처리
				try {
					setCon();
					
					// 2. 부서 정보 받아 sql 선언
					String sql = "SELECT deptno, empno, ename, job, sal\r\n"
							+ "FROM emp02\r\n"
							+ "WHERE deptno = " + deptno;
					
					/*
					 ex) 문자열을 받으면 ''
					 	WHERE ename='CLARK';
					 */
					/*
					String name = "CLARK";
					String sql2 = "SELECT deptno, empno, ename, job, sal\r\n"
							+ "FROM emp02\r\n"
							+ "WHERE ename = '" + name + "' ";
					*/
					
					// 3. Statement
					stmt = con.createStatement();
					
					// 4. ResultSet
					rs = stmt.executeQuery(sql);
					
					//		1) while()
					while(rs.next()) {
						System.out.print(rs.getInt(1)+"\t");
						System.out.print(rs.getInt(2)+"\t");
						System.out.print(rs.getString(3)+"\t");
						System.out.print(rs.getString(4)+"\t");
						System.out.print(rs.getDouble(5)+"\n");
					}
					
					// 5. 자원 해제
					rs.close(); stmt.close(); con.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			return list;
		}
		
		
	// ex) 기능 메서드 추가
		/*
		 SELECT deptno, empno, ename, job, sal
		 FROM emp02
		 WHERE deptno=10
		 처리하는 기능 메서드를 추가 하세요.
		 */
		// 조건을 받아서 데이터 처리
		public ArrayList<Emp> emplist3(int deptno) {
			
			ArrayList<Emp> list = new ArrayList<Emp>();
			// 1. 연결 처리
				try {
					setCon();
					
					// 2. 부서 정보 받아 sql 선언
					String sql = "SELECT deptno, empno, ename, job, sal\r\n"
							+ "FROM emp02\r\n"
							+ "WHERE deptno = " + deptno;
					
					/*
					 ex) 문자열을 받으면 ''
					 	WHERE ename='CLARK';
					 */
					/*
					String name = "CLARK";
					String sql2 = "SELECT deptno, empno, ename, job, sal\r\n"
							+ "FROM emp02\r\n"
							+ "WHERE ename = '" + name + "' ";
					*/
					
					// 3. Statement
					stmt = con.createStatement();
					
					// 4. ResultSet
					rs = stmt.executeQuery(sql);
					
					//		1) while()
					while(rs.next()) {
						System.out.print(rs.getInt(1)+"\t");
						System.out.print(rs.getInt(2)+"\t");
						System.out.print(rs.getString(3)+"\t");
						System.out.print(rs.getString(4)+"\t");
						System.out.print(rs.getDouble(5)+"\n");
					}
					
					// 5. 자원 해제
					rs.close(); stmt.close(); con.close();
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
			return list;
		}

		// emp 조회 => ArrayList<Emp> 담기 처리
		// # 기능 메서드 선언
		//	틀 만들기
		// 		1) 최종 결과 값이 대한 확인 => 객체를 return 처리 => return 유형, 실제 return 할 객체
		// 		2) 최종 결과를 위해 입력 할 데이터 확인 => VO객체로 만들기 | 입력 데이터 변수로 선언
		// ---------------------------------------------------------------------------
		// 	내용 추가
		//		3)
		// 단일 객체 처리
		// 1) return값 단일 객체로 변경 (return 유형, 객체 변경);
		// 2) SQL 변경
		// 3) if(rs.next()) emp = new Emp(.....);
		public Emp getEmp(int empno) {
			Emp emp = null;
			
			// 1. 연결 공통 메서드 호출 [예외처리 block]
			try {
				setCon();
				
				// 2. SQL 문자열로 할당
				String sql = "SELECT *\r\n"
						+ "FROM emp02\r\n"
						+ "WHERE empno="+empno;
				
				// 3. Statement 객체 생성
				//		1) setCon();를 통해서 만들어진 Connection 객체의 기능 메서드를 통해서 Statement 객체 생성
				stmt = con.createStatement();
				
				// 4. ResultSet 객체 생성
				//		1) Statement가 지원하는 기능 메서드 executeQuery에 매개변수로 SQL을 입력하고
				//		2) 그 수행의 결과 값으로 ResultSet 객체가 생성이 된다.
				rs = stmt.executeQuery(sql);
				//		3) ResultSet의 next() : 행 단위로 이동하는 해당 다음 행의 데이터 유무를 true/false로 return한다.
				
				// DB에서 정보 불러오기 (주석 해제하면 됨)
				
				/*
				System.out.println(rs.next());
				//		4) ResultSet의 getXXX("컬럼명")
				//		   모든 컬럼은 데이터 유형(XXX)에 따라 데이터를 가져올 수 있다.
				//		   정수형일 경우 getInt(), 실수형 getDouble(), 문자열 getString()
				//		   일단, 어떤 유형이든 상관없이 getString()은 다 지원을 한다.
				//		   getString("컬럼명") : next() 이동한 행의 해당 컬럼에 데이터를 가져온다.
				System.out.println(rs.getString("job")); // 첫번째 행의 column job
				
				System.out.println(rs.next());
				System.out.println(rs.getString("ename")); // 두번쨰 행의 column ename
				
				// ex) 3번째 행의 부서번호와 5번째 행의 입사일, 8번째 행의 급여를 출력하세요.
				rs.next();
				System.out.println("세 번째 행의 부서번호 : " + rs.getString("deptno"));
				rs.next();
				rs.next();
				System.out.println("다섯 번째 행의 입사일 : " + rs.getString("hiredate"));
				
				// ex) 첫 번째 행의 사원 번호, 세 번째 행의 급여, 다섯 번째 핸의 관리자 번호를 출력하세요.
				rs.next();
				System.out.println("첫 번쨰 행의 사원 번호 : " + rs.getInt("empno"));
				rs.next();
				rs.next();
				System.out.println("세 번쨰 행의 급여 : " + rs.getDouble("sal"));
				rs.next();
				rs.next();
				System.out.println("다섯 번쨰 행의 관리자 번호 : " + rs.getInt("mgr"));
								
				int rowCnt=1;
				// rs.next() : 다음 행의 데이터가 있는지 여부를 boolean으로 return하기 때문에 While 안에 넣으면 데이터가 있는 행까지 반복해준다.
				while(rs.next()) {
					System.out.print(rowCnt++ + "번째 행 : ");
					System.out.println(rs.getDouble("sal"));
				}
				*/
				
				// ex) 부서번호, 사원번호, 사원명을 데이터 유형에 맞게 출력하세요.
//				int rowCnt2 = 1;
//				System.out.println("번호\t부서번호\t사원번호\t사원명\t직책\t관리자번호\t입사일\t급여\tcomm\t부서번호");
				// rs.getInt("컬럼명")
				// select ename, job
				// rs.getInt(1) 출력하는 컬럼을 1부터 시작하는 순서로 컬럼명 대신에 사용할 수 있다.
				if(rs.next()) {
//					System.out.print(rowCnt2++ + "\t");
					// select ename, job
					// rs.getString("ename"), rs.getString("job")
//					System.out.print(rs.getInt(1) + "\t");
//					System.out.print(rs.getString(2) + "\t");
//					System.out.print(rs.getString(3) + "\t");
//					System.out.print(rs.getInt(4) + "\t");
//					System.out.print(rs.getDate(5) + "\t");
//					System.out.print(rs.getDouble(6) + "\t");
//					System.out.print(rs.getDouble(7) + "\t");
					System.out.print(rs.getInt(8) + "\n");
					// int empno, String ename, String job, int mgr, Date hiredate, double sal,
					// double comm, int deptno
					emp = new Emp(
								rs.getInt("empno"),
								rs.getString("ename"),
								rs.getString("job"),
								rs.getInt("mgr"),
								rs.getDate("hiredate"),
								rs.getDouble("sal"),
								rs.getDouble("comm"),
								rs.getInt("deptno")
							);
					}
				
				// 5. 자원 해제 : 생성 된 역순으로 자원을 해제해준다.
				rs.close(); stmt.close(); con.close();
				
				// 6. 예외처리를 통한 기타 예외처리
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("SQL 예외 발생!!" + e.getMessage());
				
			} catch(Exception e) {
				
				System.out.println("일반 예외 발생!!" + e.getMessage());
				
			} finally {
				
				if(rs != null) {
					try {
						rs.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			}
			return emp;
		}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		A05_PreparedDao dao = new A05_PreparedDao();
		
//		ArrayList<Emp> emplist = dao.getEmpList();
//		dao.emplist2(10);
		
		Emp e = dao.getEmp(7369);
		if(e != null) {
			System.out.print(e.getEmpno() + "\t");
			System.out.print(e.getEname() + "\t");
			System.out.print(e.getSal() + "\n");
		} else {
			System.out.println("데이터가 없습니다.");
		}
		
	}
}