<%@ page contentType="text/html; charset=EUC-KR" %>
<% 
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="regBean" class="ch09.MemberBean"/>
<jsp:setProperty name="regBean" property="*"  />
<html>
<head>
<title>ȸ������ Ȯ��</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#996600">
<table width="80%"align="center" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
	<table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="memberInsert.jsp">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b> 
              <jsp:getProperty name="regBean" property="name" />
              ȸ������ �ۼ��Ͻ� �����Դϴ�. Ȯ���� �ּ���</b></font></td>
          </tr>
          <tr> 
            <td width="24%">���̵�</td>
            <td width="41%"><jsp:getProperty name="regBean" property="id" /></td>
          </tr>
          <tr> 
            <td>�н�����</td>
            <td> <jsp:getProperty name="regBean" property="pwd" /></td>
          </tr>
          <tr> 
            <td>�̸�</td>
            <td> <jsp:getProperty name="regBean" property="name" /></td>
          </tr>
          <tr> 
            <td>�������</td>
            <td> <jsp:getProperty name="regBean" property="birthday" /></td>
          </tr>
          <tr>
            <td>�̸���</td>
            <td><jsp:getProperty name="regBean" property="email" /></td>
          </tr>
          <tr> 
            <td colspan="2" align="center"> 
             <input type="button" value="Ȯ�οϷ�"> &nbsp; 
			  <input type="button" value="�ٽþ���" onClick="history.back()"> 
            </td>
          </tr>
        </form>
      </table>
	  </td>
  </tr>
</table>
</body>
</html>