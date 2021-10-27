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

</head>
<%-- 
# 정리문제
1. [ajax] 부서정보를 keyup 이벤트로 ajax로 검색되게 처리하세요(dao연동)
    단, json데이터를 만들어서 처리가 되게 하세요
    1) dao연동 json 데이터 처리 구현
    2) 부서정보 keyup이벤트로 ajax 처리
2. [jstl] forTokens의 속성들을 기술하세요.
	<c:forTokens 속성="속성값
	var : 사용된 단위 데이터 변수
	items : 구분자가 포함되어 있는 문자열 데이터 
	delims : 구분자
	varStatus : 변수를 선언하고, 해당 변수에 .index, .count, .first, .last
3. [jstl] forTokens을 이중으로 활용하여 문자열데이터 "사과^3000^2@오렌지^2000^3@수박^1200^3"
    을 처리하여, 테이블에 출력하세요.

# 주요 목표
1. MVC를 통한 개발 패턴을 기본 form형식과 ajax형식을 비교할 수 있고, 데이터 처리할 수 있다.
2. json 데이터를 sever단에서 VO나 ArrayList를 통해서 변환하는 방법을 이해하고 처리할 수 있다.
3. jquery의 여러가지 이벤트 형식을 이해하고 처리할 수 있다.
# 핵심코드
$("요소").on({"이벤트1":function(){},"이벤트2":function(){})
.bind(), unbind(), 
.prependTo(), after(), before(), wrap(), replaceWith(), clone()
--%>
<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("[name=dname],[name=loc]").keyup(function(event){
			var snd = "dname="+$("[name=dname]").val()+"&loc="+$("[name=loc]").val();
			xhr.open("post","z06_deptList.jsp",true);
			xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhr.send(snd);
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					//console.log(xhr.responseText); 
					// (xhr.responseText : 서버에서 전달되어온 문자열형 json 데이터
					// JSON.parse() : js의 활용 객체로 변환..
					var dlist = JSON.parse(xhr.responseText);
					//console.log(dlist);
					var show="";
					// $(배열).each(function(index, 단위객체){});
					$(dlist).each(function(idx, dept){
						console.log(idx+":"+dept);	
						show+="<tr><td>"+dept.deptno+"</td><td>"+dept.dname+"</td><td>"+dept.loc+"</td></tr>"
					});
					$("#data tbody").html(show);					
				}
			}	
		});	
	});
</script>
<style>td{text-align:center;}</style>
<body>
	<h2 align="center">문제1(부서정보 ajax 검색)</h2>
	<table align="center" class="listTable">
		<tr><th>부서명</th><td><input type="text" name="dname" value=""/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value=""/></td></tr>
	</table>	
	<table id="data"  align="center" class="listTable" width="70%">
		<col width="33%"><col width="33%"><col width="33%">
		<thead><tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr></thead>
		<tbody></tbody>
	</table>	
<%--
3. [jstl] forTokens을 이중으로 활용하여 문자열데이터 "사과^3000^2@오렌지^2000^3@수박^1200^3"
    을 처리하여, 테이블에 출력하세요.
 --%>	
 	<c:set var="data01" value="사과^3000^2@오렌지^2000^3@수박^1200^3"/>
	<h2 align="center">문제2(jstl forTokens)</h2>	
	<table id="data"  align="center" class="listTable" width="70%">
		<col width="33%"><col width="33%"><col width="33%">
		<thead><tr><th>물건명</th><th>가격</th><th>갯수</th></tr></thead>
		<c:forTokens var="prod" items="${data01}" delims="@">
		<tr>
			<c:forTokens var="p01" items="${prod}" delims="^">
			<td >${p01}</td>
			</c:forTokens>
		</tr>
		</c:forTokens>
	</table>	
	
</body>
</html>