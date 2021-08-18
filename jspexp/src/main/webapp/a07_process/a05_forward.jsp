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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# jsp:forward 액션태그
1. 하나의 jsp 페이지에서 다른 jsp 페이지로 요청 처리를 전달할 때 사용된다.
2. 요청값 request.getParameter(), request.setAttribute() 값을 전달 받을 수 있다.
--%>
<%
	String goPage = request.getParameter("auth");
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("jsp:forward action 태그");
		$("[name=auth]").change(function(){
			$("form").submit();
		});
	});
</script>
<body>
	<%
	if( goPage!=null && !goPage.equals("")){
	%>
	<jsp:forward page="<%=goPage%>"/>
	<%
	}
	%>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>아이디</th>
			<td><input type="text" name="id"/></td></tr>
		<tr>
			<th>권한</th>
			<td>
				<select name="auth">
					<option value="">권한선택</option>
					<option value="a06_normal.jsp">일반사용자</option>
					<option value="a07_admin.jsp">관리자</option>
					<option value="a08_guest.jsp">방문객</option>
				</select>
			</td></tr>
	</table>	
	</form>
	<%--
	ex) 계산기 숫자1[   ] 숫자2[   ] 연산자 [select ] 해당연산자 선택시, 아래 페이지 이동  
		a09_calcu.jsp
		a10_plus.jsp    @@ + @@ = @@ 
		a11_minus.jsp    @@ - @@ = @@ 
		a12_multi.jsp    @@ * @@ = @@ 
		a13_divide.jsp    @@ / @@ = @@ 
		2조 제출, 전체 손들기
	 --%>
</body>
</html>