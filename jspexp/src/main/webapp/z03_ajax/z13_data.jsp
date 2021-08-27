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
	<jsp:useBean id="sch" class="jspexp.z02_vo.Emp"/>
	<%-- 요청값이 null일 때, ""으로 처리.. --%>
	<c:set target="${sch}" property="ename" value="${(not empty param.ename)?param.ename:''}"/>
	<c:set target="${sch}" property="job" value="${(not empty param.job)?param.job:''}" />
	<table  align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th><th>부서</th></tr>
		<c:forEach var="emp" items="${ dao.getPreparedEmpList(sch) }" varStatus="sts">
			<tr><td>${emp.empno}</td><td>${emp.ename}</td>
				<td>${emp.job}</td><td>${emp.sal}</td><td>${emp.deptno}</td></tr>
		</c:forEach>
	</table>
<%--
http://localhost:7080/jspexp/z03_ajax/z13_data.jsp?ename=A&job=A
 --%>	