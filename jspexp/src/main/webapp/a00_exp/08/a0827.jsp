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
1. XMLHttpRequest 객체의 get/post방식의 코드차이를 기술하세요
	0) 매개변수
		xhr.open("get|post",...);
	1) 요청값 처리 방식..
		get방식 : xhr.open("get","call.jsp?key=value&key2=value",..);
		post방식 : xhr.open("post","call.jsp"..)
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send("key=value&key2=value2");
2. post방식/비동기으로 학생의 국어/영어/수학 점수를 입력하여 총점과 평균을 출력하세요.
3. get방식/동기로 회원아이디를 입력하여 DAO를 통해 해당 회원의 아이디/패스워드, 이름, 권한, 포인트를 출력되게 하세요.
	
4. jstl와 usebean을 활용하여 객체선언 및 데이터할당 3가지 방식을 기술하세요.
	1) request.setAttribute("p02",new Person("himan",25,"서울신림"));
	   <c:set var="obj01" value="${p02}"/>
		${obj01.name}
	2) <c:set var="obj02" value="<%=new Person()%>/>
	   <c:set target="${obj02}" property="name" value="higirl"/>
	    ${obj02.name}
	3) <jsp:useBean id="obj03" class="vo.Person"/>
	   <jsp:setProperty name="obj03" property="name" value="홍길동"/>
	    ${obj03.name}
5. 임의의 구구단이 출력되어 입력값을 입력했을 때, 입력하지 않을 때와 정답/오답 jstl 조건문을 활용하여 처리하세요.
6. 물건가격[   ] 갯수[   ] [구매]
    구매 총계가 10만원 이상일 때, 10%할인, 5~10미만 5%, 그외는 3%할인 할인률과 최종 금액 표시(jstl 활용 출력)
# 오늘 학습 목표
1. jstl 반복문의 주요 코드를 이해하고 기본 반복문과 list형 반복문을 활용할 수 있다.
2. jstl을 활용하여 요청값을 처리하고, dao를 연동하여 리스트된 데이터를 출력할 수 있다.
3. 여러가지 데이터를 fmt 태그를 활용하여 필요한 형식으로 출력할 수 있다.
4. XMLHttpRequest 객체를 DAO와 연동하여 json 데이터를 변환하여 화면에 출력할 수 있다.
# 오늘 핵심 개념 및 코드
<c:forEach var="변수명" begin="시작변수" end="마지막" step="증가단위"/> for(int cnt=1;cnt<=5;cnt++)
<c:forEach var="변수명" items="리스트형데이터" varStatus="sts"/>	 for(Product p :plist)
<c:forTokens delims="구분자" items="구분자포함데이터"/>
<fmt:formatDate type="date|time|both" dateStyle="full|short"
timeStyle="full|short" pattern="yyyy/MM/dd kk:mm:ss.S" />
<fmt:formatNumber value="${num01}" type="currency"/>
--%>
<script type="text/javascript">
	$(document).ready(function(){
		// 2. post방식/비동기으로 학생의 국어/영어/수학 점수를 입력하여 총점과 평균을 출력하세요.
		var xhr = new XMLHttpRequest();
		$("[name=kor],[name=eng],[name=math]").keyup(function(event){
			
			if(event.keyCode==13){ // enter키를 입력했을 때, 키코드값 13
				// 화면에 있는 모든 데이터는 문자열, +(덧셈)을 처리하기 위해서는  숫자형으로 변환
				var kor = $("[name=kor]").val();
				var eng = $("[name=eng]").val();
				var math =$("[name=math]").val();
				var snd = "kor="+kor+"&eng="+eng+"&math="+math;
				xhr.open("post","z02_data.jsp",true);
				xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
				console.log(snd);
				xhr.send(snd);
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&&xhr.status==200){
						$("#div01").html(xhr.responseText);
					}
				}
			}
		});
		$("[name=id]").keyup(function(event){
			//3. get방식/동기로 회원아이디를 입력하여 DAO를 통해 해당 회원의 아이디/패스워드, 이름, 권한, 포인트를 출력되게 하세요.
			//   일반적으로 비동기(asynchronized) 통신의 목적으로 한 경우가 많기 때문에 속성 option  true가 비동기
			//   false가 동기 통신..
			if(event.keyCode==13){
				var idVal = $("[name=id]").val();
				xhr.open("get","z03_data.jsp?id="+idVal,false);
				xhr.send();
				$("#div02").html(xhr.responseText);
			}
		});
		$("[name=num01]").val(Math.floor(Math.random()*8+2));
		$("[name=num02]").val(Math.floor(Math.random()*9+1));
		$("[name=inputReply]").keyup(function(event){
			if(event.keyCode==13){
				$("#frm01").submit();
			}
		});
	});
</script>
<body><h2 align="center">연습예제</h2>
<%--6. 물건가격[   ] 갯수[   ] [구매]
    구매 총계가 10만원 이상일 때, 10%할인, 5~10미만 5%, 그외는 3%할인 할인률과 최종 금액 표시(jstl 활용 출력)
 --%>
	<form id="frm02" method="post">
	<table align="center" class="listTable">
		<tr><th>물건가격</th><td><input type="text" name="price" size="3" /></td></tr>
		<tr><th>물건갯수</th><td><input type="text" name="cnt" size="3" /></td></tr>
		<tr><th colspan="2"><input type="submit" value="구매"/></th></tr>
	</table>	
	</form>
	<%-- jstl의 변수는 지역변수/전역변수의 개념이 없다. 
		조건문에 선언된 내용도 조건문이나 반복문 밖에서 사용할 수 있다. --%>
	<h3 align="center">
		<c:if test="${not empty param.price}">
			<c:set var="tot" value="${param.price*param.cnt}"/>
			<c:choose>
				<c:when test="${tot>=100000}">
					<c:set var="disRatio" value="10%"/>
					<c:set var="last_tot" value="${Math.round(tot*0.9)}"/>
				</c:when>
				<c:when test="${tot>=50000}">
					<c:set var="disRatio" value="5%"/>
					<c:set var="last_tot" value="${Math.round(tot*0.95)}"/>				
				</c:when>
				<c:otherwise>
					<c:set var="disRatio" value="3%"/>
					<c:set var="last_tot" value="${Math.round(tot*0.97)}"/>				
				</c:otherwise>
			</c:choose>
			물건 가격:${param.price },물건갯수:${param.cnt},
			총계:${tot},할인율:${disRatio},최종금액:${last_tot}
		</c:if>
	</h3>

	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>구구단</th></tr>
		<tr><th><input type="text" name="num01" size="3" /> X 
				<input type="text" name="num02" size="3"/>
		</th></tr>
		<tr><th>정답 : <input type="text" name="inputReply" size="3" /></th></tr>
	</table>	
	</form>
	<h3 align="center">
		<c:if test="${not empty param.inputReply }"><%--입력값이 있을 때.. --%>
			${param.num01} X ${param.num02} = ${param.inputReply }
			<c:choose>
				<c:when test="${param.num01*param.num02 == param.inputReply }">
					정답입니다.
				</c:when>
				<c:otherwise>
					오답입니다.
				</c:otherwise>
			</c:choose>
		</c:if>
	</h3>


	<table align="center" class="listTable">
		<tr><th>회원아이디</th><td><input type="text" name="id" /></td></tr>
	</table>	
	<div id="div02">
	</div>

	<table align="center" class="listTable">
		<tr><th>국어</th><td><input type="text" name="kor" value="0"/></td></tr>
		<tr><th>영어</th><td><input type="text" name="eng" value="0"/></td></tr>
		<tr><th>수학</th><td><input type="text" name="math" value="0"/></td></tr>
	</table>	
	<div id="div01">
	</div>
	
	
</body>
</html>