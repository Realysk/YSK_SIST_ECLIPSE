<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="javaexp.z01_vo.Food" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> index </title>
<style type="text/css">
	h3{background-color:blue; color:yellow;}
</style>
</head>
<%
	// java + html ==> ���������� html ������ ����� client(������) Stream�� �̿��Ͽ� �����Ѵ�.
	Food f = new Food("���",2000,"û��������");
%>

<%--
ȭ���(front end)
html/css
javascript ==> jquery

===> ajax(�񵿱� ���α׷���) : front end�� back end����

����ó�����α׷�(back end)
java
�����ͺ��̽�
jsp
springframework

 --%>
<body>
	<h2>�� ���α׷� ����!! (180.66.208.113)</h2>
	<h3>http://180.66.208.113</h3>
	<h3>���Ǹ� : <%=f.getName()%></h3>
	<h3>���� : <%=f.getPrice()%></h3>
	<h3>�Ĵ� �� : <%=f.getLoc()%></h3>
</body>
<script type="text/javascript">
	var h2 = document.querySelector("h2");
	h2.onclick=function() {
		alert("Ŭ���߽��ϴ�!!");
		this.style.color="orange";
	}
</script>
</html>