<%@ page contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL�� header ���尴ü</h2>
  ȣ��Ʈ�� : <b>${header.host}</b><p/>
 �������� : <b> ${header["user-agent"]}</b><p/>
 ����� : <b> ${header["accept-language"]}</b><p/>
</body>
</html>