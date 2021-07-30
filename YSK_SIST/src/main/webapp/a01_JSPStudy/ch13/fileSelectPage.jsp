<%@page contentType="text/html; charset=EUC-KR" %>
<%! 
	public String getParam(HttpServletRequest request, String paramName){
		if(request.getParameter(paramName)!=null){
			return request.getParameter(paramName);
		}else{
			return "";
		}
	}
%>
<%
	request.setCharacterEncoding("EUC-KR");
	int filecounter = 0;
	if(request.getParameter("addcnt")!=null){
		filecounter = Integer.parseInt(request.getParameter("addcnt"));
	}
%>
<html>
<head>
<title>File Select Page</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript">
function inputValue(form1, param, form2, idx){
	var paramValue = form1.elements[idx].value;
	form2.elements[idx].value = paramValue;			 
	return;
}
function addFile(formName){
	if(formName.addcnt.value==""){
		alert(" �Է��� ���� ������ �Է��ϰ� Ȯ�ι�ư�� �����ּ���" ); 
		formName.addcnt.focus();						 
		return;
	}
	formName.submit();
}

function elementCheck(formName){
   paramIndex = 1; 
   for(idx=0; idx<formName.elements.length; idx++){
      if(formName.elements[idx].type == "file"){
         if(formName.elements[idx].value==""){
	        var message = paramIndex +" ��° ���������� �����Ǿ����ϴ�.\n���ε��� ������ ������ �ּ���";
		    alert(message);
			formName.elements[idx].focus();
			return;		
	     }
	     paramIndex++; 
      }
   }
   formName.action = "fileInfoView.jsp";
   formName.submit();
}
</script>
</head>
<body topmargin="100">
<div align="center"><font color="#0000ff" size="2">
�������� ������ ���ε带 ���Ͽ� ���� ������ �Է��� ��<br/>
Ȯ�� ��ư�� �����ּ���!!!<br/>
�Է��� �Ϸ�Ǹ� DONE ��ư�� �����ּ���</font></div><br/>
<form name="frmName1" method="post">
<table width="75%" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#660000" bgcolor="#FFFF99">
<tr bgcolor="#FFCC00">
    <td width="10%"><div align="right">user</div></td>
    <td><input  name="user" onkeyup="inputValue(this.form,user,frmName2,0)" value="<%=getParam(request, "user")%>"></td>
    <td width="10%"><div align="right">title</div></td>
    <td><input name="title" onkeyup="inputValue(this.form,title,frmName2,1)" value="<%=getParam(request, "title")%>"></td>
</tr>
<tr bgcolor="#FFCC00">
	<td width="15%"><div align="right">content</div></td>
	<td width="50%" colspan="3">
	<textarea name="content" cols="40" onkeyup="inputValue(this.form,content, frmName2,2)"><%=getParam(request,"content")%></textarea>
	</td>
</tr>
<tr>
	<td colspan="4"><div align="center">
	<font size="-2">�߰��� ���� �� �Է�</font>
	<input name="addcnt">
	<input type="button" value=" Ȯ�� " onclick="addFile(this.form)">
	</div>
	</td>
</tr>
</table>
</form>

<form name="frmName2" method="post" enctype="multipart/form-data">
<table width="75%" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#660000" bgcolor="#FFFF99">
<tr bgcolor="#FFCC00">
	<td width="40%">
	<input type="hidden" name="user" value="<%=getParam(request, "user")%>">
	<input type="hidden" name="title" value="<%=getParam(request, "title")%>">
	<input type="hidden" name="content" value="<%=getParam(request,"content")%>">
	<%	for(int i=0; i<filecounter; i++){%>
	<input type="File" size="50" name="selectFile<%=i%>"><br/>	 	
	<%	}%>
	</td>
	<td><input type="button" value="DONE" onclick="elementCheck(this.form)"></td>
</tr>
</table>
</form>
</body>
</html>