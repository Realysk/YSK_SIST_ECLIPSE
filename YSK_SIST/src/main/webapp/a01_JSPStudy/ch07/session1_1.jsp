<%@ page contentType="text/html;charset=EUC-KR"%>
<%
	   request.setCharacterEncoding("EUC-KR");

		String season = request.getParameter("season");
		String fruit = request.getParameter("fruit");
    	String id = (String)session.getAttribute("idKey");    
		String sessionId = session.getId();
		int intervalTime = session.getMaxInactiveInterval();
 
		if(id != null){
%>
<h1>Session Example1</h1>
<b><%=id%></b>���� �����Ͻô� ������ ������<p/>  
<b><%=season%></b>�� <b><%=fruit%></b> �Դϴ�.<p/>
���� ID : <%=sessionId%><p>
���� ���� �ð� : <%=intervalTime%>��<p/>
<%
	 session.invalidate();
	}else{
         out.println("������ �ð��� ����� �Ͽ��ų� �ٸ� ������ ������ �� ���� �����ϴ�.");
    }
%>
