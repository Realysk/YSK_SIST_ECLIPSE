<%@ page contentType="text/html;charset=EUC-KR"
         session="true"
%>
<%
	  request.setCharacterEncoding("EUC-KR");

	  String id = request.getParameter("id");
	  String pwd = request.getParameter("pwd");

      session.setAttribute("idKey",id);
	  session.setMaxInactiveInterval(60*5);
%>
<h1>Session Example1</h1>
<form method="post" action="session1_1.jsp">
    1.���� �����ϴ� ������?<br/>
	<input type="radio" name="season" value="��">��
	<input type="radio" name="season" value="����">����
	<input type="radio" name="season" value="����">����
	<input type="radio" name="season" value="�ܿ�">�ܿ�<p/>

	2.���� �����ϴ� ������?<br/>
	<input type="radio" name="fruit" value="watermelon">����
	<input type="radio" name="fruit" value="melon">���
	<input type="radio" name="fruit" value="apple">���
	<input type="radio" name="fruit" value="orange">������<p/>
	<input type="submit" value="�������">
</form>