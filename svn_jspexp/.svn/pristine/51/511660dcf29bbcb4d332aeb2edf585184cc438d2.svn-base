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
1. 날짜형 데이터에 대한 fmt 기본 형식을 기술하세요.
	<fmt:formatDate value="java.util.Date객체가 보통 할당된다." 속성="속성값"/>
	주요속성
		type="date|time|both"
		dateStyle="full/short"
		timeStyle="full/short"
		pattern="yyyy/MM/dd  kk:mm:ss.S"
			yyyy :연도, MM :월, dd:일  kk:시간, mm:분, ss:초, S:1/1000초
2. 오늘을 기준으로 날짜와 현재시간을 full형식으로 출력처리하세요.
	<c:set var = "now" value="<%=new Date()%>"/>
	<fmt:formatDate type="date" dateStyle="full" value="${now}"/>
3. 숫자형 데이터의 기본 속성을 기술하세요.
	<fmt:formatNumber value="숫자형데이터" 속성="속성값"/>
	기본 형식으로 천단위 ,를 표기해준다.
	속성
		type="currency|percent" 통화단위(현재지역), %단위표기
		pattern="000,000,000.000" 지정한 범위(소숫점 이상 및 이하)에 표기를 해준다.		
4. DB 접근하여 MVC 패턴으로 데이터를 출력하는 기본 프로세스를 controller, 
   service, dao, view, model로 핵심코드와 함께 설명하세요.
   1) controller(서블릿 .java)
   		초기 화면구성, 기본 모델 데이터 생성
   		request.setAttribute("모델명", 화면단에 출력할 객체); service, dao를 통한 Model 데이터선언.
   		RequestDispatcher rd = request.getRequestDispatcher("이동할 jsp뷰단 호출)
   		rd.forward(request, response);
   2) service(.java)
   		모델단 처리를 위한 비지니스로직을 처리할 객체
   		dao단을 호출하고, controller에 특정한 데이터를 return해준다.
   3) dao(.java)
   		database access object로 데이터베이스를 접근하여 처리할 객체를 말한다.
   		sql 처리를 하고 service단에 결과값을 리턴한다.
   4) view단(.jsp)
   		화면구현, form객체 선언
   		${모델명} : controller에서 넘겨온 데이터 출력처리				
   
   
5. MVC 패턴으로 등록된 id인지 여부를 확인 처리(DAO추가)하는 jsp 프로그램을 구현하세요.
	1) 개발 순서
	- sql 작성 
	- dao단 메서드 확인 및 추가.
	- service단 생성 및 메서드 추가(dao단 호출 및 리턴)
	- controller 생성..
		초기화면 호출.
	- view단 생성
		id 요청값으로 호출
	- controller단 추가
		요청값 id 처리..
		service단 연동 및 model데이터로 등록여부를 전송
			request.setAttribute("reg", service.hasMember(id)==null?"등록가능":"등록불가능");
	- view단
		모델 데이터를 입력받아, js로 등록가능 여부 출력.		
				
# 주요 목표
1. MVC를 ajax형식을 위한 json 데이터 변환방법을 이해하고 처리할 수 있다.
2. jquery의 이벤트와 ajax처리의 핵심코드를 이해하고, 처리할 수 있다.
# 주요 코드
1. $.ajax({type: "get",url: "calc.jsp",data: {v1: $("#v1").val()},
				dataType: "text",
				success: function( responseData, status , xhr ){},
				error:function(xhr, status, error){},
				complete:function(){console.log("complete")});
   $('form').serialize()
2. $.getJSON("test.json",function(data){})


--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		
		var xhr = new XMLHttpRequest();
		$("[name=id]").keyup(function(event){
			/*		
		
			if(event.keyCode==13){
				$("form").submit();
			}
			*/
			if(event.keyCode==13){
				xhr.open("get","${path}/memIdCheck.do?id="+$(this).val(),true);
				xhr.send();
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&&xhr.status==200){
						// controller단 처리, 화면단 처리..구현..
						console.log(xhr.responseText);
						alert(xhr.responseText);
					}
				}
			}
			
		});
		/*
		var idCheck = "${idCheck}";
		if(idCheck!=""){
			alert(idCheck);
			if(idCheck=="등록가능"){
				$("[name=id]").val("${param.id}");
			}else{
				$("[name=id]").focus();
			}
		}*/		
	});

</script>
<body>
	<h2 align="center">회원등록</h2>
	<table align="center" class="listTable">
		<tr><th>id 등록여부확인</th><td><input type="text" name="id" value=""/></td></tr>
	</table>	
</body>
</html>