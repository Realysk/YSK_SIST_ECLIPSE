<%@ page contentType="text/html;charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");

		String name = request.getParameter("name");
		String studentNum = request.getParameter("studentNum");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");

		if(gender.equals("man")){
			gender = "����";
		}else{
			gender = "����";
		}
%>
<h1>Request Example1</h1>
���� : <%=name%><p/>
�й� : <%=studentNum%><p/>
���� : <%=gender%><p/>
�а� : <%=major%>