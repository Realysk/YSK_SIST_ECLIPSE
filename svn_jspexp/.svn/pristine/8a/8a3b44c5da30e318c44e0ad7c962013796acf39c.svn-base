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
<c:set var="emp" value="${dao.getEmp(param.empno)}"/>
{
<c:if test="${emp!=null}">
"empno":${emp.empno},"ename":"${emp.ename}","job":"${emp.job}",
 "mgr":${emp.mgr},"hiredate":"${emp.hiredate}","sal":${emp.sal},
 "comm":${emp.comm},"deptno":${emp.deptno}
</c:if> 
}