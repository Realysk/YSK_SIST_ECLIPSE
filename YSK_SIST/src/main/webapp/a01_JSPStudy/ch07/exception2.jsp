<%@ page contentType="text/html;charset=EUC-KR"
                    isErrorPage="true"
%>
<%
   String message = exception.getMessage();
   String objectMessage = exception.toString();
%>
���� �޼��� : <b><%=message%></b><p/>
���� ��ü�� Ŭ������� ���� �޼���  : <b><%=objectMessage%></b><p/>