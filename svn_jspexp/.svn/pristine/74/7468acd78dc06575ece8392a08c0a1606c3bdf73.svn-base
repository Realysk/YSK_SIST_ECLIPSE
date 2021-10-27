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
	td{text-align:center;width:100px;}
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# 

--%>
<%
List<Calen> list = Arrays.asList(new Calen(2021,8,1,"8월회의"),new Calen(2021,8,3,"개발설계"));
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("캘린더");
		var today = new Date();
		today.setDate(1);
		today.setDate(today.getDate()-today.getDay());
		
		console.log(today)
		$("h2").text(today.getMonth()+1+"월");
		var show="<tr>";
		for(var cnt=1;cnt<=7;cnt++){
			show+="<td>"+today.getDate()+"</td>";
			today.setDate(today.getDate()+1);
		}
		show+="</tr>";
		$("table>tbody").append(show);
		
		var calens =[];
		<%for(Calen c:list){%>
			calens.push({year:<%=c.getYear()%>,month:<%=c.getMonth()%>,
				date:<%=c.getDate()%>,sche:'<%=c.getSchedule()%>'});
		<%}%>
		console.log(calens);
		
		$(calens).each(function(idx,cal){
			console.log(idx+":"+cal.date);
			$("td").eq(cal.date-1).append("<br>"+cal.sche);
		});

	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center"></h3>

	<table  align="center" class="listTable" width="80%">
		<thead><tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr></thead>
		<tbody></tbody>

	</table>	
	
</body>
</html>