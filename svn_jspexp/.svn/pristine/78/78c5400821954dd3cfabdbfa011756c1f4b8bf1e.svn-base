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
	ex) 단가[   ]구매갯수[ ] 
		[할인율5%][할인율10%][할인율15%] ==> hidden으로 할인율값을 클릭시 설정하고,
		전송된 값을 기준으로 아래에 총금액을 표시하세요.
		총계 @@ 할인율 @@ 할인율적용 총계 @@   3조  전제(손들기)
				<input type="hidden" name="disRatio" />
		  
		
	
	 --%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		$("[type=button]").click(function(){
			if($(this).val()=="할인율 5%") $("[name=disRatio]").val(5);
			if($(this).val()=="할인율 10%") $("[name=disRatio]").val(10);
			if($(this).val()=="할인율 15%") $("[name=disRatio]").val(15);
			$("form").submit();
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
		<input type="hidden" name="disRatio" />
	<table align="center" class="listTable">
		<tr><th>단가</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>구매갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
			<input type="button" value="할인율 5%" />
			<input type="button" value="할인율 10%" />
			<input type="button" value="할인율 15%" />
		</td></tr>
	</table>	
	</form>
	<%
	String priceS = request.getParameter("price");
	String cntS = request.getParameter("cnt");
	String disRatioS = request.getParameter("disRatio");
	%>
	<%
	if(priceS!=null){
		int tot = Integer.parseInt(priceS)*Integer.parseInt(cntS);
		// 할인금액 = 전체값 * 할인율(정수형)/100
		int disTot = tot - (int)(tot*Integer.parseInt(disRatioS)/100.0);		
	%>
	<table  align="center" class="listTable">
		<tr><th>총계</th><td><%=tot %>원</td></tr>
		<tr><th>할인율</th><td><%=disRatioS %>%</td></tr>
		<tr><th>할인적용금액</th><td><%=disTot %>원</td></tr>
	</table>	
	<%} %>

	
	
</body>
</html>