<%@ page contentType="text/html;charset=EUC-KR" %>
<%@page import="ch14.MemberBean"%>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<%
	String id = (String) session.getAttribute("idKey");
	MemberBean mBean = mMgr.getMember(id);
%>
<html>
<head>
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function zipCheck() {
		url = "zipSearch.jsp?search=n";
		window.open(url, "ZipCodeSearch","width=500,height=300,scrollbars=yes");
	}
</script>
</head>
<body bgcolor="#FFFFCC" onLoad="regFrm.id.focus()">
	<div align="center">
		<br /> <br />
		<form name="regFrm" method="post" action="memberUpdateProc.jsp">
			<table align="center" cellpadding="5" >
				<tr>
					<td align="center" valign="middle" bgcolor="#FFFFCC">
						<table border="1" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#996600">
								<td colspan="3"><font color="#FFFFFF"><b>ȸ�� ����</b></font></td>
							</tr>
							<tr>
								<td width="20%">���̵�</td>
								<td width="80%"><input name="id" size="15"
									value="<%=id%>" readonly></td>
							</tr>
							<tr>
								<td>�н�����</td>
								<td><input type="password" name="pwd" size="15"
									value="<%=mBean.getPwd()%>"></td>
							</tr>
							<tr>
								<td>�̸�</td>
								<td><input name="name" size="15"
									value="<%=mBean.getName()%>"></td>
							</tr>
							<tr>
								<td>����</td>
								<td>��<input type="radio" name="gender" value="1"
									<%=mBean.getGender().equals("1") ? "checked" : ""%>> ��<input
									type="radio" name="gender" value="2"
									<%=mBean.getGender().equals("2") ? "checked" : ""%>>
								</td>
							</tr>
							<tr>
								<td>�������</td>
								<td><input name="birthday" size="6"
									value="<%=mBean.getBirthday()%>"> ex)830815</td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input name="email" size="30"
									value="<%=mBean.getEmail()%>"></td>
							</tr>
							<tr>
								<td>�����ȣ</td>
								<td><input name="zipcode" size="5"
									value="<%=mBean.getZipcode()%>" readonly> <input
									type="button" value="�����ȣã��" onClick="zipCheck()"></td>
							</tr>
							<tr>
								<td>�ּ�</td>
								<td><input name="address" size="45" value="<%=mBean.getAddress()%>"></td>
							</tr>
							<tr>
								<td>���</td>
								<td>
									<%
										String list[] = { "���ͳ�", "����", "����", "��ȭ", "�" };
										String hobbys[] = mBean.getHobby();
										for (int i = 0; i < list.length; i++) {
											out.println( list[i]);
											out.println("<input type=checkbox name=hobby ");
											out.println("value=" + list[i] + " "
											+ (hobbys[i].equals("1") ? "checked" : "") + ">");
										}
									%>
								</td>
							</tr>
							<tr>
								<td>����</td>
								<td><select name=job>
										<option value="0">�����ϼ���.
										<option value="ȸ���">ȸ���
										<option value="����������">����������
										<option value="�����л�">�����л�
										<option value="�Ϲ��ڿ���">�Ϲ��ڿ���
										<option value="������">������
										<option value="�Ƿ���">�Ƿ���
										<option value="������">������
										<option value="����,���,������">����.���/������
										<option value="��,��,����,������">��/��/����/������
										<option value="�ֺ�">�ֺ�
										<option value="����">����
										<option value="��Ÿ">��Ÿ
								</select>
								<script>document.regFrm.job.value="<%=mBean.getJob()%>"</script>
								</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
								<input type="submit" value="�����Ϸ�"> &nbsp; &nbsp; 
								<input type="reset" value="�ٽþ���"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>