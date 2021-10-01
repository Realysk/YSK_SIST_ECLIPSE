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
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
			# 정리 문제
				1. [하:개념] 스프링에서 Dao/Mapper 처리 연동 부분 매커니즘을 기술하세요.
				
					<dispatcher-servlet.xml>

					- Mybatis와 연동
						1) dbcp연결
						2) java/resource/mybatis.Spring.xml
	
					<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
						<property name="dataSource" ref="dataSource"/>
						<property name="configLocation" value="classpath:resource/mybatis.Spring.xml" />
					</bean> 
					- dao 인터페이스 페이지 위치를 설정..
						인터페이스 ==> 인터페이스의 상속받은
							 실제객체생성(mybatis 프레임웍 XXXmapper.xml)
						name="basePackage" value="dao경로1, dao경로2,..."
					
					<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
						<property name="basePackage" value="springweb.a05_mvc.a03_dao"/>
					</bean>
					
					
					<mybatis.Spring.xml>
					
						각 DAO 인터페이스와 연결되는 XXXMapper.xml
						Mapper에서 사용할 VO, DTO를 간단하게 별칭으로 사용할 수 있게 선언.
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
				
				2. [하:개념] 스프링 화면처리 MVC 패턴 구조에 대하여 기술하세요.
				
					1) SQL 작성
					2) mybatis.Spring에 Mapper 설정
					3) Dao / Mapper 작성
					4) Service 작성
					5) Controller 작성
					6) View 화면 구현
				
				3. [하:응용] 전날 게시판 기본 조회 화면을 구현하세요.
				
					
				
				4. [하:개념] 답변형 게시판의 주요 기능을 기술하세요.
				
					- 주요 기능
						1) 게시판 글 등록, 리스트, 상세화면, 수정, 삭제, *답글화면/답글달기 처리
						2) 등록 데이터
							글 번호, 작성자, 상위글번호, 등록일, 수정일, 조회수, 제목, 내용, 첨부파일
						3) 답글 등록 처리
							무한레벨 계층적으로 답글 등록 가능
						4) 리스트에 페이지 처리
							선택한 페이지당 글의 수에 따른 페이징 처리
							하단에 페이지 번호 리스트
						5) 첨부파일 추가 기능				
				
				5. [중:응용] 게시판 board 테이블의 기본적인 CRUD를 처리하세요.
				
					
				
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">정리문제</h2>

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