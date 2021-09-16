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
			[하:개념 및 응용] 1. ModelAttribute와 ModelAndView 객체의 주요 기능을 요청값, 모델, 뷰로 설정하고, 두 객체를 다 활용하여 화면을 호출해보세요.
			
			
			
			[하:개념] 2. redirect와 forward의 차이점을 기술하고, 사용되는 기본형식을 기술하세요.
			
					forward : 다음 이동한 URL로 요청 정보를 그대로 전송하는 방식			
					redirect : 최초 요청을 받은 URL1에서 클라이언트에 redirect할 URL2를 리턴 후 클라이언트에 새로운 요청을 생성하여 URL2에 다시 요청을 보내는 방식
					
					@RequestMapping("callReqAndModelAndView.do")
					public ModelAndView call(@ModelAttribute("emp") Emp emp) {
						emp.setEname(emp.getEname() + " / 모델 값 추가");
						ModelAndView mav = new ModelAndView();
						mav.setViewName("WEB-INF\\views\\a01_basic\\a15_callReqAndModelAndView.jsp");
						mav.addObject("prod", new Product("사과", 3000, 2));
						return mav;
					}
			
			[중:응용] 3. 회원리스트 화면에서 회원정보를 등록 후, 등록된 정보를 상세화면으로 이동하면서 회원 아이디를 넘기는 경우(forward)와 회원정보를 삭제 후, 회원 정보 리스트 화면 이동하는 경우(redirect)를 나누어 처리하세요.
						memberList.do(회원리스트 - 메인화면), memberRegister.do(회원정보 등록), memberDetail.do(회원정보 상세), memberDelete.do(회원정보 삭제)
						
						// http://localhost:7080/springweb/memberList.do	
						@RequestMapping("memberList.do")
						public String memberList(@RequestParam(value="id", defaultValue="") String id) {
							System.out.println("요청값 : " + id);
							System.out.println("회원 리스트 화면 호출");
							return "WEB-INF\\views\\a01_basic\\a16_memberlist.jsp";
						}
						
						@RequestMapping("memberDetail.do")
						public String memberDetail(@RequestParam(value="id", defaultValue="") String id) {
							System.out.println("요청값 : " + id);
							System.out.println("회원 상세 화면 호출");
							return "WEB-INF\\views\\a01_basic\\a17_memberDetail.jsp";
						}
						
						@RequestMapping("memberRegister.do")
						public String memberRegister() {
							System.out.println("등록 처리 (forward)");
							return "forward:/memberDetail.do";
						}
						
						@RequestMapping("memberDelete.do")
						public String memberDelete() {
							System.out.println("삭제 처리 (redirect)");
							return "redirect:/memberList.do";
						}
			
			[하:개념] 4. 스프링의 데이터베이스 설정 절차(mybatis) 중, 컨테이너에서 설정 내용을 간략하게 기술하세요.
			
				# 스프링의 데이터베이스 설정 처리
					1) 컨테이너에 처리할 내용
						(1) DB 연결 connection 선언
						(2) mybatis와 DB Connection 연동, mybatis 공통 파일 위치 선언
						(3) 현재 컨테이너 안에서 interface DAO의 위치 지정 (mybatis에서 실제 객체를 만들어준다.)
					2) 공통 mybatis 설정파일 처리
					3) 각 DAO단 별 연동하는 XXXMapper.xml에 대한 처리
					4) DAO단 interface 선언								
			
			[하:개념] 5. mybatis.Spring.xml의 설정 내용을 기술하세요.
			
				1) 공통 VO/DTO의 별칭을 선언 => XXXMapper.xml에서 간단하게 사용하기 위해
				2) XXXMapper.xml을 선언					
			
			[하:개념] 6. DAO와 XXXMapper.xml의 설정내용의 연관관계를 기술하세요.
			
				1) DAO의 인터페이스명 => namespace명
				2) 메서드명 => <select id="메서드명"
				3) 메서드의 리턴 객체 => <select resultType="VO객체"
				4) 메서드의 매개변수 => <select parameterType="매개변수"
			
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