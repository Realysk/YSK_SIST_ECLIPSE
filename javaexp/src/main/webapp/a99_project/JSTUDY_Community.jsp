<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="SungKeun.JSTUDY.JSC_COMMUNITY.JSCDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> �׽�Ʈ </title>
<%
	// java + html ==> ���������� html ������ ����� client(������) Stream�� �̿��Ͽ� �����Ѵ�.
	// JSCDTO jcof1 = new JSCDTO(jcof1.getWriteNum(), jcof1.getHeadLine(), jcof1.getWriter(), jcof1.getWriteDate(), jcof1.getWrite()); // �ش� Ŭ�������� �Է��� ������ ����
	JSCDTO jcof1 = new JSCDTO(1, "�ȳ��ϼ���.", "ȫ�浿", "2021-06-28 18:28:05", "�ݰ�����!");
%>
</head>
<body>
	<!-- ���� �Խ��� -->
	<h3>�Խù� ��ȣ : <%=jcof1.getWriteNum()%></h3>
	<h3>�Խù� ���� : <%=jcof1.getHeadLine()%></h3>
	<h3>�Խù� �ۼ��� : <%=jcof1.getWriter()%></h3>
	<h3>�Խù� �ۼ��� : <%=jcof1.getWriteDate()%></h3>
	<h3>�Խù� ���� : <%=jcof1.getWrite()%></h3>
</body>
<script type="text/javascript">
/*
JS �Լ� ����
*/

</script>
</html>