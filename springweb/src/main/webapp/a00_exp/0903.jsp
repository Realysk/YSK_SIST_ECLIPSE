<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
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
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style type="text/css">
/*aquamarine bisque*/
	.input-group-text{width:100%;
		text-align:center;background-color:#cfffdf;color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		$("h2").click(function(){
			$("#dialog").dialog("open");
		});	
		$( "#dialog" ).dialog({
			autoOpen:false,
			modal:true,
			buttons:{
				"기능버튼":function(){
					alert("버튼클릭!");
				}
			}
		});				
	});
</script>
</head>
<%-- 
# 
# 정리문제
1. $("form").serialize()는 어떤 역할을 하는지 기술하세요.
2. ajax로 하나의 프로그램을 처리(등록,수정,삭제)할 때, 필요한 내용을 js단, controller, service, dao단을 나누어
    설명하세요
3. 기본 스프링 개발환경을 설정할 때, 필요한 부분을 기술하세요.
4. 스프링에서 front controller란 무엇을 말하는가?    
5. http://localhost:7080/springweb/call.do
    1) 7080 : 어디에서 설정하는 내용인가?
    2) springweb : 어떤 기준을 통해서 설정되는가?
    3) call.do 와 연결되는 부분을 controller, view가 처리되는 과정을 
    web.xml, dispatcher-servlet.xml, 컨트롤러.java, 화면view.jsp를 활용하여 기술하세요.
6. springweb2로 다이나믹 웹프로젝트를 만들고, 
    http://localhost:7080/springweb2/restart.do로 모델데이터가 출력되는 스프링환경의 화면을 구현하세요.
# 주요 목표
1. 스프링 MVC화면에서 요청값과 모델 데이터를 처리할 수 있다.
2. 스프링 MVC의 DI패턴을 설정하고 해당 개념에 의해 객체를 생성하고 property를 사용할 수 있다.
# 주요 개념 및 코드
1. IOC, DI, 
2. Resource rs = new ClassPathResource()
3. BeanFactory bean = new XmlBeanFactory(rs);
4. @RequestMapping, Model, addAttribute(), ModelAndView
--%>
<%

%>
<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>
</div>
<div class="container">
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>
</div>
<div id="dialog" title="Basic dialog">
  <p>This is the default dialog which is useful for displaying information. The dialog window can be moved, resized and closed with the 'x' icon.</p>
</div>		
</body>
</html>