<%@ page contentType="text/html;charset=EUC-KR" %>
<html>
<head>
<title>ȸ������</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></script>
<script type="text/javascript">
	function idCheck(id) {
		frm = document.regFrm;
		if (id == "") {
			alert("���̵� �Է��� �ּ���.");
			frm.id.focus();
			return;
		}
		url = "idCheck.jsp?id=" + id;
		window.open(url, "IDCheck", "width=300,height=150");
	}

	function zipCheck() {
		url = "zipSearch.jsp?search=n";
		window.open(url, "ZipCodeSearch","width=500,height=300,scrollbars=yes");
	}
</script>
</head>
<body bgcolor="#FFFFCC" onLoad="regFrm.id.focus()">
	<div align="center">
		<br /><br />
		<form name="regFrm" method="post" action="memberProc.jsp">
			<table align="center" border="0" cellspacing="0" cellpadding="5">
				<tr>
					<td align="center" valign="middle" bgcolor="#FFFFCC">
						<table border="1" cellspacing="0" cellpadding="2" align="center" width="600">
							<tr align="center" bgcolor="#996600">
								<td colspan="3"><font color="#FFFFFF"><b>ȸ�� ����</b></font></td>
							</tr>
							<tr>
								<td width="20%">���̵�</td>
								<td width="50%"><input name="id" size="15"
									value=""> <input type="button" value="ID�ߺ�Ȯ��"
									onClick="idCheck(this.form.id.value)"></td>
								<td width="30%">���̵� ���� �ּ���.</td>
							</tr>
							<tr>
								<td>�н�����</td>
								<td><input type="password" name="pwd" size="15" value=""></td>
								<td>�н����带 �����ּ���.</td>
							</tr>
							<tr>
								<td>�н����� Ȯ��</td>
								<td><input type="password" name="repwd" size="15" value=""></td>
								<td>�н����带 Ȯ���մϴ�.</td>
							</tr>
							<tr>
								<td>�̸�</td>
								<td><input name="name" size="15" value="">
								</td>
								<td>�̸��� �����ּ���.</td>
							</tr>
							<tr>
								<td>����</td>
								<td>��<input type="radio" name="gender" value="1"
									checked="checked"> ��<input type="radio" name="gender"
									value="2">
								</td>
								<td>������ ���� �ϼ���.</td>
							</tr>
							<tr>
								<td>�������</td>
								<td><input name="birthday" size="6" value="">
									ex)830815</td>
								<td>������ϸ� ���� �ּ���.</td>
							</tr>
							<tr>
								<td>Email</td>
								<td><input name="email" size="30" value="">
								</td>
								<td>�̸��ϸ� ���� �ּ���.</td>
							</tr>
							<tr>
								<td>�����ȣ</td>
								<td><input name="zipcode" size="5" readonly>
									<input type="button" value="�����ȣã��" onClick="zipCheck()">
								</td>
								<td>�����ȣ�� �˻��ϼ���.</td>
							</tr>
							<tr>
								<td>�ּ�</td>
								<td><input name="address" size="45"></td>
								<td>�ּҸ� ���� �ּ���.</td>
							</tr>
							<tr>
								<td>���</td>
								<td>���ͳ�<input type="checkbox" name="hobby" value="���ͳ�">
									����<input type="checkbox" name="hobby" value="����"> ����<input
									type="checkbox" name="hobby" value="����"> ��ȭ<input
									type="checkbox" name="hobby" value="��ȭ"> �<input
									type="checkbox" name="hobby" value="�">
								</td>
								<td>��̸� ���� �ϼ���.</td>
							</tr>
							<tr>
								<td>����</td>
								<td><select name=job>
										<option value="0" selected>�����ϼ���.
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
								</select></td>
								<td>������ ���� �ϼ���.</td>
							</tr>
							<tr>
								<td colspan="3" align="center">
									<input type="button"value="ȸ������" onClick="inputCheck()"> &nbsp; &nbsp; 
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
