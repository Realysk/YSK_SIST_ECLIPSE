<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
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
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" type="text/javascript"></script>

</head>
<%-- 
# 

--%>
<%

%>
<body>

	<%--
		ex) 단가 [   ] 구매수량 [   ] [할인율 5%] [할인율 10%] [할인율 15%] => hidden으로 할인율값을 클릭 시 설정하고 전송된 값을 기준으로 아래에 총 금액을 표시하세요.
			총계 @@  할인율 @@  할인율 적용 후 총계 @@
	 --%>
<script type="text/javascript">
	$(document).ready(function() {
		$("h2").text("시작");
		$("[type=button]").click(function() {
			if($(this).val()=="할인율5%") $("[name=disRatio]").val(5);
			if($(this).val()=="할인율10%") $("[name=disRatio]").val(10);
			if($(this).val()=="할인율15%") $("[name=disRatio]").val(15);
			$("form").submit();
		});
	});

</script>
	<form id="frm01" method="post">
		<input type="hidden" name="disRatio"/>
	<table align="center" class="listTable">
		<tr><th>단가</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>수량</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2">
				<input type="button" value="할인율5%"/>
				<input type="button" value="할인율10%"/>
				<input type="button" value="할인율15%"/>
			</td>
		</tr>
	</table>
	</form>
	<%
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
		String disRatioS = request.getParameter("disRatio");
	%>
	<%
		if(priceS != null) {
			int tot = Integer.parseInt(priceS) * Integer.parseInt(cntS);
			// 할인금액 = 전체값 * 할인율(정수형)/100
			int disTot = tot - (int)(tot*Integer.parseInt(disRatioS)/100);
	%>
	<table align="center" class="listTable">
		<tr><th>총계</th><td><%=tot %>원</td></tr>
		<tr><th>할인율</th><td><%=disRatioS %>%</td></tr>
		<tr><th>할인적용금액</th><td><%=disTot %>원</td></tr>
	</table>
	<% } %>
	
</body>
</html>