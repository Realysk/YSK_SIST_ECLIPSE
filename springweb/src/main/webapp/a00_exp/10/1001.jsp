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
[하:개념]1. 답글처리의 핵심로직을 기술하세요.
	상세화면 답글 클릭 ==(요청값변경)==> 등록화면
	no ==> refno로 할당
	subject ==> "RE:"+subject
	content ==> "\n\n\n\n===<<이전글>>===\n"+content
	$("form").attr("action","${path}/board.do?method=insertFrm");
	
	
[하:개념]2. 단방향 directive의 종류를 화면출력과 속성을 나누어 기술하세요
	1) 화면출력형 요소객체 : h1~h6, option, span, td...
	2) 화면 출력 처리
		- mustache ex) <h2>{{모델명}}</h2>
		- v-text  ex) <h2 v-text="모델명"></h2>
		- v-html  ex) <p v-html="모델명"></p>
	3) 속성에 모델데이터 처리
		- v-bind:속성명="모델명" ex) <h2 v-bind:align="align01">
		- :속성명 = "모델명"	ex) <input :value="data01">
[하:응용]3. 양방향 directive를 활용하여 회원로그인의 id/pass입력시, 인증여부를 출력하세요.
            hint) vue는 js이다!! 3항연산자활용
        data:{msg:"시작!!(뷰와함께)",id:"",pass:""}
 	    
 	    <input class="form-control mr-sm-2" v-model="id" placeholder="아이디" />
	    <input class="form-control mr-sm-2"  type="password" v-model="pass" placeholder="패스워드" />
	    <button class="btn btn-info" type="button">{{id=='himan'&&pass=='7777'?'로그인성공':'로그인실패'}}</button>           
[중:응용]4. 조건문의 기본형식을 기술하고, 입력한 국어/영어/수학 점수의 평균에 대한 A~F등급의 부여하세요.
        	<td v-if="((parseInt(kor)+parseInt(eng)+parseInt(math))/3)>=90">A등급</td>
        	<td v-else-if="((parseInt(kor)+parseInt(eng)+parseInt(math))/3)>=80">B등급</td>
        	<td v-else-if="((parseInt(kor)+parseInt(eng)+parseInt(math))/3)>=70">C등급</td>
        	<td v-else-if="((parseInt(kor)+parseInt(eng)+parseInt(math))/3)>=60">D등급</td>
        	<td v-else>F등급</td>
[하:응용]5. 반복문에서 객체와 배열의 차이를 기술하고, 부서정보 리스트를 출력하세요.
	객체 : <요소객체 v-for="(value,prop) in 객체">
	배열 : <요소객체 v-for="(단위객체, index) in 배열">
	

# 오늘의 목표
1. 계층형 sql을 이해하고, 스프링의 페이징 처리 로직을 이해하고 구현할 수 있다.
2. vue에서 이벤트 처리를 활용할 수 있다.
3. vue를 활용한 DB가 연동된 ajax 처리를 할 수 있다.

# 궁금해하기 및 핵심키워드
1. vue에서 viewmodel에서 어떻게 이벤트 처리를 할 수 있을까?
    v-on:이벤트="기능메서드" @이벤트="기능메서드" methods:{메서드:function(){}}
2. vue에서 ajax를 처리하기 위해 필요로 하는 객체가 어떤 것이 있을까?
    fetch-api
    fetch(url).then(함수1).then(함수2).catch(함수3);   
3. 페이지 처리를 위해 필요하는 주요 속성은 어떤 것이 있고 어떻게 도출하고, 어떤 연관관계가 있는가?
    총데이터건수, 화면에보여줄데이터건수, 총페이지수, 현재페이지번호, 블럭수
    


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
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"시작!!(뷰와함께)",id:"",pass:"",
				  kor:0,eng:0,math:0,
				  dlist:[
					  {deptno:10,dname:"인사",loc:"서울"},
					  {deptno:20,dname:"회계",loc:"대구"},
					  {deptno:30,dname:"총무",loc:"광주"}
				  ]	  
			}
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
   <table class="table table-hover table-striped">
    <thead><tr class="table-success text-center"><th>부서번호</th><th>부서명</th><th>부서위치</th></tr></thead>	
    <tbody>
    	<tr class="text-center" v-for="(dept, idx) in dlist">
    		<td>{{dept.deptno}}</td><td>{{dept.dname}}</td><td>{{dept.loc}}</td></tr>
    </tbody>
	</table>    
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" v-model="id" placeholder="아이디" />
	    <input class="form-control mr-sm-2"  type="password" v-model="pass" placeholder="패스워드" />
	    <button class="btn btn-info" type="button">{{id=='himan'&&pass=='7777'?'로그인성공':'로그인실패'}}</button><br>
	    <input class="form-control mr-sm-2" v-model="kor" placeholder="국어" />
	    <input class="form-control mr-sm-2" v-model="eng" placeholder="영어" />
	    <input class="form-control mr-sm-2" v-model="math" placeholder="수학" />  
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="50%">
   	<col width="50%">
    <thead>
    
      <tr class="text-center">
        <th class="table-success">총점</th><td>{{parseInt(kor)+parseInt(eng)+parseInt(math)}}</td><tr>
      <tr class="text-center"><th class="table-success">평균</th><td>{{(parseInt(kor)+parseInt(eng)+parseInt(math))/3}}</td><tr>
      <tr class="text-center"><th class="table-success">등급</th>
        	<td v-if="((parseInt(kor)+parseInt(eng)+parseInt(math))/3)>=90">A등급</td>
        	<td v-else-if="((parseInt(kor)+parseInt(eng)+parseInt(math))/3)>=80">B등급</td>
        	<td v-else-if="((parseInt(kor)+parseInt(eng)+parseInt(math))/3)>=70">C등급</td>
        	<td v-else-if="((parseInt(kor)+parseInt(eng)+parseInt(math))/3)>=60">D등급</td>
        	<td v-else>F등급</td>
      </tr>
    </thead>	
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