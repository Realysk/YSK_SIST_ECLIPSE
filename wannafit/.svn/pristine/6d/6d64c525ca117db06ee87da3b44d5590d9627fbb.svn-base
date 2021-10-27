<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
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
<link rel="stylesheet" href="${path}/content/A_settings/main_nav.css">
<style>

	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	/* .side_menu2:hover {color: #A9BF9F;} */
	


.section {
	position:relative;
	width:85%;
	height:100%;
	margin:0 auto;
	margin-top:5%;
	margin-bottom:10%;

}

.main-container {
	position:relative;
	width:100%;
	height:750px;
	margin:0 auto;

	
}

.main-container div{
	width:100%;
	margin:0 auto;
	padding:5%;
}



.tab-title {
	width:150px;
	padding:1%;
	text-align:center;
}

#btnTag{
	width:100px;
	height:100px;
	margin:0 auto;
	padding:1%;
	border:1px dotted black;
}

.tab_all {
border : 1;
align:ceter;
width:100%;
celpadding:0;
cellspacing:0;
margin: 0 auto;
border-collapse: collapse;
}
.td_head {
margin: 0 auto;
border-collapse: collapse;
text-align:center;
  
}

.td_body1 {
margin-top:20px;
border:2;
bordercolor:#666666; 
bgcolor:#666666;
width:70%;
float:center;
margin: 0 auto;
border-bottom:1px solid #C0C0C0;
border-right:1px solid #C0C0C0;
border-top:1px solid #C0C0C0;
border-left:1px solid #C0C0C0;
cellspacing:0;
width:98%;

}
.td_body2 {
width:250px;
text-align:center;
nowrap bordercolor:#666666; 
bgcolor:#666666;

}

.td_day{

width:100px;
height:100px;
valign:top;
align:center;

}
.btn {
width: 10%;
font-size: 3px;
margin: 4px 2px;
background :#6C7EAA;
border-radius: 5px;

}
.btn:hover {
.button:hover 
 background: tomato; 
color: white;
box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);

}

</style>

<style type="text/css">

:root {
    --gray-100-color: #f9fbff;
    --gray-150-color: #f4f6fb;
    --gray-300-color: #e1e5ee;
    --gray-500-color: #4f546c;

    --point-bg-color: #f4f6fb;
    --point-font-color: #8C4D16;
    --point-bg2-color: #A9BF9F;
}

.section {
	position:relative;
	top:60px;
	width:100%;
	height:80%;
	margin:0 auto;
}

#img-container {
	width:100%;
	height:600px;
	margin:0 auto;
	text-align:center;
}

.footer {
	position:relative;
	width:100%;
	height:100px;
	color:var(--gray-500-color);
	text-align:center;
	padding-top:4%;
	padding-bottom:2%;
}

.footer p {
	font-size:10pt;
}

</style>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script type="text/javascript">

var userSession = "${login_User}";
var usrGrp = "${login_UsrGroup}";
console.log("[Main] 유저세션 : " + userSession);
console.log("[Main] 유저그룹세션 : " + usrGrp);

var resultAlert = "${resultAlert}";
console.log("[Main]로그인결과 : " + resultAlert);

if(resultAlert != "") {
	alert(resultAlert);
}

	$(document).ready(function(){
		
		
	});
</script>
</head>
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
						<li><a href="${path}/fundingsup.do">마이페이지</a></li>
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
			<li><a href="${path}/minepit.jsp"><b>마인핏</b></a></li>
		</ul>
	</nav>
	
  
<%
// Global Vars
int action = 0;  // incoming request for moving calendar up(1) down(0) for month //클릭하면 다음 캘런더로 넘어가는 숫자 
int currYear = 0; // if it is not retrieved from incoming URL (month=) then it is set to current year //현재 년도 세팅 
int currMonth = 0; // same as year //현재 월 세팅 
String boxSize = "100";  // how big to make the box for the calendar //캘린더 크기 



//build 2 calendars
Calendar c = Calendar.getInstance(); //현재시간정보
Calendar cal = Calendar.getInstance(); //현재시간정보 

	if (request.getParameter("action") == null) // Check to see if we should set the year and month to the current
	{
		currMonth = c.get(c.MONTH);
		currYear = c.get(c.YEAR);
		cal.set(currYear, currMonth,1);
	}

	else
	{
		if (!(request.getParameter("action") == null)) // Hove the calendar up or down in this if block
		{
			currMonth = Integer.parseInt(request.getParameter("month"));
			currYear = Integer.parseInt(request.getParameter("year"));

				if (Integer.parseInt( request.getParameter("action")) == 1 )
				{
					cal.set(currYear, currMonth, 1);
					cal.add(cal.MONTH, 1);
					currMonth = cal.get(cal.MONTH);
					currYear = cal.get(cal.YEAR);
				}
				else
				{
					cal.set(currYear, currMonth ,1);
					cal.add(cal.MONTH, -1);
					currMonth = cal.get(cal.MONTH);
					currYear = cal.get(cal.YEAR);
				}
		}
	} 
%>

<%!
    public boolean isDate(int m, int d, int y) // This method is used to check for a VALID date
    {
        m -= 1;
        Calendar c = Calendar.getInstance();
        c.setLenient(false);

        try
        {
                c.set(y,m,d);
                Date dt = c.getTime();
        }
          catch (IllegalArgumentException e)
        {
                return false;

        }
                return true;
    }
%>
<%!
   public String getDateName (int monthNumber) // This method is used to quickly return the proper name of a month
	    {
		String strReturn = "";
		switch (monthNumber)
		{ 
	case 0:
		strReturn = "January";
		break;
	case 1:
		strReturn = "February";
		break;
	case 2:
		strReturn = "March";
		break;
	case 3:
		strReturn = "April";
		break;
	case 4:
		strReturn = "May";
		break;
	case 5:
		strReturn = "June";
		break;
	case 6:
		strReturn = "July";
		break;
	case 7:
		strReturn = "August";
		break;
	case 8:
		strReturn = "September";
		break;
	case 9:
		strReturn = "October";
		break;
	case 10:
		strReturn = "November";
		break;
	case 11:
		strReturn = "December";
		break;
	}
	return strReturn;
    }
%>
	<section class="section">
	<div class="main-container">
		<h4 align="center"> 
		<form>
<table class = "tab_all" >
  <tr>
	<td class ="td_head"><a href="cal.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font size="1">Previous Month</font></a></td>
	<td class ="td_head"><b><%=getDateName (cal.get(cal.MONTH)) + " " + cal.get(cal.YEAR)%></b></td>
	<td class ="td_head"><a href="cal.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font size="1">Next Month</font></a></td>
  </tr>
</table>


    <table class ="td_body1">
  	<tr>
    		<td class = "td_body2"><b>Sun</b></td>
    		<td class = "td_body2"><b>Mon</b></td>
    		<td class = "td_body2"><b>Tues</b></td>
    		<td class = "td_body2"><b>Wed</b></td>
    		<td class = "td_body2"><b>Thurs</b></td>
    		<td class = "td_body2"><b>Fri</b></td>
    		<td class = "td_body2"><b>Sat</b></td>
  	</tr>
  	
  	
<%
String param = request.getParameter("param");
//1. 캘린더 변수  :  Calendar loop
	int currDay; //현재 날짜 
	String todayColor; //현재날짜
	int count = 1; //카운트 :1 
	int dispDay = 1; //디스플레이 


//2. 7번 loop돌면서 tr 행 생성 
	for (int w = 1; w < 7; w++) // 7일 루프 (일주일) 
	{
%>
  	<tr>
<% 

		//3. 7번 중에 1번 tr 생성하는데, 그 다음에 td생성하는데
		//8번 중에, 
  		for (int d = 1; d < 8; d++) //8뤂는 뭐야 
		{
			if (! (count >= cal.get(c.DAY_OF_WEEK))) //그 중 요일이 1보다 크면 (1,2,3,4,5,6,7)
			{ 
				
		//열 생성 
%>
		<td class = "td_day"></td>
<%
			count += 1;
			}
			
			
			
			
			
			else
			{

				if (isDate ( currMonth + 1, dispDay, currYear) ) // use the isDate method
				{ 

					if ( dispDay == c.get(c.DAY_OF_MONTH) && c.get(c.MONTH) == cal.get(cal.MONTH) && c.get(c.YEAR) == cal.get(cal.YEAR)) // Here we check to see if the current day is today
        				{
							todayColor = "#6C7EAA";
						}
						else
						{
							todayColor = "#ffffff";
						}
%> 
		<td class ="trd" onclick="goDetail(<%=dispDay%>)" bgcolor ="<%=todayColor%>" width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top" name ="param" value="<%=param%>"><%=dispDay%><button  onclick ="change()" class ="btn">+</button><br>
		</td>
<%
					count += 1;
					dispDay += 1;
				}
				else
				{
%>
		<td width="<%=boxSize%>" align="left" height="<%=boxSize%>" valign="top">&nbsp;</td>
<%
				} 
			}

       } 
%>
  	</tr> 
<% 
}
%>

<tr><td>
</table>
</form>



<script type="text/javascript">
function change(){
    window.open("${path}/content/mypage/schedule2/a02_scheduler.jsp","popupView","width=500 height=500"); 
}

function goDetail(dispDay){
		console.log("go");
		// var n1 = document.querySelector("[name=param]").value;
		 var n1 = dispDay;
	  //  window.open("a03_Detail.jsp",pop_title,"width=600 height=600"); 
	  //	var url = "a03_Detail.jsp?Snum="+snum;
	  //	window.open(url,pop_title,"width=600 height=600"); 
	  	alert(dispDay+"상세화면 이동");
  //click한 td의 value	- > A0 뒤에 들어가ㅗ록 
	
  
 	location.href ="schedule2/a03_Detail.jsp?param="+"A0"+n1;
	}
//

</script>
	</div>
	</section>
   

<jsp:include page="/content/A_settings/main_footer.jsp"/>
</body>
