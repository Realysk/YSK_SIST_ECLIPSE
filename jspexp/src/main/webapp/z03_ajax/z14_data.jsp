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
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	<jsp:useBean id="dsch" class="jspexp.z02_vo.Dept"/>
	<c:set target="${dsch}" property="dname" value="${(not empty param.dname)?param.dname:''}"/>
	<c:set target="${dsch}" property="loc" value="${(not empty param.loc)?param.loc:''}" />
	<table  align="center" class="listTable">
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<c:forEach var="dept" items="${ dao.getDeptList(dsch) }">
			<tr><td>${dept.deptno}</td><td>${dept.dname}</td>
				<td>${dept.loc}</td></tr>
		</c:forEach>
	</table>