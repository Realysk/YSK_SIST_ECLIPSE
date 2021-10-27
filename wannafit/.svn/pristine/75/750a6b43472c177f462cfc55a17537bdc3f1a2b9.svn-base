<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.*"     
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>

<style>

.sec01 {
width:70%;
margin: 0 auto;

}
.tab01 {
font-size:20px;
font-weight:bold;
text-align: center;
align:center;
background:#A9BF9F;
margin : 10px 10px 10px 10px;
width:100%;
border: 1px solid #D9B68B; 
background-color: #D9B68B; 
border-radius: 16px;
box-shadow: inset 0 0 8px #deb13a;
height:90%;
}

.table {
width :80%;
float:center;
border:1px;
margin-left:20%;
}
.user_Info {
width:80%;
margin-left:100px;

}

#Info_font {
font-size : 20px;
margin-left:10px;
margin-bottom:20px;
font-weight: bold;
text-align : center;
}

#reserve_Btn {
margin-top:20px;
background:#D9B68B;
width:100px;
}

#reserve {
align:center;
text-align:center;
float:center;
margin-top:20px;
}

.blinking{
 -webkit-animation:blink 1.5s ease-in-out infinite alternate; 
-moz-animation:blink 1.5s ease-in-out infinite alternate; 
animation:blink 1.5s ease-in-out infinite alternate; 
color:white;
}
 

@-webkit-keyframes blink{ 
0% {opacity:0;
} 100% {opacity:1;
} 
} 

@-moz-keyframes blink{ 0% {opacity:0;} 100% {opacity:1;} } @keyframes blink{ 0% {opacity:0;} 100% {opacity:1;} }




 .agree a{cursor:pointer;}
 .agree .hide{display:none;}

.card_num {
width:30px;
}
.form03 {
text-align: left;
float: center;
border-radius: 3px;
margin-top:30px;
margin-left:6%; 
margin-right::4%; 
border: 1px solid #dedede; 
width:90%;
height: 200px;
background:#ffff;
box-shadow:1px 1px 1px #ccc;
}
.form04 {
text-align: left;
float: center;
border-radius: 3px;
margin-top:30px;
margin-left:6%; 
margin-right::4%; 
border: 1px solid #dedede; 
width:90%;
height: 350px;
background:#ffff;
box-shadow:1px 1px 1px #ccc;
}
.form05 {
text-align: left;
float: center;
border-radius: 3px;
margin-top:30px;
margin-left:6%; 
margin-right::4%; 
border: 1px solid #dedede; 
width:90%;
height: 500px;
background:#ffff;
box-shadow:1px 1px 1px #ccc;
}

.btn {
margin-top:30px;
text-align: center;
float: center;
}
</style>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>

<link rel="stylesheet"  href="${path}/content/A_settings/main_nav.css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

</script>
<script type="text/javascript">
$(document).ready(function(){
	var xhr = new XMLHttpRequest();
	$("[name=empno]").keyup(function(event){
		if(event.keyCode==13){
			var empnoVal = $("[name=empno]").val();
			console.log($("[name=empno]").val())
			xhr.open("get","${path}/schEmp.do?empno="+empnoVal,true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var jTxt = xhr.responseText;
					$("#show td").text("");
					if(jTxt!="{}"){
						var emp = JSON.parse(xhr.responseText);
						console.log(emp);
						$("#show td").eq(0).text(emp.empno);
						$("#show td").eq(1).text(emp.ename);
						$("#show td").eq(2).text(emp.job);
						$("#show td").eq(3).text(emp.mgr);
						$("#show td").eq(4).text(emp.hiredate);
						$("#show td").eq(5).text(emp.deptno);
						$("#show td").eq(6).text(emp.sal);
						$("#show td").eq(7).text(emp.comm);
					}else{
						alert("해당 사원번호는 데이터가 없습니다.");					
					}
				}
			};
			
		}
	});
});
</script>
</head>
<%-- 
# 

--%>
<%

%>
<body>

	<nav class="navbar">
    <div class="nav-wrapper">
      <ul class="logo">
        <li><a href="FUN-UI-01.jsp">WANNAFIT</a></li>  
      </ul>
    </div>
    
    <div class="menu-wrapper">
      <ul class="menu">
    	<li><a href="#">워너핏 X 파트너</a></li>
        <li><a href="#">로그인</a></li>
        <li><a href="#">회원가입</a></li>
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
	        <li><a href="#"><b>그룹핏</b></a></li>
	        <li><a href="#"><b>펀인핏</b></a></li>
	        <li><a href="#"><b>워너핏</b></a></li>
	   </ul>
   </nav>

<section class ="sec01">

		<table class ="tab01">
			<tr><td><span class="image blinking" > 사업자정보 <<< </span><span> 회원정보 <<< </span><span > 기업정보 <<< </span></td></tr>
		</table>
	
 <div class ="form03"> 
	 
		<!--<form action = "/join_com.do" method = "post" enctype = "multipart/form-data">-->
		<form action = "/join_com.do" method = "post">
		
		<p id = "Info_font"> 사업자정보 </p>
			<table class = "user_Info">
			<tr><th>사업자등록번호:</th><td><input type ="text" value ="" name ="wb_regNum"/></td></tr>
			<tr><th>사업자 상호명:</th><td><input type ="text" value ="" name ="wb_regTitle"/></td></tr>
			<tr><th>사업자등록증:</th><td><input type = "file" name = "wb_regPath" value=""/></td></tr>
			<tr><th><input type="hidden" name ="proc" value ="insert"/></th></tr>
			<tr><th><input type="hidden" name ="proc2" value ="0"/></th></tr>
			
			</table>
		
  		</div>
  		<!-- INSERT INTO Wanna_Member values('himan162', 'as57793', 'himan101@gmail.com', 
  		'company1', 01012341259, 400, 1, '/com134.png', 1234-423-12-412);
         필수정보 : 회원아이디, 비밀번호, 이메일, 핸드폰번호, 회원구분, 신고횟수, 프로필이미지, 사업자번호(fk) -->
         </form>
         
         
     	 <form class ="form04" action = "/join_com.do" method = "post">
  		<p id = "Info_font"> 회원 정보 </p> 
  		<table class="table">
  		<tr><th>아이디</th><td><input type = "text" value="" name ="wm_id"/></td></tr>
  		<tr><th>비밀번호</th><td><input type = "password" value="" name ="wm_pass"/></td></tr>
  		<tr><th>이메일</th><td><input type = "text" value="" name ="wm_email"/></td></tr>
  		<tr><th>휴대폰번호</th><td><input type = "text" value="" name ="wm_tel"/></td></tr>
  		<tr><th>닉네임</th><td><input type = "text" value="" name ="wm_nik"/></td></tr>
  		<tr><th>회원구분</th><td><input type = "text" value="" name ="wm_usrGroup"/></td></tr>
  		<tr><th>프로필이미지<th><input type ="submit" value ="파일업로드" name ="wm_imgSrc" id ="#show"/>
 	 	<tr><th><input type="hidden" name ="proc2" value ="userinfo"/></th></tr>
 	 	<tr><th><input type="hidden" name ="proc" value ="null3"/></th></tr>
  		</table>
  		</form>
  		
  		
  		
	 <form class ="form05" action = "/join_com.do" method = "post">
  		<p id = "Info_font"> 기업 정보 </p>

  		<table class="table">
  		<tr><th>기업이메일</th><td><input name ="bs_email" class ="" type = "text" value=""/></td></tr>
  		<tr><th>sns주소</th><td><input name ="bs_sns" class ="" type = "text" value=""/></td></tr>
  		<tr><th>기업전화번호</th><td><input name ="bs_number" class ="" type = "text" value=""/></td></tr>
  		<tr><th>기업주소</th><td><input name ="bs_address" class ="" type = "text" value=""/></td></tr>
  		<tr><th>대표자명</th><td><input name ="bs_ceo" class ="" type = "text" value=""/></td></tr>
  		<tr><th>예금주명</th><td><input name ="bs_accname" class ="" type = "text" value=""/></td></tr>	
  		<tr><th>계좌번호</th><td><input name ="bs_accnum" class ="" type = "text" value=""/></td></tr>	
  		<tr><th>은행명</th><td><input name ="bs_accnum_name" class ="" type = "text" value=""/></td></tr>	
  		<tr><th>상호명</th><td><input name ="bs_busname" class ="" type = "text" value=""/></td></tr>	
  		<tr><th>소개글</th><td><textarea id="story" name="bs_intro"
          rows="5" cols="33">
		It was a dark and stormy night...
		</textarea></td></tr>	
  		<tr><th>소개사진<th><input type ="submit" value ="파일업로드" name ="bs_pic_url"/><input type = "file" name = "uploadfile"/></td></tr>
			
  		</table>
  		 </form>
  		 
  		 
  		
</section>
<p class = "p"></p>   	
	
</body>
</html>