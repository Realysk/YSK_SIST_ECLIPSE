<%@ page contentType="text/html;charset=EUC-KR"%>
<h1>Expression Example2</h1>
<%
    java.util.Date date = new java.util.Date();
    int hour = date.getHours();
	int one = 10;
	int two = 12; 	
%>
<%!
	public int operation(int i,int j){
	return i > j ? i : j;
	}
%>
������ �����ϱ�� �����ϱ��? <%=(hour < 12)? "����":"����"%><p>
one �� two �� �߿� ū ���ڴ�? <%=operation(one,two)%>