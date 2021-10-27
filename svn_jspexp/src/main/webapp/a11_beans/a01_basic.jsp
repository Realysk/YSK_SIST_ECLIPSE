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
	
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# 자바빈
1. 웹프로그래밍에서 데이터의 표현을 목적으로 사용한다.
2. 일반적인 빈구성
	값을 저장하기 위한 필드
	값을 수정하기 위한 setter
	값을 읽기 위한 getter
3. 자바빈 프로퍼티 **
	1) 프로퍼티는 자바빈에 저장되어 있는 값을 표현한다.
	2) 메서드 이름을 사용해서 프로퍼티의 이름을 결정한다.
	3) 규칙 : 프로퍼티 이름이 propName일 경우..
		- setter : public void setPropName(Type value)
		- getter : public Type getPropName()
		- boolean : isPropName()
		- 배열 지정 가능 : public void setName(String[])
		ex) 프로퍼티명이 age인 경우
			setter : public void setAge(int age){}
			getter : public int getAge();
			boolean : public boolean isAge();..
			
		ex1) public void setLoc(String loc){} ==> property이름 : loc
4. 활용
	1) useBean : <jsp:setProperty name="p01" property="loc" value="서울"/>
	2) el/jstl  ${p01.name} ==> p01.getName() 호출..
5. <jsp:useBean> 태그
	1) jsp에서 자바빈 객체를 생성할 때, 사용
		<jsp:useBean id="빈이름" class="패키지명.자바클래스" scope="session범위"/>
			
	ex)	<jsp:useBean id="p01" class="jspexp.z02_vo.Person" scope="request"/>
	==> request.setAttribute("p01",new Person());
	
		<jsp:setProperty name="p01" property="name" value="홍길동"/>
	==> Person p01 = new Person();
		p01.setName("홍길동");
		request.setAttribute("p01",p01);
		
		<jsp:getProperty name="p01" property="name"/>
	==>	Person p01 = (Person)request.getAttribute("p01");
		<%=p01.getName()%>
		${p01.name}

--%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("useBean 활용");
	});
</script>
<body>
<%
Person p=new Person(); 
p.setName("마길동");
p.setAge(27);
p.setLoc("서울방배동");
session.setAttribute("p01",p);
Person p01 = (Person)session.getAttribute("p01");%>	
	<h3 align="center">자바코드로 처리</h3>
	<table  align="center" class="listTable">
		<tr><th>p01.getName()</th><td><%=p01.getName()%></td></tr>
		<tr><th>p01.getAge()</th><td><%=p01.getAge()%></td></tr>
		<tr><th>p01.getLoc()</th><td><%=p01.getLoc()%></td></tr>
	</table>
	<h3 align="center">useBean으로 처리</h3>
<jsp:useBean id="p02" class="jspexp.z02_vo.Person" scope="session"/>
<jsp:setProperty name="p02" property="name" value="홍길동"/>
<jsp:setProperty name="p02" property="age" value="25"/>
<jsp:setProperty name="p02" property="loc" value="서울신림동"/>
	<table  align="center" class="listTable">
		<tr><th>property호출</th><td><jsp:getProperty property="name" name="p02"/></td></tr>
		<tr><th>property호출</th><td><jsp:getProperty property="age" name="p02"/></td></tr>
		<tr><th>property호출</th><td><jsp:getProperty property="loc" name="p02"/></td></tr>
	</table>	
	<h3 align="center">el로 호출</h3>
	<table  align="center" class="listTable">
		<tr><th>el호출</th><td>${p01.name},${p02.name}</td></tr>
		<tr><th>el호출</th><td>${p01.age},${p02.age}</td></tr>
		<tr><th>el호출</th><td>${p01.loc},${p02.loc }</td></tr>  
<%--ex) Student 클래스 bean 설정(application) 데이터 할당 및 호출, 
	el로 호출까지 - 1조(제출), 전체(옆으로손들기)--%>
	</table>	
<jsp:useBean id="stu" class="jspexp.z02_vo.Student" scope="application"/>
<jsp:setProperty name="stu" property="sno" value="1001"/>
<jsp:setProperty name="stu" property="name" value="홍길동"/>
<jsp:setProperty name="stu" property="kor" value="92"/>
<jsp:setProperty name="stu" property="eng" value="100"/>
<jsp:setProperty name="stu" property="math" value="90"/>
   <table  align="center" class="listTable">
      <tr><th>sno</th><td><jsp:getProperty property="sno" name="stu"/></td></tr>
      <tr><th>name</th><td><jsp:getProperty property="name" name="stu"/></td></tr>
      <tr><th>kor</th><td><jsp:getProperty property="kor" name="stu"/></td></tr>
      <tr><th>eng</th><td><jsp:getProperty property="eng" name="stu"/></td></tr>
      <tr><th>math</th><td><jsp:getProperty property="math" name="stu"/></td></tr>
   </table>
	${stu.setName("신길동")} <%-- 화면에 보이지 않고, 저장이 가능하다. --%>
   <table  align="center" class="listTable">
      <tr><th>el 호출</th><td>${stu.sno}</td></tr>
      <tr><th>el 호출</th><td>${stu.name}</td></tr>
      <tr><th>el 호출</th><td>${stu.kor}</td></tr>
      <tr><th>el 호출</th><td>${stu.eng}</td></tr>
      <tr><th>el 호출</th><td>${stu.math}</td></tr>
   </table>	
	
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>	
</body>
</html>