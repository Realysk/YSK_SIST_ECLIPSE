<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.A05_PreparedDao"
    import = "jspexp.z02_vo.Emp"
    import = "jspexp.z02_vo.Dept"
    import = "java.util.*"
    %>
<%
//jspexp.z01_database.A05_PreparedDao
//jspexp.z02_vo.Emp
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	// 전체화면이 로딩 될때, 시작할 js 함수로.
	// body 최하단에 js를 선언한 효과이벤트..
	window.onload=function(){
		document.querySelector("h3").innerText="사원정보!!";
		
		var empSchArry = document.querySelectorAll("[name=ename],[name=job]");
		for(var idx=0;idx<empSchArry.length;idx++){
			empSchArry[idx].onkeyup=function(){
				console.log(this.value+":"+event.keyCode);
			}
		}
		
	};

</script>
</head>
<body>
	<h3></h3>
	<%
	String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		if(ename==null) ename="";
		if(job==null) job="";
		A05_PreparedDao dao = new A05_PreparedDao();
		ArrayList<Emp> elist = dao.getPreparedEmpList(new Emp(ename,job));
	%>		
	
	<form id="frm01">
	<!-- form객체의 하위 내용을 enter를 입력했을 때, 자동으로 요청값을 전송하는
	것을 브라우저가 지원하는 경우가 종종 있다. -->
	<table>
		<tr><th>사원명</th><td><input type="text" name="ename" value="<%=ename%>"/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="job" value="<%=job%>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>

	
	<%--
	초기화면에서 form 하위에 있는 요소객체에 데이터를 입력하고,
	submit버튼을 클릭시,
	url 주소가 이형식으로 변경 :a09_empList.jsp?name=홍길동&job=사원
	name=홍길동&job=사원   ?key=value
	input name="name" ==> key
	입력한 값이 ==>value가 되어 다시현재 화면을 호출한다.
	
	서버안에 있는 java 코드인 request.getParameter("name")가
	request.getParameter("job") ==> job과 mapping되는 사원에
	불러온다.
	
	
	
	
	
	 --%>
	
	
	<table>
		<tr>
			<th>사원번호</th><th>사원명</th><th>직책</th>
			<th>관리자번호</th><th>입사일</th><th>급여</th>
			<th>보너스</th><th>부서번호</th></tr>
		<%for(Emp e:elist){ %>
		<tr><td><%=e.getEmpno()%></td>
			<td><%=e.getEname()%></td>
			<td><%=e.getJob()%></td>
			<td><%=e.getMgr()%></td>
			<td><%=e.getHiredate()%></td>
			<td><%=e.getSal()%></td>
			<td><%=e.getComm()%></td>
			<td><%=e.getDeptno()%></td></tr>
		<%} %>
	</table>
</body>
<%--
# DB sql을 통한 jsp 화면 처리..
1. sql 작성
	SELECT * 
	FROM EMP02
	WHERE ename LIKE '%'||'A'||'%'
	AND job LIKE '%'||'A'||'%'
2. sql의 단위를 할당할 VO 작성..
	public class Emp {
	private int empno;
	private String ename;
	private String job
	,,
3. DAO 기능 메서드 추가
	0) 비슷한 유형 기능 메서드 copy
	1) 리턴할 유형 선언, vo, 매개변수
	2) sql 할당, 리턴할 메서드 main()을 통해서 test
4. jsp에서, vo, arraylist, dao객체 import
5. dao객체 생성 리턴할 arraylist 선언및 할당
6. 화면구성
	1) 기본화면 구성 : form(검색), list 테이블 처리
	2) 반복문 처리
	3) 요청값 받아서  dao단 요청값 전달 처리.
		(검색)

 --%>
 <%
 	// 1. 요청값 받아오기
 	String dname = request.getParameter("dname");
 	String loc = request.getParameter("loc");
 	// 2. 초기화면시, default값 설정..
 	if(dname==null) dname = "";
 	if(loc==null) loc = "";
 	// 3. 데이터 처리 결과 받기..
 	List<Dept> dlist = dao.getDeptList(new Dept(0,dname,loc));
 
 %>
 	<form>
	<table>
		<tr><th>부서명</th><td><input type="text" name="dname" value="<%=dname%>"/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="loc" value="<%=loc%>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>	
	<table>
		<tr>
			<th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<%for(Dept e:dlist){ %>
		<tr><td><%=e.getDeptno()%></td>
			<td><%=e.getDname()%></td>
			<td><%=e.getLoc()%></td></tr>
		<%} %>
	</table>	

</html>