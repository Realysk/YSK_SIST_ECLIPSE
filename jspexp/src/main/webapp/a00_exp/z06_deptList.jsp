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
<jsp:useBean id="sch" class="jspexp.z02_vo.Dept"/>
<jsp:setProperty property="*" name="sch"/>
<c:if test="${sch.dname==null}"><c:set target="${sch}" property="dname" value="" /></c:if>
<c:if test="${sch.loc==null}"><c:set target="${sch}" property="loc" value="" /></c:if>
[
<c:forEach var="dept" items="${dao.getDeptList(sch)}" varStatus="sts">
	{"deptno":${dept.deptno},"dname":"${dept.dname}","loc":"${dept.loc}"}
	<c:if test="${!sts.last}">,</c:if>
</c:forEach>
]
<%-- 
http://localhost:7080/jspexp/a00_exp/08/z06_deptList.jsp?dname=A&loc=B
--%>