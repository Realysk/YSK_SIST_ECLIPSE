<%@page contentType="text/html;charset=EUC-KR"%>
<%@page import="java.util.*"%>
<%@page session="true"%>
<%@page buffer="16kb"%>
<%@page autoFlush="true"%>
<%@page isThreadSafe="true"%>
<%@page trimDirectiveWhitespaces="true"%>
<% Date date = new Date(); %>
<h1>trim After</h1>
������ ��¥�� �ð���?<p/>
<%=date.toLocaleString()%>