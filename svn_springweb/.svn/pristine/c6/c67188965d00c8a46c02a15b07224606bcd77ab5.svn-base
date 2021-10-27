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
2021-09-30
# 일일정리문제
[하:개념]1. 파일업로드를 컨테이너단/화면단 설정을 기술하세요
	컨테이너 : org.springframework.web.multipart.commons.CommonsMultipartResolver
		객체 선언..
	화면단 : <form enctype="multipart/form-data">
				<input type="file" name="report" />	
		

[하:개념]2. MultipartFile객체는 어떤 역할을 하는가?
	화면단 <input type="file" name="report" />를 서버로 전송했을 때, 받을 수 있는 객체
		vo class에서 private MultipartFile report; 로 선언하여 해당 파일내용을 받을 수 있다.
[하:개념]3. 파일업로드 처리를 위한 service처리 내용을 File객체 만들기, 변환처리하기, 파일복사의 단계를 나누어 기술하세요.
	1) 파일 다운 받을 위치 정보  설정 : src\resource\properties\info
		upload=경로  tmpUpload=경로
	2) File객체 만들기
		@Value("${upload}")
		private String upload;
		
		MultipartFile mtf
		String fname = mtf.getOriginalFilename();
		File 참조 = new File(upload+fname);
	3) 변환처리하기 : MultipartFile ==> File
		mtf.transferTo(파일객체);
	4) 임시폴드에 있는 파일내용을  실제 저장할 폴드에 복사처리.
		File.copy(임시파일.toPath(), 실제파일.toPath(), 복사옵션설정)
		복사옵션 :StandardCopyOption.REPLACE_EXISTING 	
[하:응용]4. springweb 프로젝트에 자료명[   ] 첨부파일[    ]로 z01_upload폴드를 만들고 파일을 첨부하세요.
	@Value("${upload}")
	private String upload;
	@Value("${tmpUpload}")
	private String tmpUpload;
	private void service(MultipartFile report, String name) {
		// 파일업로드 처리..
		// 1. 파일명
		String fname = report.getOriginalFilename();
		if(fname!=null && !fname.equals("")) {
			// 2. 파일 객체 생성..
			File tmpFile = new File(tmpUpload+fname);
			File orgFile = new File(upload+fname);
			// 3. MultipartFile를 File객체로 전환.
			try {
				report.transferTo(tmpFile);
				// 4. 임시경로 파일을 서버에 있는 경로로 복사..
				Files.copy(tmpFile.toPath(), orgFile.toPath(),
						StandardCopyOption.REPLACE_EXISTING);
# 오늘의 목표
1. 기본 vue directive를 사용할 수 있다.
2. 스프링의 파일 다운로드 뷰를 처리할 수 있다.
3. 스프링의 답글을 처리 로직을 안다

# 궁금해하기 및 핵심키워드
1. vue에서 사용하는 디렉티브는 어떤 기능을 하길래 이 난리인가?
    v-text, v-html, v-bind, v-model
2. vue에서 사용하는 조건문과 반복문 처리는 어떤 형식일까?
    v-show, v-if, v-for="(단위객체, index) in 객체형배열모델"

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