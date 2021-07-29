<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	.input{width:80%;}
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="07.29 정리문제";
	}
</script>
</head>

	<h3 align="center"></h3>
<%-- 
	1. 요청 값의 post방식과 get방식의 차이점을 기술하세요.
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> FORM 태그의 GET과 POST의 차이점 </th></tr>
			<tr><th> GET </th><td> GET 은 클라이언트에서 서버로 어떠한 리소스로 부터 정보를 요청하기 위해 사용되는 메서드이다. </td></tr>
			<tr><th> POST </th><td> POST는 클라이언트에서 서버로 리소스를 생성하거나 업데이트하기 위해 데이터를 보낼 때 사용 되는 메서드다. </td></tr>
			<tr><th> 차이점 </th><td> GET은 서버의 리소스에서 데이터를 요청할 때, POST는 서버의 리소스를 새로 생성하거나 업데이트할 때 사용한다.
									DB로 따지면 GET은 SELECT 에 가깝고, POST는 Create 에 가깝다고 보면 된다. </td></tr>
		</table><br><hr>
		</form>		
	<%--
	
	2. 아래와 같은 도서구매 시스템을 post방식으로 처리하세요.(한페이지처리)
	    도서명 [     ] 가격 [    ] 수량 [    ] [구매] 
	    ==> 구매한 도서 @@@ 총비용 @@ 할인 15% 후, 금액 @@@@
	    1) 화면 구현
	    2) 초기 화면 / 요청 값 후 처리를 요청값으로 분리 (request.getParameter())
	    3) 숫자형 변환 로직 처리
	
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> 도서 구매 시스템 (POST) </th></tr>
			<tr><th> 도서명 </th><td><input type="text" name="bname" value=""/></td></tr>
			<tr><th> 가격 </th><td><input type="number" class="input" name="price" value="0"/></td></tr>
			<tr><th> 수량 </th><td><input type="number" class="input" name="cnt" value="0"/></td></tr>
			<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
		</table><br><hr>
		</form>	
		<%
			String bname = request.getParameter("bname");
			String priceS = request.getParameter("price");
			String cntS = request.getParameter("cnt");
			if(bname != null) {
				int price = Integer.parseInt(priceS);
				int cnt = Integer.parseInt(cntS);
		%>
		<table>
			<tr><th colspan="2"> 도서 구매 내역 </th></tr>
			<tr><th> 도서명 </th><td><%=bname %></td></tr>		
			<tr><th> 가격 </th><td><%=price %></td></tr>
			<tr><th> 수량 </th><td><%=cnt %></td></tr>
			<tr><th> 15% 할인 금액 </th><td><%=(int)((price*cnt)*0.85) %></td></tr>
			<tr><th> 총계 </th><td><%=(int)((price*cnt)*0.85)*cnt %></td></tr>
		</table><br><hr>
		<% } %>
	<%--	
	
	3. 사원 정보 등록 처리 프로세스을 파일명과 요청값처리, JS, DAO 핵심 코드 위주로 기술하세요.
		1) 전체 화면 및 파일 :
			조회 리스트 (a29_empList.jsp)
			등록 화면 (a30_empInsert.jsp)
		2) 화면 이동 처리
			조회 리스트 => 등록 화면
			등록버튼 클릭 시 등록 화면 이동.
				input onclick="insertFrm()"
				function insertFrm() {
					location.href="등록화면";
				}
			등록 화면에서 등록 처리 (2개의 프로세스 처리)
				- 1) 초기 화면과
				[JSP] 데이터 입력 후 input type="submit" 버튼 클릭 시
				- 2) 등록 후 처리 process
				[JSP] String ename = request.getParameter("ename"); // 입력 값을 받음
				[JSP] 등록 DAO에 기능 메서드의 매개변수로 할당하기 위한 객체 생성
					Emp ins = new Emp(0, ename, job, .....);
				[DAO.JAVA] DAO에 입력 처리 기능 메서드 추가. public void insertEmp(Emp ins)
					SQL 작성 (insert into emp02 values(emp_seq.nextval,?,?,?,?,?..)
					pstmt.setString(1, ins.getEname());
				[JSP]
					if(ename!=null)
						DAO 객체 생성 :
						기능 메서드 호출 : dao.insertEmp(ins);
						isInsert = true;
					등록 완료 JS 처리
						var isInsert = <%=isInsert%>	
						if(isInsert) {
							등록 성공, 조회 페이지 이동
						}
						
	--%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> 사원 정보 등록 처리 프로세스 </th></tr>
			<tr>
				<td colspan="2" rowspan="2">
				1) 전체 화면 및 파일 :
					조회 리스트 (a29_empList.jsp)
					등록 화면 (a30_empInsert.jsp)
				2) 화면 이동 처리
					조회 리스트 => 등록 화면
					등록버튼 클릭 시 등록 화면 이동.
						input onclick="insertFrm()"
						function insertFrm() {
							location.href="등록화면";
						}
					등록 화면에서 등록 처리 (2개의 프로세스 처리)
						- 1) 초기 화면과
						[JSP] 데이터 입력 후 input type="submit" 버튼 클릭 시
						- 2) 등록 후 처리 process
						[JSP] String ename = request.getParameter("ename"); // 입력 값을 받음
						[JSP] 등록 DAO에 기능 메서드의 매개변수로 할당하기 위한 객체 생성
							Emp ins = new Emp(0, ename, job, .....);
						[DAO.JAVA] DAO에 입력 처리 기능 메서드 추가. public void insertEmp(Emp ins)
							SQL 작성 (insert into emp02 values(emp_seq.nextval,?,?,?,?,?..)
							pstmt.setString(1, ins.getEname());
						[JSP]
							if(ename!=null)
								DAO 객체 생성 :
								기능 메서드 호출 : dao.insertEmp(ins);
								isInsert = true;
							등록 완료 JS 처리
								var isInsert = <%--<%=isInsert%>--%>	
								if(isInsert) {
									등록 성공, 조회 페이지 이동
								}	
				</td>
			</tr>
		</table><br><hr>
		</form>
	<%--
	
	4. 회원정보 관리시스템을 기존 member테이블을 활용하여 진행하되, 전체리스트에서 등록처리화면로 처리하세요. (회원리스트화면, 등록처리화면, dao 등록)
		1) 주요 기능 파일
			회원 조회 리스트 (A05_0729_1_memberList.jsp)
			회원 등록 처리 (A05_0729_2_memberInsert.jsp)
			데이터 처리 DAO (A05_PreparedDao.java)
				회원 조회 메서드 (getMemberList())
				회원 등록 메서드 (insertMember(Member ins))
		
		2) 핵심 처리 내용
			- 페이지 전환 : 이벤트 속성으로 함수호출과 location.href="이동할페이지";
			- 요청 값 처리 : name="요청key" request.getParameter("요청key")
							submit, post방식
							초기화면과 분리 if (요청변수 != null)
			- DAO 처리 : SQL 확인, 메서드 선언(입력 값, 리턴 값), ?,?,? => pstmt.setXXX(1,데이터)
					=> rs.next() rs.getXXX("컬럼명")
			- 화면에서 DAO 호출 및 기능 메서드 처리
				초기화면과 요청 값이 왔을 때 조건 처리
				if(요청변수 != null)
					DAO 객체 생성, 기능 메서드 호출 및 매개변수로 입력 객체 전달
					dao.insertMember(ins);
				JS로 등록 완료 처리
	
	--%>
		<%

		%>
		<form id="frm01" method="post">
		<table>
			<tr><th colspan="2"> 회원정보 관리 시스템 </th></tr>
			<tr><th> ID </th><td><input type="text" name="id" value=""/></td></tr>
			<tr><th> PW </th><td><input type="text" name="pw" value=""/></td></tr>
			<tr><th> NAME </th><td><input type="text" name="name" value=""/></td></tr>
			<tr><th> AUTH </th><td><input type="text" name="auth" value=""/></td></tr>
			<tr><th> POINT </th><td><input type="number" class="input" name="point" value=""/></td></tr>
			<tr><td colspan="2"><input type="submit" value="조회"/></td></tr>
		</table><br><hr>
		</form>		
	<%--	
	
	5. 아래와 같은 임의의 구구단 문제를 10문제 리스트하고, 현재페이지에 post방식을 전달하여 최종 점수를 출력하세요.
	    번호  문제     정답
	    1    2 * 5  [   ]
	    2    4 * 3  [   ]
	    3    6 * 5  [   ]
	   ...
	        [시험완료] ==>  @@ 점.
	        
	--%>
		
	<%--	        
	        
--%>
<%

%>
<body>
	<%-- 
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table><br><hr>
	</form>
	--%>
</body>
</html>