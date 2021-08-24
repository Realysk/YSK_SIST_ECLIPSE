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
# 

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
	<h2 align="center"></h2>

   <%--
   ?name=사과&price=3000&cnt=2
    --%>
   <jsp:useBean id="pd02" class="jspexp.z02_vo.Product"/>
   <jsp:setProperty property="name" name="pd02" />
   <jsp:setProperty property="price" name="pd02"/>
   <jsp:setProperty property="cnt" name="pd02" />
   <h3 align="center">Product 객체(param 이용)</h3>
   <table align="center" class="listTable">
      <tr><th>물건명</th><td>${pd02.name}</td></tr>
      <tr><th>가격</th><td>${pd02.price}</td></tr>
      <tr><th>수량</th><td>${pd02.cnt}</td></tr>
   </table>	 	
   <jsp:useBean id="pd03" class="jspexp.z02_vo.Product"/>
   <%--
   property를 *로 설정하면 자동으로 요청key와 같은 property를 찾아서 자동을 등록 처리한다.
   ?name=사과&price=3000&cnt=2
   setName(String name)
   sePrice(int price)
   setCnt(int cnt)
   로 되어 있고, ***데이터유형도 할당이 가능한 메서드로 되어 있으면
   property를 *로 선언하면 자동으로 할당이 된다..
    --%>
   <jsp:setProperty property="*" name="pd03" />
   <h3 align="center">Product 객체(property="*")</h3>
   <table align="center" class="listTable">
      <tr><th>물건명</th><td>${pd03.name}</td></tr>
      <tr><th>가격</th><td>${pd03.price}</td></tr>
      <tr><th>수량</th><td>${pd03.cnt}</td></tr>
   </table>	   	
   <%--
   Member 객체를 bean으로 할당하여 요청값이 자동으로 전체할당하게 하고,
   할당된 property를 el출력하세요.  3조  전체(손들기)
   ?id=himan&pass=7777&name=홍길동&auth=관리자&point=7000
    --%>
  <jsp:useBean id="mem03" class="jspexp.z02_vo.Member" scope="session"/>
 	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>비밀번호</th><td><input type="password" name="pass" value=""/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth" value=""/></td></tr>
		<tr><th>포인</th><td><input type="text" name="point" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="회원등록"/></td></tr>
	</table>	
	</form>   
	<h3 align="center">등록한 회원</h3>
  <jsp:setProperty property="*" name="mem03" />
      <table  align="center" class="listTable">
      <tr><th>아이디</th><td>${mem03.id}</td></tr>
      <tr><th>비밀번호</th><td>${mem03.pass}</td></tr>
      <tr><th>이름</th><td>${mem03.name}</td></tr>
      <tr><th>권한</th><td>${mem03.auth}</td></tr>
      <tr><th>포인트</th><td>${mem03.point}</td></tr>
   </table>    
</body>
</html>