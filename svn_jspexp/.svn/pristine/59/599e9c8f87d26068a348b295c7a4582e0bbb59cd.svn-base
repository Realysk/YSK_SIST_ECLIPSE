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
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
	});
</script>
</head>
<%-- 
# 
# 정리문제
1. servlet을 생성하고, 도서명 가격을 요청값을 받아서 출력하는 처리를 하세요.(out.print())
2. A13MVC.java를 만들고, view단 호출(a04_basic/a10_gugu.jsp)
   초기페이지에 임의의 구구단 [   ] X [   ] 정답 :[   ] [확인]
   정답을 맞추면 정답입니다. 페이지이동, 틀리면, 다시 구구단 문제 페이지로 이동 처리하게 하세요.   
3. Date 하위 기능 메서드를 정리하세요
	var d01 = new Date(); // 오늘날짜.
	d01.setXXX(저장데이터);
	d01.getXXX();
	# XXX 부분 기능 메서드
	FullYear, Month(0~11), Date, Day(요일0~6), Hours, Minutes, Seconds
	

4. 기념일 확인하기, 오늘로부터 [    ]일 [이전] [이후] 클릭시, 해당 날짜를 계산하여 출력하세요.
   Date객체 활용 d.setDate(d.getDate()+@@@) 
5. 배열관련 기능 메서드를 정리하세요.
    # 초기데이터 할당 및 생성자. 
	var array01 = new Array();
	var array02 = new Array(크기);
	var array03 = new Array(데이터1, 데이터2,데이터3....);
	var array04 = [데이터1,데이터2, 데이터3];
	# 기능 메서드
	array04.slice(시작,마지막);  해당 부분만 절삭해서 가져온다. (구조변경안됨)
	array04.splice(시작,마지막); 해당 부분절삭하면 구조까지 변경된다.
	array04.push(마지막에 추가될 데이터);
	array04.pop(); // 마지막 데이터를 리턴하며, 구조가 삭제되어 처리된다.
	array04.reverse(); // 꺼꾸로 출력 처리.. 구조변경.
	array04.sort(); // 정렬 처리(구조변경)
	array04.sort(function(left, right){ return left-right;}); // 순차정렬(오름차순)
	array04.sort(function(left, right){ return right-left;}); // 정렬(내림차순)
	array04.concat([데이터1,데이터2..]); 배열 병합..
	
6. 등록점수:[   ][등록][내림차순정렬][오름차순정렬]
   no  점수

--%>
<%

%>
<body>
	<h2 align="center"></h2>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>사원명</th><td><input type="text" name="ename" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit" value="검색"/></td></tr>
	</table>	
	</form>
	<table  align="center" class="listTable">
		<tr><th></th><th></th><th></th></tr>
		<tr><td></td><td></td><td></td></tr>
	</table>	
	
</body>
</html>