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
			# 정리 문제
				1. [하:개념] 게시판 board 테이블의 기본적인 등록처리 순서를 기술하세요.
					
					1) 데이터베이스 처리
						등록 SQL 작성 - INSERT INTO 테이블 VALUES(데이터1, 데이터2...)
						VO 작성 (전달 데이터) - 결과값, CRUD, 조회조건
						DAO/Mapper 작성 (SQL <--> 객체/변수)
							DAO명/namespace, 메서드명/ID, 매개변수유형/resultType, 매개변수유형/parameterType
						
					2) 화면 구현을 위한 서버단 처리
						Service : DAO 호출
						Controller : 요청값, 모델데이터
							Service 호출, 서비스에서 데이터 모델로 처리
							View 호출
						ex) 리스트 화면에서 입력화면 호출 Controller 기능 메서드
							리스트 화면에서 이벤트를 통해서 입력 화면 호출
							입력화면에서 데이터를 등록할 요청 처리
							
					3) 화면 구현
						JS : 유효성 Check/기타 서버에 전달되기 전에 처리할 내용 구현
						form name/value 요청값 전달 action="컨트롤러 호출"
						jstl/el로 출력처리
							${모델데이터} <c:forEach var="" items="${모델명}">
				
				2. [하:개념] 스프링의 요청값/모델데이터/화면처리의 주요 코드를 기술하세요.
				
					1) URL 호출
						Controller 상단
						@RequestMapping("board.do")
						@RequestMapping(params="method=list")
						http://localhost:7080/board/board.do?method=list
					2) 요청값/모델데이터 선언
						public String boardList(Board board, Model d)
						public String getBoard(@RequestParam("no") int no, Model d)
					3) 모델데이터 할당
						d.addAttribute("list", service.boardList(board));
						d.addAttribute("board", service.getBoard(no));
					4) 화면 처리
						<c:forEach var="board" items="${list}">
						${board.no}
						${board.subject}
						${board.writer}
				
				3. [하:에러찾기] URL 주소가 정확한 경우에도 Controller의 URL을 찾지 못하는 경우(404)가 있다. 어떤 경우인지 기술하세요.
				
					1) console 화면을 일단 확인
						서버가 켜져있는지?
						main\java\log4j.properties에서 제공하는 내용 확인
						아래의 4개 정보를 표기해준다.
					
					2) URL 호출시 확인되는 내용
						- Controller가 컴파일이 안되어 변경된 URL이 반영이 안된 경우
							tomcat version / 상단 메뉴 > Project > build automatically unchecked (uncheck의 경우 필수로 check)
							=> 위 내용을 처리하고
							tomcat 서버 오른쪽 마우스 클릭 clean 처리나 tomcat을 새로 설치
						
						- URL 주소
							URL 주소를 확인
						
						- 요청값
							<input name="no" value=""/> => ?no=&...
							form(@RequestParam("no") int no => 100% 404에러 발생
							form(Board d) {}
								class Board {
									private int no;
									// int no = ""; // 에러 발생 => 100% 404에러 밸생
									public void setNo(int no) {}
								}
							=> <input name="no" value="0"/>로 해주든지 아래 form객체 하위에서 삭제를 해주면 된다.
						
						- View단에 호출
							return ".jsp" : 해당 jsp 파일명이 잘못 되어 있을 때
							
				4. [하:응용] vue의 MVVM 패턴으로 이름/나이/거주지를 출력하세요.

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
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 

		--%>
		// 화면에 onloade된 후, 처리가능하기에 ready()에서 쓰거나 하단에서 선언해야 한다.
		var model = {name:"홍길동", age:25, loc:"서울"};
		// viewmodel
		var vm = new Vue ({
			el:".jumbotron", // Vue 코드가 있는 요소객체를 선택
			data:model // View단에서 사용할 모델데이터 선언
		});
	});
</script>
</head>

<body>
<!-- View -->
<div class="jumbotron text-center">
  <h2>연습예제</h2>
  <h3>이름 : {{name}}</h3>
  <h3>나이 : {{age}}</h3>
  <h3>거주지 : {{loc}}</h3>

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
<script type="text/javascript">

</script>
</body>
</html>