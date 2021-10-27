<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<style>
	
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
	});
</script>
</head>
<%-- 
# MVC ajax처리.
1. 처리프로세스 
	1) controller로 초기화면 호출.
	2) 초기화면에 입력 처리 및 ajax 로 controller호출.
	3) 요청값을 받을 controller은 
		요청값을 기준으로 초기화면과 메시지를 전달하여야 할 내용을 조건 처리한다.
	4) 메시지 전달은 out.print()를 활용한다.
2. 실습예제
	controller : A24_AjaxController.java  buy02.do
		String priceS = request.getParameter("price");
		String cntS = request.getParameter("cnt");
	view : \a14_mvc\a04_mvcAjax.jsp
		가격:[   ]
		갯수:[   ] ==> enter키를 입력시, ajax로 controller 호출하여 처리
		
		
		
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("[name=price],[name=cnt]").keyup(function(event){
			if(event.keyCode==13){ 
				
				var snd="price="+$("[name=price]").val()+"&cnt="+$("[name=cnt]").val();
				xhr.open("get","${path}/buy02.do?"+snd,true);
				xhr.send();
				xhr.onreadystatechange=function(){ 
					if(xhr.readyState==4&&xhr.status==200){
						alert(xhr.responseText);
						$("#show").text(xhr.responseText);
					}
				};
			}
		});
	});
	// ex) 나이:[  ] ==> 18이상이면 성인, 이하이면 미성년으로 서버단에서 데이터를 처리해서 
	//     alert()과 화면에서 출력되게 처리하세요 3조.
</script>
<body>
	<h2 align="center">MVC ajax연습</h2>
	<table align="center" class="listTable">
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><th colspan="2" id="show"></th></tr>
</body>
</html>