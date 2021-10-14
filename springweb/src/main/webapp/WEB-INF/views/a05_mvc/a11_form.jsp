<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"시작!!(뷰와함께)"}
		});	
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>로그인</h2>
  <h3>입력한 ID : ${formCommand.id}</h3>
  <h4>선택된 OS</h4>
  <c:forEach var="cd" items="${favoriteOsCodes}">
  	${cd.code} - ${cd.label},
  </c:forEach>
  <c:forEach var="choice" items="${formCommand.favoriteOs}">
  	${choice}
  </c:forEach>  

</div>
<div class="container">
<!-- form 하위에 mapping되는 VO객체의 property와 연결되기 위하여 선언 필요 -->
<form:form modelAttribute="formCommand">
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <label class="input-group-text" for="loginType[0]">아이디</label>
    </div>
    <form:input path="id" class="form-control"/>
    <!-- <input id="id" name="id" class="form-control" type="text" value="himan"/> -->
  </div>

  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <label class="input-group-text" for="loginType[0]">로그인 타입(form:select)</label>
    </div>
    <form:select path="loginType[0]" items="${loginTypes}" class="form-control"/>
  </div>
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <label class="input-group-text" for="loginType[1]">로그인 타입(form:options)</label>
    </div>
	  <form:select path="loginType[1]" class="form-control">
		<option value="">--- 선택하세요 ---</option>
	    <form:options items="${loginTypes}"/>
	  </form:select>  </div>
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <label class="input-group-text" >선호 OS</label>
    </div>
    <form:checkboxes items="${favoriteOsNames}" path="favoriteOs" class="form-control"/>
  </div>
  <div class="input-group mb-3">
    <div class="input-group-prepend">
      <label class="input-group-text" >선호 OS</label>
    </div>
 	<form:checkboxes items="${favoriteOsCodes}" path="favoriteOs" itemValue="code" itemLabel="label" class="form-control"/>
	</div> 
    <button type="submit" class="btn btn-primary">가입 완료</button>
</form:form>  
</div>

</body>
</html>