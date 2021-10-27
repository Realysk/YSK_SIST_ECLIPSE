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



$(document).ready(function(){
    $(".agree>a").click(function(){
        var submenu = $(this).next("ul");

        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    }).mouseover(function(){
        $(this).next("ul").slideDown();
    });
    
 //   $("#next_btn").click(function(){
  //  	alter("정말 펀딩하시겠습니까?");
   // 	location.href("FUN-UI-04-01.jsp");
   // });
});




</script>
</head>
<%-- 
# 
	<!--<jsp:useBean id="funding01" class="PRO9.VO_FUN2" scope="session"/>
	<!-- <p>${funding01.adress}</p> -->	
--%>
<%
String codeS = request.getParameter("codeS");

 String id = request.getParameter("id");
 String wp_price = request.getParameter("wp_price");
 String wp_address = request.getParameter("wp_address");
 String wp_cardnum= request.getParameter("wp_cardnum");
 String wp_limitdate= request.getParameter("wp_limitdate");
 String wp_birth= request.getParameter("wp_birth");
 String wp_install= request.getParameter("wp_install");
 String wp_bank= request.getParameter("wp_bank");
 String wp_accname= request.getParameter("wp_accname");

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
	<div>
		<table class ="tab01">
			<tr><td><span > 후원금액입력 <<< </span><span > 개인정보입력 <<< </span><span class="image blinking"> 약관동의 <<< </span></td></tr>
		</table>
	</div>
	
<!--	<%=codeS%> -->
  		<p id = "Info_font"> 약관동의 </p>
  		
		
		<div>
    <ul>
        <li class="agree">
           <input type ="checkbox" name ="check"/> <a><img src="" alt="3자에 대한 제공 동의"/></a>
            <ul class="hide">
                <li>① 개인정보처리자는 개인정보의 처리 목적을 명확하게 하여야 하고 그 목적에 필요한 범위에서 최소한의 개인정보만을 적법하고 정당하게 수집하여야 한다.

② 개인정보처리자는 개인정보의 처리 목적에 필요한 범위에서 적합하게 개인정보를 처리하여야 하며, 그 목적 외의 용도로 활용하여서는 아니 된다.

③ 개인정보처리자는 개인정보의 처리 목적에 필요한 범위에서 개인정보의 정확성, 완전성 및 최신성이 보장되도록 하여야 한다.

④ 개인정보처리자는 개인정보의 처리 방법 및 종류 등에 따라 정보주체의 권리가 침해받을 가능성과 그 위험 정도를 고려하여 개인정보를 안전하게 관리하여야 한다.

⑤ 개인정보처리자는 개인정보 처리방침 등 개인정보의 처리에 관한 사항을 공개하여야 하며, 열람청구권 등 정보주체의 권리를 보장하여야 한다.

⑥ 개인정보처리자는 정보주체의 사생활 침해를 최소화하는 방법으로 개인정보를 처리하여야 한다.

⑦ 개인정보처리자는 개인정보를 익명 또는 가명으로 처리하여도 개인정보 수집목적을 달성할 수 있는 경우 익명처리가 가능한 경우에는 익명에 의하여, 익명처리로 목적을 달성할 수 없는 경우에는 가명에 의하여 처리될 수 있도록 하여야 한다.  <개정 2020. 2. 4.>

⑧ 개인정보처리자는 이 법 및 관계 법령에서 규정하고 있는 책임과 의무를 준수하고 실천함으로써 정보주체의 신뢰를 얻기 위하여 노력하여야 한다.</li>
               
            </ul>
        </li>
 
        <li class="agree">
            <input type ="checkbox" name ="check"/><a><img src="" alt="책임규정동의"/></a>
            <ul class="hide">
                <li>① 개인정보처리자는 개인정보의 처리 목적을 명확하게 하여야 하고 그 목적에 필요한 범위에서 최소한의 개인정보만을 적법하고 정당하게 수집하여야 한다.

② 개인정보처리자는 개인정보의 처리 목적에 필요한 범위에서 적합하게 개인정보를 처리하여야 하며, 그 목적 외의 용도로 활용하여서는 아니 된다.

③ 개인정보처리자는 개인정보의 처리 목적에 필요한 범위에서 개인정보의 정확성, 완전성 및 최신성이 보장되도록 하여야 한다.

④ 개인정보처리자는 개인정보의 처리 방법 및 종류 등에 따라 정보주체의 권리가 침해받을 가능성과 그 위험 정도를 고려하여 개인정보를 안전하게 관리하여야 한다.

⑤ 개인정보처리자는 개인정보 처리방침 등 개인정보의 처리에 관한 사항을 공개하여야 하며, 열람청구권 등 정보주체의 권리를 보장하여야 한다.

⑥ 개인정보처리자는 정보주체의 사생활 침해를 최소화하는 방법으로 개인정보를 처리하여야 한다.

⑦ 개인정보처리자는 개인정보를 익명 또는 가명으로 처리하여도 개인정보 수집목적을 달성할 수 있는 경우 익명처리가 가능한 경우에는 익명에 의하여, 익명처리로 목적을 달성할 수 없는 경우에는 가명에 의하여 처리될 수 있도록 하여야 한다.  <개정 2020. 2. 4.>

⑧ 개인정보처리자는 이 법 및 관계 법령에서 규정하고 있는 책임과 의무를 준수하고 실천함으로써 정보주체의 신뢰를 얻기 위하여 노력하여야 한다.</li>
               
            </ul>
        </li>
    </ul>
</div>
	
  		<div id="reserve">
  		
  		<form action ="${path}/funding.do" method="post" scope ="session">
  		  <jsp:useBean id="FUN2" class="wannafit.content.vo.FunReq_VO" scope="request" /> 	
	<jsp:setProperty  name="FUN2" property="wp_price" param="wp_price"/>
	<jsp:setProperty  name="FUN2" property="wp_address" param="wp_address"/>
	<jsp:setProperty  name="FUN2" property="wp_cardnum" param="wp_cardnum"/>
	<jsp:setProperty  name="FUN2" property="wp_limitdate" param="wp_limitdate"/>
	<jsp:setProperty  name="FUN2" property="wp_birth" param="wp_birth"/>
	<jsp:setProperty  name="FUN2" property="wp_install" param="wp_install"/>
	<jsp:setProperty  name="FUN2" property="wp_bank" param="wp_bank"/>
	<jsp:setProperty  name="FUN2" property="wp_accname" param="wp_accname"/>
	<jsp:setProperty  name="FUN2" property="id" param="id"/>
 
  	<input type ="hidden" name="wp_price" value ="<jsp:getProperty  name="FUN2" property="wp_price"/>"/>
  	<input type ="hidden" name="wp_address" value ="<jsp:getProperty  name="FUN2" property="wp_address"/>"/>
  	<input type ="hidden" name="wp_limitdate" value ="<jsp:getProperty  name="FUN2" property="wp_limitdate"/>"/>
  	<input type ="hidden" name="wp_birth" value ="<jsp:getProperty  name="FUN2" property="wp_birth"/>"/>
  	<input type ="hidden" name="wp_install" value ="<jsp:getProperty  name="FUN2" property="wp_install"/>"/>
  	<input type ="hidden" name="wp_bank" value ="<jsp:getProperty  name="FUN2" property="wp_bank"/>"/>
  	<input type ="hidden" name="wp_accname" value ="<jsp:getProperty  name="FUN2" property="wp_accname"/>"/>
  	<input type ="hidden" name="id" value ="<jsp:getProperty  name="FUN2" property="id"/>"/>
  	<input type ="hidden" name="wp_price" value ="<jsp:getProperty  name="FUN2" property="wp_price"/>"/>
   <input type ="hidden" name ="proc" value ="complete"/>
   <!-- 	
  	<jsp:getProperty  name="FUN2" property="wp_address" />
  	<jsp:getProperty  name="FUN2" property="wp_cardnum" />
  	<jsp:getProperty  name="FUN2" property="wp_limitdate" />
  	<jsp:getProperty  name="FUN2" property="wp_birth" />
  	<jsp:getProperty  name="FUN2" property="wp_install" />
  	<jsp:getProperty  name="FUN2" property="wp_bank" />
  	<jsp:getProperty  name="FUN2" property="wp_accname" />
  	<jsp:getProperty  name="FUN2" property="id" />
    <input type ="hidden" name ="proc" value ="funding"/>
 -->   
  	<input id ="next_btn" value="펀딩최종신청" type = "submit"/>
  		</form>
  		</div>
  		
</section>
</body>
</html>
