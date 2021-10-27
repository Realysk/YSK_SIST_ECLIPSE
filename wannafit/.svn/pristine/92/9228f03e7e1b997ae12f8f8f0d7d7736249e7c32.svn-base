<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import ="wannafit.content.vo.*"
    import ="wannafit.content.DB.*"
%>
// JSP Calendar:--
// Created by Jason Benassi
// jbenassi@lime-light.com
// http://www.wakeboardutah.com
// 7-2002
%>
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


<html>
<head>

</head>
<style>
.tab_all {
border : 1;
align:ceter;
width:70%;
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


}
.td_body2 {
width:200px;
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

<form>
<table class = "tab_all" >
  <tr>
	<td class ="td_head"><a href="cal.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=0"><font size="1">Previous Month</font></a></td>
	<td class ="td_head"><b><%=getDateName (cal.get(cal.MONTH)) + " " + cal.get(cal.YEAR)%></b></td>
	<td class ="td_head"><a href="cal.jsp?month=<%=currMonth%>&year=<%=currYear%>&action=1"><font size="1">Next Month</font></a></td>
  </tr>
</table>

<div></div>
<div></div>
<div></div>

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
    window.open("a02_scheduler.jsp","popupView","width=350 height=350"); 
}

function goDetail(dispDay){
	  //  window.open("a03_Detail.jsp",pop_title,"width=600 height=600"); 
	  //	var url = "a03_Detail.jsp?Snum="+snum;
	  //	window.open(url,pop_title,"width=600 height=600"); 
	  	alert(param+"상세화면 이동");
	 	location.href ="a03_Detail.jsp?param="+A0+dispDay;
		}

</script>


</body>
</html>
