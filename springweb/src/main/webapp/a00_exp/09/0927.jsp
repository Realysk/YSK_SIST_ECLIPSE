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
				1. [하:개념] 스프링의 컨테이너의 공통 설정 파일 처리 방식을 기술하고, 컨테이너 안에서 외부 클래스에서 사용 방법을 기술하세요.
				
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
				
				2. [하:응용] 컨테이너의 객체(Product)에 Property로 할당하고 해당 객체를 호출(Autowiring)하는 내용을 A09_SettingCtrl.java를 통해서 처리하세요.
				
					<info>
					pname=apple
					price=3000
					cnt=2
					
					<A09_SettingCtrl.java>
					// http://localhost:7080/springweb/setting03.do
					
					@Autowired
					private Product prod;
					@RequestMapping("setting03.do")
					public String setting03(Model d) {
						d.addAttribute("prod", prod);
						return "a00_exp\\0927.jsp";
					}
					
						
				
				3. [하:개념] Mybatis를 활용하여 데이터베이스를 연동하려고 한다. 기본 설정을 컨테이너, mybatis config파일, dao, XXXMapper.xml을 통해서 처리할 내용을 기술하세요.
				
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
				
				4. [중:응용] dept01(06)로 테이블을 복사테이블로 만들고 json 뷰를 활용하여 ajax로 조회 리스트를 처리 하세요.
				
					# 처리 순서
						1) SQL 작성 : SELECT * FROM dept01
									 WHERE ename LIKE '%'||${ename}||'%'
									 AND loc LIKE '%'||${loc}||'%'
						2) VO 작성 : class Dept{}
						3) DAO / Mapper 선언 및 연동 처리
							public ArrayList<Dept> dlist(Dept sch);
						4) Service
						5) Controller
							(1) 초기화면 호출
							(2) Ajax 처리 pageJsonReport 호출
						6) View 화면 처리
							(1) 화면 구현
							(2) Ajax 처리 호출
				
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">정리문제</h2>
  <h3>물건명 : ${prod.name}</h3>
  <h3>가격 : ${prod.price}</h3>
  <h3>수량 : ${prod.cnt}</h3>

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