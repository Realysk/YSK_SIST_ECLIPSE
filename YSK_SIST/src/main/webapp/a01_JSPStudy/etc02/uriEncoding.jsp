<%@ page contentType="text/html;charset=EUC-KR" %>
<h1>server.xml URIEncoding="EUC-KR" ���</h1>
<%
	   String name = request.getParameter("name");
       if(name==null) name = "��û ���� ���� ����";
%>
��û���� �ѱ� name ����? <b><%=name %></b><p/>
<a href="uriEncoding.jsp?name=JSPStudy">JSPStudy</a>&nbsp;&nbsp;
<a href="uriEncoding.jsp?name=���� ���� �� ��Ÿ��">���� ���� �� ��Ÿ��</a>



