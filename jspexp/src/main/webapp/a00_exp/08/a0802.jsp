<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
%>     
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText=" 놀이공원입장료 :50000";
	}
</script>
</head>
<%-- 
# 
# 정리문제(금)
1. 리스트된 화면의 특정 키를 통해 상세화면에 전송처리하는 js를 기술하세요.
	<tr ondblclick="함수(키)">
	function 함수(키){
		location.href="이동할페이지?키="+키;
	}
2. 상세화면에서 받은 key를 요청값을 이용해서, 요청값을 받았을 때, 처리할 프로세스를
   기술하세요.
   String key = request.getParameter("키");
   if(key!=null){
   		Dao dao = new Dao();
   		상세단위객체 참조=dao.getXXX(Integer.parseInt(key));
   }
3. 요청값을 기준으로 dao에 단일 데이터를 처리하여 form하위 input에 할당하는 프로세스를
   순서로 기술하세요.
   <input name="속성" value="<%=참조.getXXX()%>"/> 
   
4. 상세화면을 특정한 내용을 변경 후, 처리하는 프로세스를 파일명 기준으로 하여 핵심 코드를 기술하세요.
	1) 상세화면.jsp ===> 2) 처리프로세스(수정/삭제).jsp
	1) 항목에서 
		form action="처리프로세스.jsp"
			submit()
	2) request.getParameter("요청key")
	   Dao객체에 필요하는 기능 메서드 처리
	   요청값을 받아 객체로 선언 및 할당.
	   dao.기능메서드(요청값);
5. 회원리스트 화면에서 상세화면 처리 및 수정 처리하세요.
	


# 주간 정리문제
1. go.jsp에 요청값(name=홍길동)를 단계별로 아래와 같이 처리할 때, 사용 코드를 기술하세요.
    1) a href  : <a href="go.jsp?name=홍길동">go.jsp이동 홍길동 요청값 </a>
    2) h2로 클릭시 
    	<h2 onlick="go()">함수호출</h2>
    	function go(){
    		location.href="go.jsp?name=홍길동";
    	}
    3) form객체 get방식 2페이지 처리
    	<form action="go.jsp">
    		<input name="name" value="홍길동"/>
    		<input type="submit" value="get방식전송"/>
    	</form>
    4) form객체 post방식 1페이지 처리
       	<form method="post">
    		<input name="name" value="홍길동"/>
    		<input type="submit" value="post방식전송"/>
    	</form> 
    
2. 요청값에 대한, null값과 숫자값 처리를 간단한 예제로 기술하세요
	if(요청값!=null){ // 초기화면에 대한 nullpointer 예외 방지 처리..
		int num = 0;
		if(!요청값.trim().equals("")){
			num = Integer.parseInt(요청값);
		}
	}


3. 요청값의 1페이지로 아래와 같은 내용을 처리하세요.
    놀이공원입장료 :50000
    나이 :[   ] (나이에 따른 할인율계산)
    인원 :[   ]
    [입장료계산]
4. 물건정보 테이블을 만들고, 물건리스트 처리하는 화면과 등록/상세조회/수정/삭제 구현 처리하세요.
--%>
<%
	String ageS = request.getParameter("age");
	String cntS = request.getParameter("cnt");
	double discount=0.0;
	int tot=0;
	int age = 0; if(ageS!=null) age = Integer.parseInt(ageS);
	int cnt = 0; if(cntS!=null) cnt = Integer.parseInt(cntS);
	if(age<5 || age>=65){
		discount=1.0;
		
	}else if(age<=18){
		discount=0.5;
	}
	tot=50000*cnt;
	tot=(int)(tot-(tot*discount));
%>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table class="listTable" align="center">
		<tr><th>나이</th><td><input type="text" name="age" value="<%=age%>"/></td></tr>
		<tr><th>인원</th><td><input type="text" name="cnt" value="<%=cnt%>"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="입장료계산"/></td></tr>
	</table>	
	</form>
	<%if(ageS!=null){ %>
	<h2 align="center">할인율:<%=(int)(discount*100)%>%, 최종입장료:<%=tot%> </h2>
	<%}%>
		
	
</body>
</html>