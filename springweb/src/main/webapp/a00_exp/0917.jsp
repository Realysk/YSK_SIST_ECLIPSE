<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK </title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		# 정리문제
			1. [하:개념] Spring/mybatis 환경에서 데이터를 처리하려고 한다. 기본 처리 작업을 순서별로 기술하세요.
			
				1) dispatcher-servlet.xml
			
				<!-- 
				# DB 연결 처리
					1. Connection Pool 처리
						1) 드라이버, 주소, 계정, 비밀번호
				 -->
				 <bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">
				 	<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>
				 	<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
				 	<property name="username" value="scott"/>
				 	<property name="password" value="tiger"/>
				 </bean>
				<!--
					2. Mybatis 와 연동
						1) dbcp 연결
						2) java/resource/mybatis.Spring.xml 로 공통 연결 처리
				 -->
				 <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
				 	<property name="dataSource" ref="dataSource"/>
			 	 <property name="configLocation" value="classpath:resource/mybatis.Spring.xml"/>
				 </bean>
				 <!--
				 	3. DAO 인터페이스 패키지 위치를 설정
				 		인터페이스 => 인터페이스의 상속 받은 실제객체 생성 (mybatis 프레임워크 XXXMapper.xml)
				 		name="basePackage" value="dao경로, dao경로2, ..."
				  -->
				  <bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
				  	<property name="basePackage" value="springweb.a05_mvc.a03_dao"/>
				  </bean>
				  
				  2) mybatis.Spring.xml
					<!-- 
					1. 각 DAO 인터페이스와 연결되는 XXXMapper.xml
					2. Mapper에서 사용할 VO, DTO를 간단하게 별칭으로 사용할 수 있게 선언.
					 -->
					<!-- VO alias -->
					<typeAliases>
						<typeAlias alias="emp" type="springweb.z01_vo.Emp"/>
						<typeAlias alias="dept" type="springweb.z01_vo.Dept"/>
						<typeAlias alias="member" type="springweb.z01_vo.Member"/>
					</typeAliases>
					<!-- XXXMapper.xml -->
					<mappers>
						<mapper resource="resource/empMapper.xml"/>
						<mapper resource="resource/deptMapper.xml"/>
						<mapper resource="resource/memberMapper.xml"/>
					</mappers>		  
				
			2. [하:응용] A04_MemberDao를 통해 member테이블의 등록/수정/삭제 처리하는 DAO와 resource\memberMapper.xml를 통해서 처리하세요.
			
				
			
			3. [중:응용] member리스트를 DB와 연동되어 스프링 MVC 패턴으로 name/auth를 통해 조회가 되게 하세요.
			
			
			
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>