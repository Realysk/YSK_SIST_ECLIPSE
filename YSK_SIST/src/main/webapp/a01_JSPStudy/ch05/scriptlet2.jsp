<%@ page contentType="text/html;charset=EUC-KR"%>
<h1>Scriptlet Example2</h1>
<%
   float f = 2.3f;
   int i = Math.round(f);
   java.util.Date date = new java.util.Date();
%>
�Ǽ� f�� �ݿø�����? <%=i%><p/>
������ ��¥�� �ð���? <%=date.toString()%>