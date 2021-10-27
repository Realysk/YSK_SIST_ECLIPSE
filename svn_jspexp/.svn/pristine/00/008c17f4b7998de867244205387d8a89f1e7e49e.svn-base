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
		document.querySelector("h3").innerText="회원정보리스트";
	}
</script>
</head>
<%-- 
# 

--%>

<body>
	<script>
		function insertFrm(){
			if(confirm("등록합니다.")){
				location.href="a0729_2_memberInsert.jsp";
				// 간단하게 요청값으로 해당 페이지에 매개변수를 넘길 때는
				// 페이지?요청키=요청값...
			}
		}
	</script>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><td colspan="2">
			<input type="button" value="등록" onclick="insertFrm()"/></td></tr>
	</table>	
	</form>
	<%
	A05_PreparedDao dao = new A05_PreparedDao();
	%>	
	<table>
		<tr><th>아이디</th><th>패스워드</th><th>이름</th>
			<th>권한</th><th>포인트</th></tr>
		<%for(Member m:dao.getMemberList()){ %>
			<tr ondblclick="detail('<%=m.getId()%>')"><td><%=m.getId()%></td>
				<td><%=m.getPass()%></td>
				<td><%=m.getName()%></td>
				<td><%=m.getAuth()%></td>
				<td><%=m.getPoint()%></td>
				
				</tr>
		<%}%>
	</table>	
	<script>
		function detail(id){
			location.href="a0802_memberDetail.jsp?id="+id;
		}
	</script>
</body>
</html>