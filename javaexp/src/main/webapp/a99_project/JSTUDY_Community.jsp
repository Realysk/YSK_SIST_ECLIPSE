<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="SungKeun.JSTUDY.JSC_COMMUNITY.JSCDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 테스트 </title>
<%
	// java + html ==> 최종적으로 html 파일을 만들어 client(브라우저) Stream을 이용하여 전달한다.
	// JSCDTO jcof1 = new JSCDTO(jcof1.getWriteNum(), jcof1.getHeadLine(), jcof1.getWriter(), jcof1.getWriteDate(), jcof1.getWrite()); // 해당 클래스에서 입력한 변수를 저장
	JSCDTO jcof1 = new JSCDTO(1, "안녕하세요.", "홍길동", "2021-06-28 18:28:05", "반가워요!");
%>
</head>
<body>
	<!-- 자유 게시판 -->
	<h3>게시물 번호 : <%=jcof1.getWriteNum()%></h3>
	<h3>게시물 제목 : <%=jcof1.getHeadLine()%></h3>
	<h3>게시물 작성자 : <%=jcof1.getWriter()%></h3>
	<h3>게시물 작성일 : <%=jcof1.getWriteDate()%></h3>
	<h3>게시물 내용 : <%=jcof1.getWrite()%></h3>
</body>
<script type="text/javascript">
/*
JS 함수 적용
*/

</script>
</html>