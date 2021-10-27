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
<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao" />
<c:set var="mem" value="${dao.getMember(param.id)}"/>
<table  align="center" class="listTable">
	<tr><th>아이디</th><td>${mem.id}</td></tr>
	<tr><th>패스워드</th><td>${mem.pass}</td></tr>
	<tr><th>권한</th><td>${mem.auth}</td></tr>
	<tr><th>포인트</th><td>${mem.point}</td></tr>
</table>
<%-- http://localhost:7080/jspexp/a00_exp/z03_data.jsp?id=himan --%>