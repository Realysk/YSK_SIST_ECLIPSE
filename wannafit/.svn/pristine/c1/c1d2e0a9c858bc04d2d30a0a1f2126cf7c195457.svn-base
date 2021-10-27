<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value ="utf-8"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Wanna-Fit, 나만의 핏을 찾아서 </title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 

<script> $( function() {
	$( "#datepicker" ).datepicker(); 
}); </script>

<link rel="stylesheet" href="${path}/content/A_settings/main_nav.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="일정등록";
	}
</script>
</head>
<%--
#일정등록 
--%>
<%
String Snum = request.getParameter("Snum");
String title = request.getParameter("title");
String work1 = request.getParameter("work1");
String work2 = request.getParameter("work2");
String work3 = request.getParameter("work3");
String work4 = request.getParameter("work4");
String date = request.getParameter("date");
String comment = request.getParameter("comment");
%>

<%
//ScheduleDao dao = new ScheduleDao();
//dao.insetSchedule(new Schedule(Snum,title,work1,work2,work3,work4,date,comment));
//ArrayList<Schedule> ScheduleList = dao.getSchedule(new Schedule(Snum));

%>

	
	
<body>

	<jsp:useBean id = "Schedule" class = "wannafit.content.vo.Schedule"/>
	<!-- memberBean클래스로 member란 이름으로 객체를 생성한다 -->
	<jsp:setProperty name ="Schedule" property = "*"/>
	<!-- 요청파라미터값을 한꺼번에 저장한다. 하지만, 이렇기 위해서는 파라미터이름과 자바빈 프로퍼티 이름이 일치해야 한다.  -->
	<!-- 폼 양식으로 전달되는 매개변수값을 얻어와서, member객체의 property값으로 저장하기위해서 set을 사용한다. property는 전체저장! -->
	<jsp:setProperty name ="Schedule" property = "title"/>
	<jsp:setProperty name ="Schedule" property = "work1"/>
	<jsp:setProperty name ="Schedule" property = "work2"/>
	<jsp:setProperty name ="Schedule" property = "work3"/>
	<jsp:setProperty name ="Schedule" property = "work4"/>
	<jsp:setProperty name ="Schedule" property = "date"/>
	<jsp:setProperty name ="Schedule" property = "comment"/>
	
	
	
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><td>제목</td><td><input type="text" value = "" name ="title"/></td></tr>
		<tr><td>해야할일1</td><td><input type="text" value = "" name ="work1"/></td></tr>
		<tr><td>해야할일2</td><td><input type="text" value = "" name ="work2"/></td></tr>
		<tr><td>해야할일3</td><td><input type="text" value = "" name ="work3"/></td></tr>
		<tr><td>해야할일4</td><td><input type="text" value = "" name ="work4"/></td></tr>
		<tr><td>날짜</td><td><input type ="text" value="" name="date" id="datepicker"/></td></tr>
		<tr><td>댓글</td><td><input type="Text" value="" name="comment" id="comment"/></td></tr>

		<tr><td colspan="2"><input type="submit" value="일정등록" id="submit"/></td></tr>
	</table>	
	</form>
	
	<%if(request.getParameter("title")!=null) {%>
	<form id="frm02" action = "scheduler.jsp">
	<table>
		<tr><td>제목</td><td>${param.title}</td></tr>
		<tr><td>해야할일1</td><td>${param.work1}</td></tr>
		<tr><td>해야할일2</td><td>${param.work2}</td></tr>
		<tr><td>해야할일3</td><td>${param.work3}</td></tr>
		<tr><td>해야할일4</td><td>${param.work4}</td></tr>
		<tr><td>날짜</td><td>${param.date}</td></tr>
		<tr><td>댓글</td><td>${param.comment}</td></tr>
		<tr><td colspan="2"><input type="submit" value="수정하기" id="submit"/></td></tr>
	</table>
	</form>
	<%} %>
</body>
</html>