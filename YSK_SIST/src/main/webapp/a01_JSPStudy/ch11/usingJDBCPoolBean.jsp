<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.*, ch11.*"%>
<jsp:useBean id="regMgr" class="ch11.RegisterMgrPool" />
<html>
<head>
<title>JSP���� �����ͺ��̽� ����</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<h2>Bean�� Ŀ�ؼ� Ǯ�� ����� �����ͺ��̽� ���� ����</h2><br/>
<h3>ȸ������</h3>
<table bordercolor="#0000ff" border="1">
<tr>
   <td><strong>ID</strong></td>
   <td><strong>PASSWD</strong></td>
   <td><strong>NAME</strong></td>
   <td><strong>NUM1</strong></td>
   <td><strong>NUM2</strong></td>
   <td><strong>EMAIL</strong></td>
   <td><strong>PHONE</strong></td>
   <td><strong>ZIPCODE/ADDRESS</strong></td>
   <td><strong>JOB</strong></td>	
</tr>
<%
	Vector<RegisterBean> vlist = regMgr.getRegisterList();
	int counter = vlist.size();
	for(int i=0; i<vlist.size(); i++){
   		RegisterBean regBean =vlist.get(i);
%>
<tr>
	<td><%=regBean.getId()%></td>
	<td><%=regBean.getPwd()%></td>
	<td><%=regBean.getName()%></td>
	<td><%=regBean.getNum1()%></td>
	<td><%=regBean.getNum2()%></td>
	<td><%=regBean.getEmail()%></td>
	<td><%=regBean.getPhone()%></td>
	<td><%=regBean.getZipcode()%>/<%=regBean.getAddress()%></td>
	<td><%=regBean.getJob()%></td>
</tr>
<%
   }
%>
</table>
<br/>
<br/>
total records : <%= counter %> 
</body>
</html>