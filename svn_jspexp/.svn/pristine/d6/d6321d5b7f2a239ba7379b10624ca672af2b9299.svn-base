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
		document.querySelector("h3").innerText="물건정보";
	}
</script>
</head>
<%--
# 요청 데이터에 대한 처리.
1. null
	요청값이 없을 때, 기능 메서드를 이용하거나, 화면에 null로 보여지는 것을 방지하여야 한다.
	1) if(요청값==null) 변수명 = default데이터 처리
		 문자열은 "", 숫자형은 "0"|"0.0"으로 처리해준다.
2. 형변환 처리
3. 객체에 할당 처리..

 --%>
<%
String pname= request.getParameter("pname");
if(pname==null) pname=""; // 기본 ""로 처리하면 nullpointer예외나  null출력되는 것을
// 막을 수 있다.
String price= request.getParameter("price");
if(price==null) price="0"; // 숫자형은 0이나 기본유형으로 처리해준다.
String cnt= request.getParameter("cnt");
if(cnt==null) cnt="0"; 

if(pname.equals("사과")){
	
}
// ex) a18_form.jsp
//       도서명 : [   ]
///      저자 : [   ] [확인] ==> a19_rev.jsp  도서명 : @@@, 저자 : @@@
//                             입력이 안된 경우 "입력안됨"|"익명"으로 표현하여
//                            출력하세요.. 3조
//     		
		
		

%>
<body>
	<h3 align="center"></h3>
	<form id="frm01">
	<table>
		<tr><th>물건명</th><td><%=pname %></td></tr>
		<tr><th>가격</th><td><%=price %></td></tr>
		<tr><th>갯수</th><td><%=cnt %></td></tr>
	</table>	
	</form>
</body>
</html>