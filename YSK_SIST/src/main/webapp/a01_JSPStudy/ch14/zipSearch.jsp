<%@ page contentType="text/html; charset=EUC-KR"%>
<%@page import="ch14.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="mMgr" class="ch14.MemberMgr" />
<%
	request.setCharacterEncoding("EUC-KR");
	String search = request.getParameter("search");
	 String area3 = null;
	 Vector<ZipcodeBean> vlist = null;
	 if (search.equals("y")) {
		area3 = request.getParameter("area3");
		vlist = mMgr.zipcodeRead(area3);
	 }
%>
<html>
<head>
<title>�����ȣ �˻�</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loadSearch() {
		frm = document.zipFrm;
		if (frm.area3.value == "") {
			alert("���θ��� �Է��ϼ���.");
			frm.area3.focus();
			return;
		}
		frm.action = "zipSearch.jsp"
		frm.submit();
	}

	function sendAdd(zipcode, adds) {
		opener.document.regFrm.zipcode.value = zipcode;
		opener.document.regFrm.address.value = adds;
		self.close();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td><br/>���θ� �Է� : <input name="area3">
					 <input type="button" value="�˻�" onclick="loadSearch();">
					 </td>
				</tr>
				<!-- �˻���� ���� -->
				<%
					if (search.equals("y")) {
							if (vlist.isEmpty()) {
				%>
				<tr>
					<td align="center"><br/>�˻��� ����� �����ϴ�.</td>
				</tr>
				<%
					} else {
				%>
				<tr>
					<td align="center"><br/>�ذ˻� ��, �Ʒ� �����ȣ�� Ŭ���ϸ� �ڵ����� �Էµ˴ϴ�.</td>
				</tr>
				<%
					for (int i = 0; i < vlist.size(); i++) {
							ZipcodeBean bean = vlist.get(i);
							String rZipcode = bean.getZipcode();
							String rArea1 = bean.getArea1();
							String rArea2 = bean.getArea2();
							String rArea3 = bean.getArea3();
							String adds = rArea1 + " " + rArea2 + " " + rArea3 + " ";
				%>
				<tr>
					<td><a href="#"
						onclick="javascript:sendAdd('<%=rZipcode%>','<%=adds%>')">
							<%=rZipcode%> <%=adds%></a></td>
				</tr>
				<%
					}//for
						}//if
					}//if
				%>
				<!-- �˻���� �� -->
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">�ݱ�</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>