<%@ page contentType="text/html; charset=EUC-KR" %>
<jsp:useBean id="test" class="ch09.SimpleBean"/>
<jsp:setProperty name="test" property="message" value="���� ���� ��������!" />
<html>
<body>
<h1>������ �� ���α׷���</h1>
<br/>
Message: <jsp:getProperty name="test" property="message" />
</body>
</html>