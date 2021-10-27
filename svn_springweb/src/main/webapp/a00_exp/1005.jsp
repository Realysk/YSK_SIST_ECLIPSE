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
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

		<%--
		# 일일정리문제
		[하:개념]1. 이벤트 처리를 위한 vue 기본 코드 형식을 기술하세요.
			var vm = new Vue({
				methods:{
					이벤트핸들러함수:function(){
						this. : 모델데이터나, 함수를 호출할 수 있다.
					}
				}
			});
			<요소객체 v-on:이벤트명="이벤트핸들러함수">
			ex) <button v-on:click="call">
				methods:{
					call:function(){
						
					}
				}
		[하:응용]2. 양방향 directive와 이벤트를  활용하여, 금액 [   ] (입금)(출금) 잔액: @@@@ 을 처리하세요.
			form 하위 요소객체에 v-model="모델명" 으로 연결하면, form 하위 요소객체의 입력값(value)
			의 내용이 model데이터에 반영이 되고, 해당 모델데이터를 호출하는 화면의 directive({{}},
				v-text, v-html, v-bind:속성 등에 영향을 미친다.
				
		[하:기본코드]3. vue를 활용하여 ajax로 데이터를 처리할려고 한다. 처리를 위한 기본 코드를 기술하세요.\
			1) lib 선언..
				<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
			2) 모델 데이터 선언.
				검색 요청값, 리스트할 데이터 선언.
				ex) data:{ename:'',job:'',empList:[]}
			3) methods 하위에 기능 메서드 선언 : 이벤트 핸들러를 통해서 처리할 내용 선언.
				메서드1:요청데이터에 대한 filtering을 위하여 선언.
				메서드2:주된 ajax처리를 위하여 선언.
			4) fetch api 활용
				- 기본 형식:fetch(url).then(익명함수1).then(익명함수2).catch(익명함수3);
				- var vm = this; --> this:Vue()객체를 지칭
					익명함수에서 vue의 모델 데이터나, 메서드를 접근해서 호출할 때, 활용된다.
				- 익명함수1 
					function(response){
						// 서버에서 온 결과 response를 객체형태로 가져온다.
						// 그 중에서 json데이터를 filtering하여 다음 익명함수2에 매개변수
						// 로 넘긴다..
						return response.json();
					}	
				- 익명함수2
					function(json){
						익명함수1에서 넘겨온 json데이터를 받아서 실제, 모델데이터와 연결 
						처리를 한다.
						vm.empList = json.empList;					
					}	
			5) 화면 처리..
				요청값 처리 : v-model="요청모델데이터"
				서버에서 온 리스형 데이터 처리
					<tr v-for="emp in empList">
						<td>{{emp.empno}}</td>			
						<td>{{emp.ename}}</td>			
						<td>{{emp.job}}</td>			
						<td>{{emp.loc}}</td>			
				
							
		[중:응용]4. vue와 fetch api를 이용하여 회원정보를 검색처리하세요. A04_MemberController활용

		# 오늘의 목표
		1. js plugin 프로그램의 처리 프로세스를 이해하고, ajax를 통해 구현 할 수 있다.
		2. 계층형 sql을 이해하고, 스프링의 페이징 처리 로직을 이해하고 구현할 수 있다.


		# 궁금해하기 및 핵심키워드
		1. js plugin인 프로그램을 위한 어떤 개발 환경이 필요하고, 이런 프로그램을 처리를 위해서 어떤 지식이 필요할까?
		    
		2. 페이지 처리를 위해 필요하는 주요 속성은 어떤 것이 있고 어떻게 도출하고, 어떤 연관관계가 있는가?
		    총데이터건수, 화면에보여줄데이터건수, 총페이지수, 현재페이지번호, 블럭수

		 --%>
			var vm = new Vue({
				el:".container",
				data:{msg:"시작!!(뷰와함께)",
					amount:0,  // 입금/출금액
					balance:0  // 잔액
				},
				methods:{
					saving:function(){ // 입금 이벤트 핸들러
						this.balance +=parseInt(this.amount);
					},
					withdraw:function(){ // 출금 이벤트 핸들러
						this.balance -=parseInt(this.amount);
					}
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
    <!-- 
    금액 [   ] (입금)(출금) 잔액: @@@@
			var vm = new Vue({
				el:".container",
				data:{msg:"시작!!(뷰와함께)",
					amount:0,  // 입금/출금액
					balance:0  // 잔액
				},
				methods:{
					saving:function(){ // 입금 이벤트 핸들러
						this.balance +=parseInt(this.amount);
					},
					withdraw:function(){ // 출금 이벤트 핸들러
						this.balance -=parseInt(this.amount);
					}
				}
			});	    
     -->
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" v-model="amount" placeholder="금액" />
	    <button class="btn btn-info" @click="saving" type="button">입금</button>
	    <button class="btn btn-info" @click="withdraw" type="button">출금</button>
	    <input class="form-control mr-sm-2" placeholder="잔액"  v-model="balance" />
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