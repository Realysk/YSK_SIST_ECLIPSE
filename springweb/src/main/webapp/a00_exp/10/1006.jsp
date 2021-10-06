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
	[하:개념] 1. 파일을 다운로드 처리하려고 한다. 필요한 설정 부분을 컨테이너, 컨트롤러, viewer를 나누어서 기술하세요.
	
		- 컨테이너
			<bean id="downloadViewer" class="board.util.DownloadViewer"/>
		
		- BoardController
			@RequestMapping(params="method=detail")
			public String boardDetail(@RequestParam("no") int no, Model d) {
				d.addAttribute("board", service.getBoard( no ));
				
				return "a03_detail";
			}
			
		- DownloadController
			@RequestMapping("download")
			public String download(@RequestParam("fname") String fname, Model d) {
				// viewer 안에 있는 모델명과 동일하게 하여 이름 설정
				d.addAttribute("downloadFile", fname);
				
				return "downloadViewer";
			}
			
		- Viewer
			//현재 다운로드할 파일의 위치 (공통설정파일에서 호출)
			@Value("${upload}")
			private String upload;
		
			@Override
			protected void renderMergedOutputModel(
					Map<String, Object> model, 
					HttpServletRequest request, HttpServletResponse response)
					throws Exception {
				// TODO Auto-generated method stub
				// 요청으로 온 file명은 model이름을 downloadviewer한테 호출한다.
				// 모델명은 downloadFile, 실제 파일명을 할당 처리..
				//     model.addAttribute("downloadFile", 파일명);
				// 1. controller에서 전달되어온 파일명으로 파일객체 할당
				String fname = (String)model.get("downloadFile");
				// 	 	1) 파일을 객체로 생성 처리하여, 전달 준비.
				File file = new File(upload+fname);
				System.out.println("## viewer오신 것을 환영합니다##");
				System.out.println("전체파일명:"+file.getPath());
				System.out.println("파일명:"+file.getName());
				System.out.println("파일길이:"+(int)file.length());
				// 2. 다운로드 처리를 위한 response 객체 설정..
				//		1) 파일다운을 처리하기 위한 contentType설정.
				response.setContentType("application/download; charset=UTF-8");
				//		2) 파일의 길이와 파일명 설정.
				response.setContentLength((int)file.length());
				//         - 한글파일명을 위한 encoding처리..
				fname = URLEncoder.encode(fname,"utf-8").replaceAll("\\+", " ");
				//  3. Header 정보 설정..
				// filename="파일명"
				response.setHeader("Content-Disposition",
						"attachment;filename=\""+fname+"\"");
				response.setHeader("Content-Transfer-Encoding", "binary");
				//  4. 파일을 InputStream으로 전환하여 response의 OutStream에 탑재
				//     하여 전송..
				FileInputStream fis = new FileInputStream(file);
				
				OutputStream out = response.getOutputStream();
				//     	1) FileCopyUils의 copy 메서드를 통해서 전달.
				FileCopyUtils.copy(fis, out);
				//		2) 전송 완료 처리..
				out.flush();
		//		board.util.DownloadViewer
			}	
	
	[하:응용] 2. Springweb에서 A10_FileUploadCtrl를 통해 업로드 처리된 내용을 다운로드 처리되게 하세요.
	
		
	
	[하:기본코드] 3. 계층형 SQL을 위해 필요한 코드와 의미를 기술하세요.
	
		- 계층형 SQL : 게시물에 답글을 게시하면 해당 글 바로 아래에 처리될 수 있는 경우처럼 효과적으로 만드는 방법
			SELECT * FROM board
			START WITH refno = 0
			CONNECT BY PRIOR NO = refno
			ORDER siblings BY NO DESC;
	
	[하:기본코드] 4. 페이징 처리를 위한 VO의 중요 속성을 기술하세요.
	
		// 요청값과 로직을 통해서 검색을 위한 VO
		// 1. 검색 : 제목/작성자
		private String subject;
		private String writer;
		// 2. 페이징 처리를 위한 속성
		private int count; // 총 데이터 건수
		private int pageSize; // 한번에 보여줄 페이지 크기
		private int pageCount; // 총 페이지 수 (count/pageSize)
		private int curPage; // 클릭한 현재 페이지번호
		private int start; // 현재 페이지 시작 번호
		private int end; // 현재 페이지 마지막 번호
		// 3. 블럭 처리 속성
	
 --%>
<html>
<head>
<meta charset="UTF-8">
<title>REALYSK</title>
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