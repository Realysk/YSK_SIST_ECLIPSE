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
		document.querySelector("h3").innerText="";
	}
</script>
</head>
<%--
# form 객체을 통한 요청값 처리.
1. 다른 페이지 호출, 요청값 전달하기.
	form
	1) 속성 action="요청할페이지"
	2) 하위요소객체.
		<input name="요청키" value="요청값"
		<input type="submit"/> ==> 이 버튼을
		클릭시, 요청페이지와 요청값이 전달된다.
2. 현재 페이지에 요청값 전달하기
	1) 초기 화면
	2) 요청값 전달 후 화면

 --%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" action="a16_receive.jsp">
	<table>
		<tr><th>사원명</th>
			<td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2">
			<input type="submit" value="전송"/></td></tr>
		<%--
		submit를 클릭하는 순간..
		location.href="a16_receive.jsp?ename=홍길동
		으로 처리되는 것과 같은 수행을 해준다.
		ex) a16_formReq.jsp를 통해서 물건명 가격 갯수를 입력해서 전송하는 순간.
			a17_rev.jsp를 통해서 위 데이터를 전송받게 처리하세요 2조
			
		 --%>	
	</table>	
	</form>
</body>
</html>