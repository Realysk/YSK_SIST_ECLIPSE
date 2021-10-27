<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='${path}/a00_com/lib/main.css' rel='stylesheet' />
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >


<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src='${path}/a00_com/lib/main.js'></script>
<script src="https://unpkg.com/vue/dist/vue.js" type="text/javascript"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script>
 // $(document).ready(function(){   });
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    // 현재날짜를 ISO형식으로 가져오되, 시간을 뺀 나머지
	var toDay = new Date().toISOString().split("T")[0];
	// new FullCalendar.Calendar("선택한요소객체",{속성:속성값,.....})
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      initialDate: toDay,
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
    	console.log("매개변수로 받는 내용");
    	console.log(arg);
    	console.log("시작:"+arg.start);
    	console.log("종료:"+arg.end);
    	console.log("종일여부:"+arg.allDay);
    	$("h2").click(); // h2 클릭으로 모달창이 로딩되게 처리..
    	$("#exampleModalLongTitle").text("일정등록");
    	$("#regBtn").show();
    	$("#uptBtn").hide();
    	$("#delBtn").hide();
    	// form에 기본 정보 넣기..
    	// 기존 정보 초기화
    	$("form")[0].reset();
    	///./alert(arg.start.toLocaleString());
    	// 화면에 보이는 것과 실제 저장할 데이터의 형식이 다르기 때문에...
    	$("#start").val(arg.start.toLocaleString());
    	$("[name=start]").val(arg.start.toISOString());
    	
    	
    	console.log(arg.start.toISOString());
    	$("#end").val(arg.end.toLocaleString());
    	$("[name=end]").val(arg.end.toISOString());
    	$("#allDay").val(""+arg.allDay);
    	console.log("종일:"+(arg.allDay?1:0));
    	$("[name=allDay]").val((arg.allDay?1:0));
        calendar.unselect()
      },
      eventClick: function(arg) {
    	console.log("특정일정 클릭시!!");
    	console.log(arg.event);
    	
    	$("h2").click(); // h2 클릭으로 모달창이 로딩되게 처리..
    	$("#exampleModalLongTitle").text("상세일정");
    	$("#regBtn").hide();
    	$("#uptBtn").show();
    	$("#delBtn").show();
    	addForm(arg.event);
      },
	  eventDrop:function(info){ // 특정 일정을 드래그해서 드랍했을 때..
		//alert("이벤트 드랍")  
	 	console.log("#이벤트 드랍#")	
	 	console.log(info.event);
	 	// form객체에 데이터 입력
	 	// ajax 처리
		addForm(info.event);
		ajaxFun("calendarUpdate.do")
	  },
	  eventResize:function(info){ // 특정 일정의 사이즈를 변경했을 때..
		 //alert("이벤트 사이즈변경")
		 console.log("#이벤트 사이즈변경#")	
		 console.log(info.event);	
	 	// form객체에 데이터 입력
	 	// ajax 처리	
		 addForm(info.event);
		 ajaxFun("calendarUpdate.do")
	  },      
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: function(info,successCallback, failureCallback){
    	  $.ajax({
    		  type:"post",
    		  url:"${path}/calList.do",
    		  dataType:"json",
    		  success:function(data){
    			  console.log(data)
    			  // 초기화면에서 가져온 전체 json 데이터를 매개변수
    			  // 함수로 할당하면 calendar api 내부적인 데이터를 할당
    			  // 처기된다.
    			  successCallback(data);
    		  },
    		  error:function(err){
    			  console.log(err);
    		  }
    		  
    	  });
    	  
      }
    });

    calendar.render();
    
    $("#regBtn").click(function(){
    	if($("[name=title]").val()==""){
    		alert("일정을 등록하세요!");
    		return;
    	}
    	ajaxFun("calendarInsert.do")
    });
    $("#uptBtn").click(function(){
    	if(confirm("수정하시겠습니까?")){
    		ajaxFun("calendarUpdate.do")
    	}
    });
    $("#delBtn").click(function(){
		if(confirm("삭제하시겠습니까?")){
			ajaxFun("calendarDelete.do")
    	}   	
    });
    
    
  });
  function ajaxFun(url){
  	$.ajax({
		type:"post",
		url:"${path}/"+url,
		data:$("form").serialize(),
		success:function(data){
			alert(data);
			location.reload();
		},
		error:function(err){
			console.log(err);
		}
		
	});  	  
  }
  function addForm(event){
  	$("form")[0].reset();
	$("[name=id]").val(event.id);
	$("[name=title]").val(event.title);
	$("[name=borderColor]").val(event.borderColor);
	$("[name=backgroundColor]").val(event.backgroundColor);
	$("[name=textColor]").val(event.textColor);
	// 기본 api에서 지원되는 속성이 아닌 데이터는 event.extendedProps.속성
	// 형식으로 선언하여 가져올 수 있다.
	$("[name=content]").val(event.extendedProps.content);
	$("#start").val(event.start.toLocaleString());
	$("[name=start]").val(event.start.toISOString());
	$("#end").val(event.end.toLocaleString());
	$("[name=end]").val(event.end.toISOString());
	/*
	js/java에서 사용되는 boolean 속성은 DB에는 데이터유형이 없지만,
	number(1) - 0/1로 설정하면 mybatis에서 자동으로 false/true로 형변환하여
	설정해준다.

	
	
	*/
	$("#allDay").val(""+event.allDay);
	$("[name=allDay]").val((event.allDay?1:0)); 	  	  
  }

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  .input-group-text{width:100%;
		text-align:center;background-color:#cfffdf;
		color:black;font-weight:bolder;}
  .input-group-prepend{width:35%;}  
</style>
</head>
<body>

  <div id='calendar'></div>
<h2 data-toggle="modal" 
data-target="#exampleModalCenter"></h2>  
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

		<form  class="form"    method="post">
		  <input type="hidden" name="id" value="0"/>
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">일정</span>
		    </div>
		    <input type="text" name="title" class="form-control" placeholder="일정입력">
		  </div>
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">시작일</span>
		    </div>
		    <input type="text" id="start" class="form-control" placeholder="입력">
		    <input type="hidden" name="start" >
		  </div>	
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">종료일</span>
		    </div>
		    <input type="text" id="end" class="form-control" placeholder="입력">
		    <input type="hidden" name="end" >
		  </div>	
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">내용</span>
		    </div>
		    <textarea name="content" rows="5" cols="10"  
		    	class="form-control" ></textarea>
		  </div>	
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">테두리색상</span>
		    </div>
		    <input type="color" name="borderColor"  value="#0099cc" class="form-control" placeholder="입력">
		  </div>	
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">배경색상</span>
		    </div>
		    <input type="color" name="backgroundColor"  value="#0099cc"  class="form-control" placeholder="입력">
		  </div>	
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">글자색상</span>
		    </div>
		    <input type="color" name="textColor" value="#ccffff" class="form-control" placeholder="입력">
		  </div>	
		  <div class="input-group mb-3">
		    <div class="input-group-prepend">
		      <span class="input-group-text">종일여부</span>
		    </div>
		    <select id="allDay" class="form-control" >
		    	<option value="true">종일</option>
		    	<option value="false">시간</option>
		    </select>
		    <input type="hidden" name="allDay"/>
		  </div>	
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id='regBtn' class="btn btn-primary">등록</button>
        <button type="button" id='uptBtn' class="btn btn-info">수정</button>
        <button type="button" id='delBtn' class="btn btn-warning">삭제</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
