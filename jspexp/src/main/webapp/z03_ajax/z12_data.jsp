<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
	import="jspexp.z01_database.*"
	import="jspexp.z02_vo.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import
%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
<h3 align="center"> ${dao.login(param.id,param.pass)?'인증성공':'인증실패'} </h3>
<c:set var="mem" value="${dao.login2(param.id, param.pass)}"/>
<table align="center" class="listTable">
	<tr><th> ID </th><td>${mem.id}</td></tr>
	<tr><th> NAME </th><td>${mem.name}</td></tr>
	<tr><th> AUTH </th><td>${mem.auth}</td></tr>
	<tr><th> POINT</th><td>${mem.point}</td></tr>
</table>