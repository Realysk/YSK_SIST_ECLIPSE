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
	ex) [ @@ ] [ @@ ]
		[+][-][*][/]  클릭시, hidden으로 정해진 연산자로 아래에 요청 결과값으로 출력하세요.
		@@@ + @@@ = @@@   3조, 4조   전체(손들기)
	
	 --%>

<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("연산자처리");
		$("[type=button]").click(function(){
			if($(this).val()=="+") $("[name=cal]").val(0);
			if($(this).val()=="-") $("[name=cal]").val(1);
			if($(this).val()=="*") $("[name=cal]").val(2);
			if($(this).val()=="/") $("[name=cal]").val(3);
			$("form").submit();
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
		<input type="hidden" name="cal" value="0"/>
	<table align="center" class="listTable">
		<tr><td>
		<input type="text" name="num01" value="0" size="2"/>
		<input type="text" name="num02" value="0" size="2"/>
		</td></tr>
		<tr><td colspan="2" style="text-align:center" >
		<input type="button" value="+"/>
		<input type="button" value="-"/>
		<input type="button" value="*"/>
		<input type="button" value="/"/>
		</td></tr>
	</table>	
	</form>
	<%
	String num01S = request.getParameter("num01");
	String num02S = request.getParameter("num02");
	String calIdxS = request.getParameter("cal");
	if(num01S!=null){
		int num01 = Integer.parseInt(num01S);	
		int num02 = Integer.parseInt(num02S);	
		int calIdx = Integer.parseInt(calIdxS);	
		String cal[]={"+","-","*","/"};
		int res[]={num01+num02,num01-num02,num01*num02,num01/num02};
	%>
	<h3 align="center"><%=num01%> <%=cal[calIdx] %> <%=num02 %> = <%=res[calIdx]%></h3>
	<%
	}
	%>
	
</body>
</html>