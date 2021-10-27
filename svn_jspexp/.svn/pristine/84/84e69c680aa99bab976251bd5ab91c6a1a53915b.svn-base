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
# 정리문제
1. [jsp] 세션 scope의 범위를 구체적인 내용과 함께 기술하세요
	page(pageContext) : 현재 페이지에서만 해당 변수 유지
	request : 요청값이 전달되는 범위에서 변수 유지
	session : 브라우저와 서버가 연결된 상태에서 변수 유지
	application : 서버가 연결된 상태에서 변수 유지
2. [jsp] application 객체를 활용하여 web.xml에 설정되어 있는 값을 처리하는 코드를 기술하세요.
	web.xml : <context-param><param-name><param-value> 에서 name과 value로 설정된 값을 기준으로
	application.getInitParameter("name값")
	application.getInitParameterNames() : 설정된 name값들을 가져온다.
3. [jsp] <jsp:include> 액션 태그와 include 디렉티브 기본 코드와 차이점을 기술하세요.
	<%@ include file="포함된웹소스" %> : 해당 페이지를 포함하되, jsp의 경우 포함된 파일 전체를 컴파일한다.
		그러므로, 소스를 공유할 수 있다.
	<jsp:include page="포함된웹소스"/> : 해당 페이지를 포함하되, 각각 다른 jsp를 각자 컴파일하여 사용한다.
		그러므로, 소스내에 변수들을 공유하지 않고, param이라는 매개변수로 전달하여야 한다.	
4. [jsp] <jsp:include> 액션 태그로 매개변수값으로 데이터를 처리하는 방식을 이용해서 포함된 페이지에
    아이디값을 넘기세요.
    로그인 메뉴1 메뉴2 ==> 클릭시, 하단 메뉴 이동
    로그인 ID [  ][로그인] ==> 로그인후 메뉴1로 이동 ID값 전달
5. [jsp] <jsp:forward>를 활용하여 물건명과 가격, 갯수를 입력하여 결과페이지(물건명,계)를 출력하세요.
6. [jquery] filter()와 not()의 차이를 기술하세요.
	특정한 요소객체의 하위 객체를 선택적으로 처리하는 것을 말한다.
	형식으로 1) $("상위요소선택").filter("선택자").속성및기능메서드();
	2) $("상위요소선택").filter(function(idx){ return boolean;}).속성및기능메서드();
	not()은 위 filter의 내용 중에 반대되는 속성을 선택할 때 사용된다.	
7. [jquery] 버튼을 클릭시, h2는 배경색상 노랑색으로 처리하고, add()를 활용해서 h2와 함께
    h3의 글자색상을 navy로 처리하세요.
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("안녕");
		$("h3").text("반갑습니다!");
		$("h2").css("background","yellow").add("h3").css("color","navy");
		$("[type=button]").click(function(){
			if($(this).val()=="로그인1") $("[name=page01]").val("a0818_login.jsp");
			if($(this).val()=="메뉴1") $("[name=page01]").val("a0818_menu01.jsp");
			if($(this).val()=="메뉴2") $("[name=page01]").val("a0818_menu02.jsp");
			$("#frm01").submit(); // form을 구분하여 처리하여..요청페이지 처리..
		});
	});
</script>
<body>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h3 align="center"></h3>
	<h2 align="center"></h2>
	<h2 align="center"></h2>
	<h2 align="center"></h2>
	
	
	
	<form id="frm01" method="post">
		<input type="hidden" name="page01" value=""/>
	</form>
	<p align="center">
	<input type="button" id="logBtn" value="로그인"/>
	<input type="button" id="menu1Btn" value="메뉴1"/>
	<input type="button" id="menu2Btn" value="메뉴2"/></p>
	<%
	String goPage = request.getParameter("page01");
	System.out.println("포함될 페이지1:"+goPage);
	if(goPage==null||goPage.equals("")) goPage="a0818_login.jsp";
	System.out.println("포함될 페이지2:"+goPage);
	%>
	<jsp:include page="<%=goPage%>"/>
</body>
</html>