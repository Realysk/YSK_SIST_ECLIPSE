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

# 일일정리문제
[하:개념]1. spring/mybatis 환경에서 데이터를 처리할려고 한다. 
			기본 처리 작업을 순서별로 기술하세요.
	컨테이너에 등록 처리.
		1) DB연동
		2) mybatis 프레임워크
		- db연결
		- mybatis공통 파일 설정.
		3) interface를 통해 만들어지는 실제 객체가 만들어 지는 패키지 선언.
	공통mybatis설정파일
		mybatis.Spring.xml
		- vo의 alias명 설정.
		- XXXmapper.xml를 등록
	Dao와 mapper.xml의 연동
		dao인터페이스명  ===>  namespace
		메서드명        ===>  id
		리턴타입        ===>  resultType 
		매개변수        ===>  parameterType 
			
			
[하:응용]2. A04_MemberDao를 통해 member테이블의 등록/수정/삭제 처리하는 
		dao와 resource\memberMapper.xml를 통해서 처리하세요.
		등록 : insert into member values(#{id},#{pass},#{name},#{auth},#{point})
		public void insertMember(Member ins);
		수정 : update member
				set pass =#{pass},
				    name = #{name},
				    auth = #{auth},
				    point= #{point}
			   where id = #{id}
		public void updateMember(Member upt);
		삭제 : delete from member where id = #{id}
		public void deleteMember(String id);	   	     
		
		
[중:응용]3. member리스트를 DB와 연동되어 스프링 MVC 패턴으로 name/auth를 통해 조회가 되게 하세요.
	public ArrayList<Member> memberList(Member sch);
	@Autowired
	private A04_MemberService service;
	// http://localhost:7080/springweb/memberList.do
	@RequestMapping("memberList.do")
	public String mvc01(Member sch, Model d) {
		d.addAttribute("memList", service.memberList(sch));
		return "WEB-INF\\views\\a05_mvc\\a04_memberList.jsp";
	}	
# 오늘의 목표
1. Mybatis를 연동하여 화면에서 리스트/등록/수정/삭제를 할 수 있다.
2. 스프링에서 사용하는 view을 처리하는 Viewresolver를 알고, 여러가지 형태의 view 처리를 할 수 있다.
3. 스프링에서 json데이터를 활용하여 ajax처리를 할 수 있다.
# 핵심키워드
1. BasicDataSource, driverClassName, ur, username, password
2. MapperScannerConfigurer
3. typeAlias alias="emp" type=""
4. resultMap type="emp"
9:30 발표시작하겠습니다. 조별로 발표자 올려주세요!
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
		
		--%>	
	});
</script>
</head>

<body>
<%-- 
		
--%>	
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