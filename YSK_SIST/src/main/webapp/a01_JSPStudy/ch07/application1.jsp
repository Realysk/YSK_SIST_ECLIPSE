<%@ page contentType="text/html;charset=EUC-KR"%>
<%
	String serverInfo = application.getServerInfo();
	String mimeType = application.getMimeType("request1.html");
    String realPath = application.getRealPath("/");
	application.log("application ���� ��ü �α� �׽�Ʈ");
%>
<h1>Application Example1</h1>
���� �����̳��� �̸��� ���� : <%=serverInfo%><p/>
request1.html�� MIME Type : <%=mimeType%><p/>
���� ���� �ý��� ��� : <%=realPath%>