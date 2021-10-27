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
<title>Insert title here</title>
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="전달되어온 값";
	}
</script>
</head>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	A05_PreparedDao dao = new A05_PreparedDao();
	boolean isSucc = dao.login(id,pass);
%>
<body>

	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>id</th><td><%=id%></td></tr>
		<tr><th>pass</th><td><%=pass%></td></tr>
		<tr><th>인증여부</th><td>
		<%=isSucc?"로그인 성공":"로그인실패"%>
		</td></tr>
	</table>	
	</form>
	<script>
		<%-- 
		// jsp의 변수를 js로 할당하기..
		// 1. jsp가 먼저 처리되어야 하고,
		// 2. js는 최종 결과물을 화면에서 받아서 처리한다는 개념을 반드시
		//    생각하여야한다. 
		// 3. 데이터 처리시 주의 사항.
		//    1) boolean, 숫자형은 그대로 할당 가능
		//    2) 문자열형은 "<%=jsp변수%>", '<%=jsp변수%>'에 할당되어야 한다.
		//  boolean값을 할당.
		--%>
		var isSucc = <%=isSucc%>;
		if(isSucc){
			alert("로그인 성공\n메인페이지 이동");
			// 이동할 메인페이지 지정
			// location.href="메인페이지.jsp";
		}else{
			alert("로그인 실패\n로그인을 다시 하세요.");
			// 로그인 페이지 이동
			location.href="a0727.jsp";
		}
		
		
		
	</script>	
</body>
</html>