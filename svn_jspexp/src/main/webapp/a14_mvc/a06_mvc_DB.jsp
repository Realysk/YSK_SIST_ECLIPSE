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
# ajax로 DB처리..
1. 사원번호로 ajax 검색 및 json데이터 처리.(MVC패턴)
2. 파일정보
	controller : A26_AjaxController.java
	view : a14_mvc\a06_mvc_DB.jsp
3. 처리순서
	1) 초기화면 로딩
	2) 사원번호 입력 후, enter키시 ajax 처리..
	3) 요청값 처리 및 ajax처리 결과 json데이터 만들기
		- service, dao 호출
	4) service단
		- **Emp 객체 ==> json데이터 변환 전송.
	5) 컨트롤단
		- 출력 out.print(결과값 처리);
	6) view단 받은 json 문자열 ==> json객체로 변환
		해당 화면에 출력하기..
4. json lib를 활용한 객체를 json문자열 변환 처리..	
	webapp\WEB-INF\lib\gson-2.8.2.jar
	객체를 json문자열 데이터로
	json문자열 데이터를 객체로 변환 처리해준다.
--%>

<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("[name=empno]").keyup(function(event){
			if(event.keyCode==13){
				var empnoVal = $("[name=empno]").val();
				console.log($("[name=empno]").val())
				xhr.open("get","${path}/schEmp.do?empno="+empnoVal,true);
				xhr.send();
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&&xhr.status==200){
						var jTxt = xhr.responseText;
						$("#show td").text("");
						if(jTxt!="{}"){
							var emp = JSON.parse(xhr.responseText);
							console.log(emp);
							$("#show td").eq(0).text(emp.empno);
							$("#show td").eq(1).text(emp.ename);
							$("#show td").eq(2).text(emp.job);
							$("#show td").eq(3).text(emp.mgr);
							$("#show td").eq(4).text(emp.hiredate);
							$("#show td").eq(5).text(emp.deptno);
							$("#show td").eq(6).text(emp.sal);
							$("#show td").eq(7).text(emp.comm);
						}else{
							alert("해당 사원번호는 데이터가 없습니다.");					
						}
					}
				};
				
			}
		});
	});
</script>
<style>td{text-align:center;}</style>
<body>
	<h2 align="center">사원정보 mvc(ajax처리)</h2>
	<table align="center" class="listTable">
		<tr><th>사원번호</th><td><input type="text" name="empno" value=""/></td></tr>
	</table>	
	<table id="show"  align="center" class="listTable" width="50%">
		<col width="20%"><col width="30%"><col width="20%"><col width="30%">
		<tr><th>사원번호</th><td></td><th>사원명</th><td></td></tr>
		<tr><th>직책명</th><td></td><th>관리자번호</th><td></td></tr>
		<tr><th>입사일</th><td></td><th>부서번호</th><td></td></tr>
		<tr><th>급여</th><td></td><th>보너스</th><td></td></tr>
	</table>	
	
</body>
</html>