<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.util.*, etc01.*"%>
<jsp:useBean id="rMgr" class="etc01.RegisterMgr"/>
<html>
<head>
<title>JSP���� �����ͺ��̽� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<h2>Bean�� ����� �����ͺ��̽� ���� �����Դϴ�....</h2>
<br/><br/>
<h3>ȸ������</h3>
<table bordercolor="#0000ff" border="1">
<tr>
   <td><strong>ID</strong></td>
   <td><strong>PWD</strong></td>
   <td><strong>NAME</strong></td>
   <td><strong>NUM1</strong></td>
   <td><strong>NUM2</strong></td>
   <td><strong>EMAIL</strong></td>
   <td><strong>PHONE</strong></td>
   <td><strong>ZIPCODE/ADDRESS</strong></td>
   <td><strong>JOB</strong></td>	
</tr>
<%
		Vector<RegisterBean> vlist = rMgr.getRegisterList();
		int counter = vlist.size();
		for(int i=0; i<vlist.size(); i++){
   			RegisterBean bean = (RegisterBean)vlist.elementAt(i);
%>
<tr>
	<td><%=bean.getId()%></td>
	<td><%=bean.getPwd()%></td>
	<td><%=bean.getName()%></td>
	<td><%=bean.getNum1()%></td>
	<td><%=bean.getNum2()%></td>
	<td><%=bean.getEmail()%></td>
	<td><%=bean.getPhone()%></td>
	<td><%=bean.getZipcode()%>/<%=bean.getAddress()%></td>
	<td><%=bean.getJob()%></td>
<%}%>
</tr>
</table>
<br/><br/>
total records : <%= counter %> 
</body>
</html>