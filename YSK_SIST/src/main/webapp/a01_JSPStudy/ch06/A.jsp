<%@ page contentType="text/html;charset=EUC-KR"%>
<h1>Forward Tag Example2</h1>
<%
   String name = request.getParameter("name");
   String bloodType = request.getParameter("bloodType");
%>
<b><%=name%></b>���� ��������
<b><%=bloodType%></b>���̰�
�����ϰ� �ϸ� �Ϻ��������Դϴ�.