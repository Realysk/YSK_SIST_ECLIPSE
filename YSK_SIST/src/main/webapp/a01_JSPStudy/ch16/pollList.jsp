<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="ch16.*,java.util.Vector"%>
<jsp:useBean id="pMgr" class="ch16.PollMgr" />
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br/>
		<h2>��ǥ���α׷�</h2>
		<hr width="600"/>
		<b>������</b>
		<!--�� ����Ʈ �� �ڸ�-->
		<jsp:include page="pollForm.jsp" />
		<hr width="600"/>
		<b>��������Ʈ</b>
		<!--�� ����Ʈ ���̺� �ڸ�-->
		<table>
			<tr>
				<td>
					<table width="500" border="1">
						<tr>
							<td align="center"><b>��ȣ</b></td>
							<td><b>����</b></td>
							<td><b>������~������</b></td>
						</tr>
						<%
							  Vector<PollListBean> vlist = pMgr.getAllList();

							  int count = vlist.size();
							  for (int i = 0; i < vlist.size(); i++) {
								PollListBean plBean = vlist.get(i);
								int num = plBean.getNum();
								String question = plBean.getQuestion();
								String sdate = plBean.getSdate();
								String edate = plBean.getEdate();

								out.println("	<tr><td align='center'>" + count + "</td>");
								out.println("<td><a href='pollList.jsp?num=" + num + "'>"
										+ question + "</a></td>");
								out.println("<td>" + sdate +" ~ "+ edate + "</td></tr>");
								count = count - 1;
							}
						%>
					</table>
				</td>
			</tr>
			<tr>
				<td align="right"><a href="pollInsert.jsp">���� �ۼ��ϱ�</a></td>
			</tr>
		</table>
	</div>
</body>
</html>