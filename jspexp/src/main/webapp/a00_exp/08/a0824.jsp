<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	td{text-align:center;}
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# 
# 정리문제
1. 서버단위로 session 만료기간을 설정할려고 한다. 처리할 내용을 기술하세요.
	web.xml에서 분단위 세션 만료 시간 설정..
	<session-config>
		<session-timeout>30</session-timeout>
	</session-config>
	각 페이지에 session 값 확인..	
2. 자바빈의 기본형식은 bean선언, 프로퍼티 선언, el호출까지 기술하세요.
	<jsp:useBean id="빈이름" class="패키지명.클래스명" scope="세션범위(page/request/session/application)"/>
	<jsp:setProperty name="빈이름" property="프로퍼티명" value="할당값" param="요청값과 연동할 때"/>
	<jsp:getProperty name="빈이름" property="프로퍼터명"/>
	${빈이름.프로퍼티명} : 해당 클래스의 저장되어 있는 프로퍼티를 출력해준다.
3. 자바빈의 프로퍼티란 무엇인가?
	class 클래스명{
		public void set프로퍼터명(저장매개변수){}
		public 데이터유형 get프로퍼터명(){ return 리턴데이터;}
		public boolean is프로퍼터명(){ return 리턴데이터;}
	}
	bean이나, el태그를 이용해서 저장된 데이터를 가져오거나 저장할 때, 사용한다.
	<jsp:setProperty name="빈이름" property="프로퍼티명"
	<jsp:getProperty name="빈이름" property="프로퍼티명"
	${빈이름.프로퍼티명}
 
4. jspexp.z02_vo.Student를 bean으로 설정하고, 요청값으로
    ?no=1&name=홍길동&kpt=70&ept=80&mpt=90을 받아서 처리할려고 한다.
    요청값을 받은 내용을 bean을 활용하여 출력하세요.
5. 아래와 같은 부서정보 등록(DAO처리)을 bean을 활용하여 처리하세요.
    부서번호:[   ]
    부서명:[   ]
    부서위치:[   ]
        [등록]
    == 부서정보리스트 ==
# 9:30에 1차점검하겠습니다. 제출하시고 손들어 주세요..
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
<body>
<%--
	private int sno;
	private String name;
	private int kor;
	private int eng;
	private int math;
	?no=1&name=홍길동&kpt=70&ept=80&mpt=90
 --%>
<jsp:useBean id="stu" class="jspexp.z02_vo.Student" scope="page"/>
<jsp:setProperty property="sno" name="stu" param="no"/>
<jsp:setProperty property="name" name="stu" />
<jsp:setProperty property="kor" name="stu" param="kpt"/>
<jsp:setProperty property="eng" name="stu" param="ept"/>
<jsp:setProperty property="math" name="stu" param="mpt"/>
	<h2 align="center"></h2>
	<h3 align="center">학생정보</h3>
	<table  align="center" class="listTable">
		<tr><th>번호</th><td>${stu.sno}</td></tr>
		<tr><th>이름</th><td>${stu.name}</td></tr>
		<tr><th>국어</th><td>${stu.kor}</td></tr>
		<tr><th>영어</th><td>${stu.eng}</td></tr>
		<tr><th>수학</th><td>${stu.math}</td></tr>
	</table>	
	
	<form id="frm01" method="post">
	<table align="center" class="listTable">
		<tr><th>부서번호</th><td><input type="text" name="deptno" value=""/></td></tr>
		<tr><th>부서명</th><td><input type="text" name="dname" value=""/></td></tr>
		<tr><th>부서위치</th><td><input type="text" name="loc" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="등록"/></td></tr>
	</table>	
	</form>
	<jsp:useBean id="dept" class="jspexp.z02_vo.Dept"/>
	<jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao"/>
	<jsp:setProperty property="*" name="dept"/><%-- property와 요청key가 같을 때, 자동으로 할당된다. --%>
	<%
	if(dept.getDname()!=null){ // 요청값이 있을 때..(입력후, 등록 버튼을 클릭시)
		dao.insertDept(dept);
	}
	%>
	<table  align="center" class="listTable">
		<tr><th>부서번호</th><th>부서명</th><th>부서위치</th></tr>
		<%for(Dept d:dao.getDeptList(new Dept(0,"",""))){ %>
		<tr><td><%=d.getDeptno()%></td>
			<td><%=d.getDname()%></td>
			<td><%=d.getLoc()%></td></tr>
		<%} %>
	</table>		
	
</body>
</html>