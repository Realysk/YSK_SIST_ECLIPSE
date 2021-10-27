<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="VO_FUN2" class="wannafit.content.vo._deletefile2" scope="session"/> 
<jsp:setProperty property="support_money" name="VO_FUN2" />
 <p>최종금액: ${VO_FUN2.support_money}</p>
     
<h2 id ="tot2" align ="center">${param.num01 + param.num02}원</h2>
 