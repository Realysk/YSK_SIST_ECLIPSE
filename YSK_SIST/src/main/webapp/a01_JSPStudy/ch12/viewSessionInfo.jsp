<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*" %>
<html>
<head>
	<title>���ǻ�뿹��(����Ȯ��)</title>
</head>
<body>
<%
	Enumeration en = session.getAttributeNames();
	while(en.hasMoreElements()){
		String name = (String)en.nextElement();
		String value = (String)session.getAttribute(name);
		out.println("session name : " + name + "<br/>");
		out.println("seesion value " + value + "<br/>");
	}
%>
</body>
</html>