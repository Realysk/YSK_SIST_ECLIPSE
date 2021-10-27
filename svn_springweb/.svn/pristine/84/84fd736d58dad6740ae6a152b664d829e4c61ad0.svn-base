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
# 일일정리문제
[하:개념]1. 스프링의 컨테이너의 공통 설정 파일 처리 방식을 기술하고, 컨테이너 안에서 외부 클래스에서 사용 방법을 기술하세요.
	공통 설정 파일 처리 방식 : 특정한 정보를 가지고 해당 내용을 파일로 저장되어,
		개발환경이 변하거나 외부 서버가 변경될 때도 효과적으로 설정을 변경처리할 수 있는 것을 말한다.
	src\resource\properties\info에 key=value형식으로 저장하여
	컨테이너 안에서 ${키}로 호출하고, 일반 클래스에서는 @Value("key") private String 변수명;
	형태로 사용할 수 있다.

[하:응용]2. 컨테이너에 객체(Product)에 퍼로퍼티로 할당하고, 해당 객체를 호출(autowiring)하는 내용을 A09_SettingCtrl.java
        를 통해서 처리하세요.
	pname=apple
	price=3000
	cnt=2        
        
	<bean class="springweb.z01_vo.Product" 
		 c:name="${pname}" c:price="${price}" c:cnt="${cnt}"/>	
		         
	@Autowired
	private Product prod;
	@RequestMapping("setting03.do")
	public String setting03(Model d) {
		d.addAttribute("prod", prod);
        
[하:개념]3. Mybatis를 활용하여 데이터베이스를 연동할려고 한다. 기본 설정을 컨테이너, mybatis config파일,
            dao, XXXmapper.xml를 통해서 처리할 내용을 기술하세요.
	1. 컨테이너 설정(dispatcher-servlet.cml)
		1) dbcp 선언 : class="org.apache.commons.dbcp.BasicDataSource"
		2) mybatis config 파일 설정 
			class="org.apache.commons.dbcp.BasicDataSource"
 				<property name="dataSource" ref="dataSource"/>
 				<property name="configLocation" 
 					value="classpath:resource/mybatis.Spring.xml"></property>			
		3) dao 인터페이스 패키지위치 설정  
			class="org.mybatis.spring.mapper.MapperScannerConfigurer">
	 			<property name="basePackage" value="springweb.a05_mvc.a03_dao"/>	          
            
[중:응용]4. dept01로 테이블을 복사테이블로 만들고,  json 뷰를 활용하여 ajax로 조회 리스트 처리를 하세요.
	# 처리 순서
	1. sql 작성 : 
		select * from dept01 
		where ename like '%'||${ename}||'%'
		and loc like '%'||${loc}||'%'
	2. vo 작성 : class Dept{}
	3. dao / mapper 선언 및 연동 처리
		public ArrayList<Dept> dlist(Dept sch);
	4. serivce, 
	5. controller
		1) 초기화면 호출
		2) ajax 처리 pageJsonReport호출
	6. view 화면 처리
		1) 화면 구현
		2) ajax 처리 호출.			
		
# 오늘의 목표
1. 스프링에서 지원하는 form 태그를 활용할 수 있다.
2. 스프링을 활용하여 게시판을 만드는 기본 프로세스를 정리할 수 있다.
3. 답변형 게시판에서 사용되는 핵심 기술을 기본적인 코드를 정리할 수 있다.
# 핵심키워드
1. form:form commandName="search"
2. form:select path="type" var="type"
3. CommonsMultipartResolver		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">정리문제</h2>
  <h3>물건명:${prod.name}</h3>
  <h3>가격:${prod.price}</h3>
  <h3>갯수:${proc.cnt}</h3>

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