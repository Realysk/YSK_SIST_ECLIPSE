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
--------------------------------------------------------<br/>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(int i=0; i<cookies.length;++i){
%>
				Cookie Name : <%=cookies[i].getName()%><br/>
				Cookie Value : <%=cookies[i].getValue()%><br/>
<%
		}
	}		
%>
</body>
</html>