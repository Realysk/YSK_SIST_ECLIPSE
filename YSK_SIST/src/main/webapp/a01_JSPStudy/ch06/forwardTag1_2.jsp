<%@page contentType="text/html;charset=EUC-KR"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
%>
<h1>Forward Tag Example1</h1>
����� ���̵��<b><%=id%></b>�̰�<p/>
�н������ <b><%=pwd%></b> �Դϴ�.