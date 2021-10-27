<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
   import = "wannafit.content.funding.*"
	import = "wannafit.content.vo.*"
    import = "java.util.*"
    
   
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${path}/MINI/a01_setting/main_nav.css">


<meta charset="UTF-8">
<title> Wanna-Fit, 나만의 핏을 찾아서 </title>
</head>
<script src="${path}/MINI/a01_setting/jquery-3.6.0.js" type="text/javascript"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

.side_menu2:hover {
	color: #A9BF9F;
}

.sec01 {
	width: 30%;
	text-align: left;
	margin-top: 5px;
	padding: 0;
	float: left;
}

.sec02 {
	width: 70%;
	align: right;
	margin: 0 auto;
	float: right;
	margin-top: 5px;
}

#title {
	align: left;
	font-size: 30px;
	font-weight: bold;
}

.tab2 {
	text-align: left;
	float: right;
	border-radius: 3px;
	border: 1px solid #dedede;
	margin: 10px 10px 10px 10px;
	width: 60%;
	background: #ffff;
	box-shadow: 1px 1px 1px #ccc;
	border-radius: 6px;
	border: 1px solid #dedede;
}
.tab {
	text-align: center;
	float: center;
	margin: 10px 10px 10px 10px;
	border: 1px solid #dedede;
	width:100%;
	height:100%;
}
.tbody  td {
font-size :9.5px;
font-weight: light;
}
</style>
<% /*   <div class="card" onclick = "function()">
	<table>
	<tr><td class="title_c"><img id="img" src="img\img01.JPG"/></td>
	<td class="text_c">
	<p><strong>후원일</strong> 2021. 09. 05|후원번호 4274413</p>
	<p>뽑아쓰면 뽑히는 회사소개서 제작 가이드북</p>
	<p><strong>결제 예정일</strong> 2021. 10. 01</p>
	<p>선물은 선택하지 않고, 밀어만 줍니다</p>
	</td></tr>
	</table>
	<hr>
	  	<table>
	<tr><td class="title_c"><img src="img\img01.JPG"/></td>
	<td class="text_c">
	<p><strong>후원일</strong> 2021. 09. 05|후원번호 4274413</p>
	<p>뽑아쓰면 뽑히는 회사소개서 제작 가이드북</p>
	<p><strong>결제 예정일</strong> 2021. 10. 01</p>
	<p>선물은 선택하지 않고, 밀어만 줍니다</p>
	</td></tr>
	</table>
	<hr>
	  	<table>
	<tr><td class="title_c"><img src="img\img01.JPG"/></td>
	<td class="text_c">
	<p><strong>후원일</strong> 2021. 09. 05|후원번호 4274413</p>
	<p>뽑아쓰면 뽑히는 회사소개서 제작 가이드북</p>
	<p><strong>결제 예정일</strong> 2021. 10. 01</p>
	<p>선물은 선택하지 않고, 밀어만 줍니다</p>
	</td></tr>
	</table>
</div>*/
FUN_dao dao2 = new FUN_dao();
ArrayList<FunPro_VO> fundinglist = dao2.getfundinglistAll();
%>

<script type="text/javascript">
$(document).ready(function() {
	
	
	//1. 대문자/소문자변경 
	//$("#frm01 [name=category], #frm01 [name=state]").keyup(function(event){
	//if(event.keyCode==13){
	//	$(this).val($(this).val().trim().toUpperCase());
	//	schFun();	
	//}
	//});
	//2. 클릭 시 함수실행 
	$("#schBtn").click(function() {
					schFun();
	});
	
	//3. 펀딩함수 				
	function schFun() {
					var xhr = new XMLHttpRequest();
					var categoryV = $("[name=category]").val();
					var stateV = $("[name=state]").val();
					
					var qstr = "proc=sch&cfp_atecory=" + categoryV + "&fp_state=" + stateV;
					xhr.open("get", "${path}/fundingsup.do?" + qstr, true);
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4 && xhr.status == 200) {
							var flist = JSON.parse(xhr.responseText);
							console.log(flist);
							var show = "";
							$(flist).each(
									function(idx, fundinglist) {
										show += "<tr class='text-center'"
												+ "data-toggle='modal' data-target='#exampleModalCenter' onclick='detail("+fundinglist.id+")'><td id='detail2' onclick ='detail("+fundinglist.id+")'>"
												+ fundinglist.id + "</td>";
										show += "<td>" + fundinglist.fp_category + "</td>";
										show += "<td>" + fundinglist.fp_title + "</td>";
										show += "<td>" + fundinglist.fp_state + "</td>";
										show += "<td>" + fundinglist.fp_enddate
												+ "</td></tr>";

									});
							
							$(".tbody").html(show);
						}
					};
					xhr.send();
				}

});
/*
	function detail(id){
		$("#exampleModalLongTitle").text("등록 펀딩상품 상세");
		$("#regBtn").text("수정");
		$("")
		var id = $("name=id").val();
		xhr.open("get","${path}/fundingsup.do?proc=detail&id="+id,true);
		console.log("디테일 시작")
		xhr.onreadystatechange = function(){
			if(xhr.readyState==4&&xhr.status==200){
				var fundetail = JSON.parse(xhr.responseText);
				$("#frm02 [name=id]").val(fundetail.id);
				$("#frm02 [name=fp_title]").val(fundetail.fp_title);
				$("#frm02 [name=fp_intro]").val(fundetail.fp_intro);
				$("#frm02 [name=fp_category]").val(fundetail.fp_category);
				$("#frm02 [name=fp_content]").val(fundetail.fp_content);
				$("#frm02 [name=fp_startdate]").val(fundetail.fp_startdate);				
				$("#frm02 [name=fp_enddate]").val(fundetail.fp_enddate);				
				$("#frm02 [name=fp_state]").val(fundetail.fp_state);			
				$("#frm02 [name=fp_state]").val(fundetail.fp_state);			
				$("#frm02 [name=fp_accprice]").val(fundetail.fp_accprice);			
			}
		};
		xhr.send();			
		
	}	
	*/
	$(document).ready(function() {
		$("#detail2").click(function() {
			location.href = "${path}/fundingsup.do?proc=detail&id="+id;
			console.log(id);
		});
	});


</script>
<body>

	<nav class="navbar">
		<div class="nav-wrapper">
			<ul class="logo">
				<li><a href="${path}/WANNAFIT/a01_setting/Main.jsp">WANNAFIT</a></li>  
			</ul>
		</div>
    
		<div class="menu-wrapper">
			<ul class="menu">
				<li><a href="${path}/WANNAFIT/user/UT001-Logout.jsp">로그아웃</a></li>
				<li><a href="${path}/WANNAFIT/mypage/mypage_main.jsp">마이페이지</a></li>
			</ul>
		</div>
	</nav>
  
	<nav class="navar1-1">
		<div><b>내가 원하는 삶을 살기 위한 건강 프로젝트! 워너핏</b></div>
	</nav>
  
	<nav class="navbar2">
		<ul class="side_menu1">
			<li><a href="#"><b>맵핏</b></a></li>
			<li><a href="#"><b>예약</b></a></li>
			<li><a href="${path}/WANNAFIT/groupfit/GF001-board.jsp"><b>그룹핏</b></a></li>
			<li><a href="#"><b>펀인핏</b></a></li>
			<li><a href="#"><b>마인핏</b></a></li>
		</ul>
	</nav>
	
   <section style="margin-top:5%;">
<div class ="sec01">
		<table>
			<tr style="vertical-align:top">
				<td style="width:190px; height:800px; border-right:2px solid black; padding-right:12px; text-align:justify;">
					<ul style="line-height:300%;">
						<li>
							<h3> 마이페이지 </h3>
							<ul>
								<li><a href="${path}/WANNAFIT/mypage/cal.jsp"> 캘린더 </a></li>
								<li><a href="#"> 나의 요금제 </a></li>
								<li><a href="#"> 나의 찜 내역 </a></li>
								<li><a href="#"> 그룹핏 관리 </a></li>
								<li><a href="#"> 마인핏 내역 </a></li>
							</ul>
						</li>
						<li>
							<h3> 워너핏 관리 </h3>
							<ul>
								<li><a href="#"> 예약 내역 </a></li>
								<li><a href="#"> 펀딩 내역 </a></li>
							</ul>
						</li>
						<li>
							<h3> 설정 </h3>
							<ul>
								<li><a href="#"> 개인정보 수정 </a></li>
								<li><a href="#"> 문의 내역 </a></li>
							</ul>
						</li>
					</ul>
				</td>
			</tr>
		</table>
</div>
   </section>
   
   <div class="sec02">
   	<div><p id ="title"> 펀딩현황 </p> </div>
   <hr>
   
   <form id = "frm01" method ="get">
   <input type ="hidden" value="" name ="proc"/>
   <span>
   <input type = "text" name="category" placeholder ="카테고리명"/>
   <input type ="text" name="state" placeholder ="상태명"/>
   <button class="btn btn-info" type="button" id="schBtn">검색</button>
   </span>
 	
 	<span> <button class="btn btn-success" type="button" >신규프로젝트등록</button></span>
    </form>
   <hr>
   
    <table class="tab">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
   	<col width="20%">
    <thead>
      <tr class="table-success text-center">
        <th>상품번호</th>
      </tr>
    </thead>	
    <tbody class= "tbody">
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>   
	
 
		<form id="frm02" class="form" method="post">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="id" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_title" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_intro" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_category" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_content" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_startdate" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_startdate" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_enddate" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_state" >
	        <input type="text" class="form-control" placeholder="사원번호(등록시비워두세요)" name="fp_accprice" >
	        
	       	
			
	        <input type="text" class="form-control" placeholder="부서번호 입력" name="deptno">
	      </div>

		</form>
      </div>   
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="regBtn">등록</button>      
        <button type="button" class="btn btn-secondary" id="clsBtn" data-dismiss="modal">Close</button>

      </div>
      
      
      
      
      
      
      
      
    </div>
  </div>
</div>
      </div>
      
      

</body>
</html>