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
# 정리문제
	1. [하:개념] 답글처리의 핵심 로직을 기술하세요.
	
		$("#reBtn").click(function(){
			if(confirm("답글을 달겠습니다!")){
				$("[name=refno]").val($("[name=no]").val());
				$("[name=subject]").val("RE:"+$("[name=subject]").val());
				$("[name=content]").val(
						"\n\n\n\n\n========<<이전 글>>=========\n"+
						$("[name=content]").val());
				$("form").attr("action",
						"${path}/board.do?method=insertForm");
				$("form").submit();
			}
		});			
	
	2. [하:개념] 단방향 directive의 종류를 화면출력과 속성을 나누어 기술하세요.
	
		- 단방향 directive
			1) {{모델명}} : mustache
			2) <태그 v-text="모델명"></태그>
			3) <태그 v-html="모델명"></태그>
				모델명으로 가진 데이터를 tag로 랜더링하여 화면에 출력 처리..
			4) <태그 v-bind:속성명="모델명/>
			   <태그 :속성명="모델명/>
			   해당하는 태그의 속성을 모델 데이터를 처리한다.
	
	3. [하:응용] 양방향 directive를 활용하여 회원로그인의 ID/PASS 입력 시, 인증여부를 출력하세요.
		hint) vue는 js이다!! 3항연산자 활용
	
		
	
	4. [중:응용] 조건문의 기본형식을 기술하고, 입력한 국어/영어/수학 점수의 평균에 대한 A~F등글을 부여하세요.
	
		- v-show="boolean값"
			일단 화면에 로딩 후, 특정 조건에 맞을 때 CSS로 보이게 하고 그렇지 않을 때 보이지 않게 처리할 때 사용된다.
			1) 기본 형식
				<태그 v-show="모델속성>=조건데이터">
		- v-if
			요소객체 안에 속성으로 v-if를 활용하면 해당 요소 객체가 v-if의 속성값으로 true값일 때만 보이게 초기에 랜더링 처리할 수 있다.
			1) 기본 형식
				v-if="모델데이터조건1"
				v-else-if="모델데이터조건2"
				v-else=위에서 선언한 조건 이외일 때		
	
	5. [하:응용] 반복문에서 객체와 배열의 차이를 기술하고 부서정보 리스트를 출력하세요.
	
		요소 객체 v-for="(단위객체, index) in 객체형배열모델">
				{{단위객체.속성}}
		객체형 v-for="(val,prop) in 객체">		

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
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"시작!!(뷰와함께)"}
		});		
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
    <h2 align='center'>{{msg}}</h2>
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