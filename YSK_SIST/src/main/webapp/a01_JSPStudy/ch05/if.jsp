<%@ page contentType="text/html;charset=EUC-KR"%>
<h1>If-else Example</h1>
<%!
      String msg;
%>
<%
     String name = request.getParameter("name");
     String color = request.getParameter("color");
  
     if (color.equals("blue")) {
	   msg = "�Ķ���";
   
    } else if (color.equals("red")) {
	   msg = "������";
   
    }else if (color.equals("orange")){
        msg = "��������";
        
    }else{
        color = "white";
		msg = "��Ÿ��";
    }
%>
<body bgcolor="<%=color%>">
<b><%=name%></b>���� �����ϴ� ������ <b><%=msg%></b>�Դϴ�. 
</body>