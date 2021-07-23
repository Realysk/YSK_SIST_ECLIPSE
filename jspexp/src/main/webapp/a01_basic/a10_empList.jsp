<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
	import="java.util.*"
%>
<%
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
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="사원 정보";
	};

</script>
</head>
<body>

	<h3></h3>
	
	<%
		String ename = request.getParameter("ename");
		String job = request.getParameter("job");
		
		if(ename == null) ename = "";
		if(job == null) job = "";
	
		A05_PreparedDao dao = new A05_PreparedDao();
		ArrayList<Emp> elist = dao.getPreparedEmpList(new Emp(ename, job));
	%>	
	
	<form> <!-- 해당 키워드로 검색 -->
		<table>
			<tr><th> 사원명 </th><td><input type="text" name="ename" value="<%=ename%>"/></td></tr>
			<tr><th> 직책명 </th><td><input type="text" name="job" value="<%=job%>"/></td></tr>
			<tr><td colspan="2"><td><input type="submit" value="검색"/></td></tr>
		</table>
	</form>
	
	<h4> 요청 받은 사원명 : <%=request.getParameter("ename") %> </h4>
	<h4> 요청 받은 직책명 : <%=request.getParameter("job") %> </h4>
	
	<%--
		초기 화면에서 form 하위에 있는 요소 객체에 데이터를 입력하고 submit 버튼을 클릭 시
		url 주소 변경 : a10_empList.jsp?name=홍길동&job=사원 ?key=value
		input name="name" => key
		입력한 값이 => value가 되어 다시 현재 화면을 호출 한다.
		
		서버 내에 있는 JAVA 코드인 request.getParameter("name")가 request.getParameter("job") => job과 mapping되는 사원에 불러온다.
	 --%>
	
	<table>
		<tr><th> 사원번호 </th><th> 사원명 </th><th> 직책 </th><th> 관리자번호 </th><th> 입사일 </th><th> 급여 </th><th> 보너스 </th><th> 부서번호 </th></tr>
		<%for(Emp e:elist) { %>
		<tr>
			<td><%=e.getEmpno() %></td>
			<td><%=e.getEname() %></td>
			<td><%=e.getJob() %></td>
			<td><%=e.getMgr() %></td>
			<td><%=e.getHiredate() %></td>
			<td><%=e.getSal() %></td>
			<td><%=e.getComm() %></td>
			<td><%=e.getDeptno() %></td>
		</tr>		
		<% } %>
	</table>
	
</body>
</html>