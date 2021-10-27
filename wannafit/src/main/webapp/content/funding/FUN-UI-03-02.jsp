<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
    import ="wannafit.content.funding.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value ="utf-8"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Wanna-Fit, 나만의 핏을 찾아서 </title>
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

.user_Info {
background: #D8D9D7;
width:80%;
margin-left:20px;
}

#Info_font {
font-size : 20px;
margin-left:20px;
font-weight: bold;
}

#reserve_Btn {
background:#D9B68B;
width:100px;
}

#reserve {
align:center;
text-align:center;
float:center;
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
border-radius: 3px; 
border: 1px solid #dedede; 
margin : 10px 10px 10px 10px;
width:95%;
background:#ffff;
box-shadow:1px 1px 1px #ccc;
margin-left:10px;
}
</style>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<link rel="stylesheet" href="${path}/content/A_settings/main_nav.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}

</script>
<script type="text/javascript">

  
$(document).ready(function() {
	 $("#reserve_btn").click(function() {
	    	alert("다음페이지로이동");
	    	location.href="FUN-UI-03-03.jsp";
    });
	 
	 
	$("[name=add3]").keyup(function() {
	var adr1 = $("[name=add1]").val();
	var adr2 = $("[name=add2]").val();
	var adr3 = $("[name=add3]").val();
	var adress = adr1+adr2+adr3
	console.log("주소:"+adress);
	document.getElementById("wp_address").value = adress;
	});
	

	 
	$("[name=card4]").mousedown(function() {
	var card1 = $("[name=card1]").val();
	var card2 = $("[name=card2]").val();
	var card3 = $("[name=card3]").val();
	var card4 = $("[name=card4]").val();
	var cardnum = card1+card2+card3+card4;
	console.log("카드번호:"+cardnum);
	document.getElementById("wp_cardnum").value = cardnum;
	});
	
});
	

$(document).ready(function() {
	$("#checkbox1").mousedown(function() {
			var peri1 =$("#checkbox1").val();
			console.log(peri1);
			var peri2 =$("#checkbox2").val();
			console.log(peri2);
			var periode =peri1+"/"+peri2;
			console.log("유효기간:"+periode);
			document.getElementById("wp_limitdate").value = periode;
		});
	});
	
	
	 
//	$("#period2").mousedown(function() {
//	var peri1 = $("#period1").val();
	//var peri2 = $("#period2").val();
//	var periode = peri1+peri2;
//console.log("유효기간:"+periode);
//	});
	

$(document).ready(function() {
	$("#birth3").mousedown(function() {
		var birth1= $("#birth1").val();
		var birth2 = $("#birth2").val();
		var birth3 = $("#birth3").val();
	
		var birth = birth1+"-"+birth2+"-"+birth3+" 00:00:00";
		console.log("생년월일:"+birth);
		document.getElementById("wp_birth").value = birth;
		
		
	});
});


	$(document).ready(function() {
		$("#divide").mousedown(function() {
			var divide = $("#divide").val();
			console.log("할부기간:"+divide)
			document.getElementById("wp_install").value = divide;
});

	});
</script>
</head>
<%-- 
# 

--%>
<%
String codeS = request.getParameter("id");


if(codeS ==null) codeS = "";

FUN_dao dao = new FUN_dao();
ArrayList<FunPro_VO> fundinglist = dao.getDtfundinglist(codeS);

String tot= request.getParameter("firstName");

%>
<body>

  		
  
	
	<nav class="navbar">
		<div class="nav-wrapper">
		<ul class="logo">
			<li><a href="${path}/login.do">WANNAFIT</a></li>
		</ul>
		</div>
	    
		<div class="menu-wrapper">
		<form><input type="hidden" name="proc"/></form>
				<ul class="menu">
				<li><span id="usrGroup">${login_UsrGroup}</span></li>
				<li><span id="usrID">${login_User}님</span></li>
				<li><a href="${path}/login.do?proc=로그아웃">로그아웃</a></li>
				<!--  조건문으로 각 회원별 마이페이지 연결 -->
				
				<c:choose>
					<c:when test="${not empty login_User and login_UsrGroup eq '일반회원'}">
						<li><a href="${path}/mamcrud.do">마이페이지</a></li>
					</c:when>
					<c:when test="${not empty login_User and login_UsrGroup eq '트레이너'}">
						<li><a href="${path}/mytr.do">마이페이지</a></li>
					</c:when>
					<c:when test="${not empty login_User and login_UsrGroup eq '기업'}">
						<li><a href="${path}/mytr.do">마이페이지</a></li>
					</c:when>
				</c:choose>
				
				</ul>
		</div>
	</nav>
  
	<nav class="navar1-1">
		<div><b>내가 원하는 삶을 살기 위한 건강 프로젝트! 워너핏</b></div>
	</nav>
  
	<nav class="navbar2">
		<ul class="side_menu1">
			<li><a href="${path}/content/mapfit/wfmap01.jsp"><b>맵핏</b></a></li>
			<li><a href="${path}/reserve.do"><b>예약</b></a></li>
			<li><a href="${path}/schgrp.do"><b>그룹핏</b></a></li>
			<li><a href="${path}/funding.do"><b>펀인핏</b></a></li>
			<li><a href="#"><b>마인핏</b></a></li>
		</ul>
	</nav>
	
<section class ="sec01">
	<Form action = "FUN-UI-03-03.jsp" method ="post">

	<div>
		<table class ="tab01">
			<tr><td><span > 후원금액입력 <<< </span><span class="image blinking" > 개인정보입력 <<< </span><span > 약관동의 <<< </span></td></tr>
		</table>
	</div>

		<!-- <div class ="form03"> 
		  <p id = "Info_font"> 서포터정보 </p>
			<table class = "user_Info">
			<tr><td>이름:</td><td></td></tr>
			<tr><td>이메일:</td><td></td></tr>
			<tr><td>휴대폰번호:</td><td></td></tr>
			</table>
  		</div>
  		 -->
  		 <div class ="form03"> 
  		<p id = "Info_font"> 결제정보 </p>
  		
  		<ul>
	<li>
	<p>리워드주소: 
	<input name = "add1" id="member_post"  type="text" placeholder="우편번호" readonly onclick="findAddr()" value =""/>
	    <input name = "add2" id="member_addr" type="text" placeholder="주소" readonly value =""> 
	    <input name = "add3" type="text" placeholder="상세주소" value =""/>
	  </p>
	  </li>
			<li><p>카드번호: 	&nbsp;	&nbsp;<input name ="card1" class ="card_num" type = "text" value="0"/>
			<input name ="card2" class ="card_num" type = "text" value="0"/>
			<input name ="card3" class ="card_num" type = "text" value="0"/>
			<input name ="card4" class ="card_num"type = "text" value="0"/></p></li>
		
			<li><p>유효기간: 	&nbsp;	&nbsp;
			<select id="checkbox1">
				
			<%for(int i =1; i<=12; i++) {  %>
				<option value ="<%=i%>" id ="period1"><%=i %></option>
			<%} %>
			
			</select>
			
			<select id="checkbox2">
			<%for(int i=1900; i<=2021; i++){ %>
				<option value ="<%=i%>"  id ="period2"><%=i %></option>
			<%} %>
			</select>
			
						
			<li><p>생년월일: 	&nbsp;	&nbsp;
			<select id="birth1">
			<%for(int i=1900; i<=2021; i++){ %>
				<option  value ="<%=i%>" id="birth1"><%=i %></option>
			<%} %>
			</select>
			
			<select id="birth2">
			<%for(int i =1; i<=12; i++) {  %>
				<option  value ="<%=i%>" id="birth1"><%=i %></option>
			<%} %>
			</select>
			
			<select id="birth3">
			<%for(int i=1; i<=31; i++) {%>
				<option  value ="<%=i%>" id="birth1"><%=i %></option>
			<%} %>
			</select>	
			</p></li>
			<li><p>은행명:&nbsp; <input name ="wp_bank" value ="" /></p> </li>
			<li><p>예금주명: &nbsp;<input name ="wp_accname" value ="" /></p></li>
			
			<li><p>할부기간: 
			<select id ="divide">
			<%for(int i=1; i<=24; i++) {%>
				<option  value ="<%=i%>" value ="<%=i%>"><%=i%>개월</option>
			<%} %>
			<option>일시불</option>
			</select></p></li>
			
		</ul>

	    
            <input type="hidden"  name = "wp_price" id="wp_price" value="<%=tot%>"/>
            <input type="hidden"  name = "wp_address" id="wp_address" value=""/>
            <input type="hidden"  name = "wp_cardnum" id="wp_cardnum" value=""/>
            <input type="hidden" name = "wp_limitdate" id="wp_limitdate" value=""/>
            <input type="hidden" name = "wp_birth" id="wp_birth" value=""/>
            <input type="hidden" name = "wp_install"  id="wp_install" value=""/>
            <input type="hidden" name = "id" id="id" value="<%=codeS%>"/>
  
		
			</div>
  		<div id="reserve">
  		<input type ="submit" id = "reserve_btn" onclick ="function()" value = "다음으로 <<"/>
  		</div>
  	</Form>
  		
  		
</section>
<p class = "p"></p>   	
	
</body>
</html>