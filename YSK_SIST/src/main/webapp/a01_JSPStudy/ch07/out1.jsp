<%@ page contentType="text/html;charset=EUC-KR"
         buffer="5kb"
%>
<%
	int totalBuffer = out.getBufferSize();
	int remainBuffer = out.getRemaining();
	int useBuffer = totalBuffer - remainBuffer;
%>
<h1>Out Example1</h1>
<b>���� �������� Buffer ����</b><p/>
��� Buffer�� ��ü ũ�� : <%=totalBuffer%>byte<p/>
���� Buffer�� ũ�� : <%=remainBuffer%>byte<p/>
���� Buffer�� ��뷮 : <%=useBuffer%>byte<p/>