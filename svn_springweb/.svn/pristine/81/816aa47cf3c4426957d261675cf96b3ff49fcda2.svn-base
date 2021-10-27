<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
<spring code="코드값" /> ==> 코드값에 mapping 된 내용이 언어에 따라서
출력이 된다..

 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		<%-- 
welcome=welcome!
id=id
name=name
pwd=password
greet=hi!!
regmem=register member!
search=search		
		--%>
		$("h2").text("<spring:message code='multilang'/>");
		var lang="${param.lang}";
		$("#selectLan").val(lang);
		$("#selectLan").change(function(){
			if( $(this).val()!=""){
				$(location).attr("href","${path}/choiceLan.do?lang="+$(this).val());
			}
		});
	});
</script>
</head>

<body> 
<div class="jumbotron text-center">
  	<h2></h2>
  	<select class="form-control" id="selectLan">
  		<option value="" ><spring:message code="chlang"/></option>
  		<option value="ko" ><spring:message code="ko"/></option>
  		<option value="en" ><spring:message code="en"/></option>
  	</select>
  
</div>
<div class="container">
    <h3 align='center'><spring:message code="regmem"/></h3>
	<div class="input-group mb-3">
		<div class="input-group-prepend">
			<span class="input-group-text">
			<spring:message code="id"/></span>
		</div>
		<input name="id" class="form-control" 
			placeholder="<spring:message code="id"/> <spring:message code="reg"/>" />
	</div>
	<div class="input-group mb-3">							
		<div class="input-group-prepend">
			<span class="input-group-text">
			<spring:message code="pwd"/></span>
		</div>
		<input name="pass" class="form-control" 
			placeholder="<spring:message code="pwd"/> <spring:message code="reg"/>" />			 
	</div>      
</div>
</body>
</html>