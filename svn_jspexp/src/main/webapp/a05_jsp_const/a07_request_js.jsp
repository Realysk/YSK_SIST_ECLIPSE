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
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("form js+jsp");
		$("#regBtn").click(function(){
			// 등록 처리 프로섹스 표시..
			$("[name=proc]").val("insert");
			$("form").submit();
		});
		$("#uptBtn").click(function(){
			$("[name=proc]").val("update");
			$("form").submit();
		});		
		$("#delBtn").click(function(){
			$("[name=proc]").val("delete");
			$("form").attr("action","<%=path%>/a05_jsp_const/a08_delete.jsp");
			$("form").submit();
		});	
		$("#mainBtn").click(function(){
			location.href="<%=path%>/a05_jsp_const/a09_main.jsp";
		});				
	});
</script>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
		<input type="hidden" name="proc"/>
		<table align="center" class="listTable">
			<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
			<tr><td colspan="2" style="text-align:center" >
					<input type="button" value="등록"  id="regBtn"/>
					<input type="button" value="수정"  id="uptBtn"/>
					<input type="button" value="삭제"  id="delBtn"/>
					<input type="button" value="메인화면"  id="mainBtn"/>
			</td></tr>
		</table>	
	</form>	
	<%
	String proc = request.getParameter("proc");
	if(proc!=null){
	%>
		<h3 align="center">처리되는 프로세스:<%=proc %></h3>
	<%} %>
	<%--
	ex) 단가[   ]구매갯수[ ] 
		[할인율5%][할인율10%][할인율15%] ==> hidden으로 할인율값을 클릭시 설정하고,
		전송된 값을 기준으로 아래에 총금액을 표시하세요.
		총계 @@ 할인율 @@ 할인율적용 총계 @@   3조  전제(손들기)
				<input type="hidden" name="disRatio" />
		  
		
	
	 --%>
	
	
</body>
</html>





