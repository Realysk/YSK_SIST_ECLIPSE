<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
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
	window.onload=function(){
		document.querySelector("h3").innerText="부서정보조회";
	}
</script>
</head>
<%-- 
# 부서정보 등록 처리하기.(4조,5조)-단계별로 끝나면 올려주세요.
1. 기존 부서정보 리스트 출력. 		15:30	
2. 등록버튼 및 부서정보 등록화면 출력 	15:45
3. 부서정보 입력시, 요청값 처리 및 VO객체 만들기 16:10
4. DAO 연동 부서정보 완료 및 초기화면 이동 ..  16:20


부서리스트 화면
1) 버튼
2) 이벤트함수 - location.href="부서등록화면";

부서등록화면
1) 등록화면 구성.
2) 요청값 처리..
3) 등록위한 요청값을 VO 만들기..




--%>
<%

%>
<body>
	<h3 align="center"></h3>
<%
 	// 1. 요청값 받아오기
 	String dname = request.getParameter("dname");
 	String loc = request.getParameter("loc");
 	// 2. 초기화면시, default값 설정..
 	if(dname==null) dname = "";
 	if(loc==null) loc = "";
 	// 3. 데이터 처리 결과 받기..
 	A05_PreparedDao dao = new A05_PreparedDao();
 	List<Dept> dlist = dao.getDeptList(new Dept(0,dname,loc));
 
 %>
<script>
	function regDept(){
		if(confirm("등록화면이동")){
			location.href="a31_deptInsert.jsp";
		}
	}
</script> 
 	<form>
	<table>
		<tr><th>부서명</th><td><input type="text" name="dname" value="<%=dname%>"/></td></tr>
		<tr><th>직책명</th><td><input type="text" name="loc" value="<%=loc%>"/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="검색"/>
			<input type="button" onclick="regDept()" value="등록"/>
			</td></tr>
	</table>	
	</form>	
	<table>
		<tr>
			<th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<%for(Dept e:dlist){ %>
		<tr ondblclick="goDetail(<%=e.getDeptno()%>)"><td><%=e.getDeptno()%></td>
			<td><%=e.getDname()%></td>
			<td><%=e.getLoc()%></td></tr>
		<%} %>
	</table>	
	<script>
		function goDetail(deptno){
			alert(deptno+"로 이동");
			location.href="a35_deptDetail.jsp?deptno="+deptno;
		}
	
	</script>
	
</body>
</html>