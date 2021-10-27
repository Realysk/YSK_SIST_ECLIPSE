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
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>

<script type="text/javascript">
	$(document).ready(function(){
		var vm = new Vue({
			el:".container",
			data:{msg:"시작!!(뷰와함께)"}
		});	
		<%-- 
2021-10-05
# 일일정리문제
[하:개념]1. 파일을 다운로드 처리할려고 한다. 필요한 설정 부분을 컨테이너, 컨트롤러, 
           viewer를 나누어서 기술하세요
	처리순서
	1. viewer를 생성..
		model 부분을 설정하여 파일을 stream으로 처리할 수 있게 한다.
		model.get("downloadFile");
	2. 컨테이너에 등록   
		<bean id="downloadViewer" class="board.util.DownloadViewer"/>
	3. 다운로드 파일 클릭시 호출할 controller 선언
		download.do?fname=@@@;
		d.addAttribute("downloadFile", fname);
		return "downloadViewer";
	4. 화면단 (jsp)에서 이벤트를 통해서 해당 controller
		를 호출 처리.
		<input class="form-control" id="fname"
			value="${board.fname}"  />
		$("#fname").click(function(){
			location.href="${path}/download.do?fname="+$(this).val();
[하:응용]2. springweb에서 A10_FileUploadCtrl를 통해 업로드 처리된 내용을 다운로드 처리되게 하세요.
[하:기본코드]3. 계층형 sql을 위해 필요한 코드와 의미를 기술하세요.
	1) 계층적 데이터가 만들어지는 구조로 되어 있어야 한다.
		no vs refno,  empno vs mgr
	2) start with 컬럼명=조건데이터 : 최상위 레벨의 데이터의 조건을 선언
	3) connect by prior 컬럼1 = 컬럼2 : 계층적 처리가 되어 있는 컬럼간의
		연관관계 설정.
	4) order siblings by 컬럼명 asc/desc
		계층적 sql 데이터 처리의 정렬에 대한 설정.
[하:기본코드]4. 페이징 처리를 위한 vo의 중요 속성을 기술하세요.
	count : [DB]총 데이터 건수
	pageSize : [요청값] 한번에 보여줄 페이지크기
	pageCount : [로직]  총페이지수 count/pageSize
	curPage : [요청값] 클릭한 현재 페이지번호
	start : [로직] 현재 페이지의 시작번호
	end : [로직] 현재 페이지의 마지막 번호


# 오늘의 목표
1. js plugin 프로그램의 처리 프로세스를 이해하고, ajax를 통해 구현 할 수 있다.
2. 페이징 처리의 로직을 이해하고, 페이징 처리된 게시판을 구현 할 수 있다.

# 궁금해하기 및 핵심키워드
1. js plugin인 프로그램을 위한 어떤 개발 환경이 필요하고, 이런 프로그램을 처리를 위해서 
    어떤 지식이 필요할까?
    



		
		--%>	
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