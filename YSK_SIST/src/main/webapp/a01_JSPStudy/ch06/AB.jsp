<%@ page contentType="text/html;charset=EUC-KR"%>
<h1>Forward Tag Example2</h1>
<%
	String name = request.getParameter("name");
	String bloodType = request.getParameter("bloodType");
%>
<%=name%>���� ��������
<b><%=bloodType%></b>���̰�<p>
��Ȯ�� �Ǵܷ��� ���� �ո��������Դϴ�.
