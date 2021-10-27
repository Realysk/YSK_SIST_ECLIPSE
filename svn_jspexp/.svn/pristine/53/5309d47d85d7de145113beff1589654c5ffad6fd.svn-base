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
<%-- <link rel="stylesheet" href="<%=path%>/a00_com/a01_com.css">--%>
<style>
	
</style>

<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
# filter 기능 메서드 활용.
1. 기본 filter("선택자형식")
2. filter(function(idx, 요소객체){ return boolean값;});
3. 특정한 요소객체를 선택해서 action메서드를 처리하고, 그 하위 계층에 있는 요소 객체를 
	filter()해서 속성을 지정할 때, 사용된다. 
cf) 기능메서드의 chainning
$("요소선택자").기능메서드1().기능메서드2().기능메서드3()
	기능메서드가 연결해서 처리가 가능하다는 말을 의미한다.
	cf) 메서드 체이닝으로 인해 중첩적인 기능메서드가 적용되는데, 이 중첩기능메서드를 적용되지 
		않고, 요소선택자를 처리할 때는 end()기능메서드를 활용하여야 한다.
--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("filter 관련 기능 메서드");
		// li중에 filter("선택자형식")을 활용하여 짝수번째 있는 내용을 배경색상 green
		// chainning이 일어나서, 짝수index째에 한해서 다시 짝수/홀수번째로 나누어
		// 기능메서드 처리..
		// 기존 chainning을 끊고 기능 메서드를 적용할려면 end()를 중간에 삽입하여야 한다.
		$("li").filter(":even").css("background","green"
				).end().filter(":odd").css("background","orange"
				).end().filter(".orange,#apple").css("font-size","30px");
		// ex) table 사원정보가 있는 내용을 리스트 만들고,
		//      위 filter기능으로 짝수/홀수 배경색상을 다르게 처리하고,
		//      클래스 check로 선언된 부분은 글자크기를 25px로 처리하세요.. 1조 전체(손들기)
		$("#empTab tr").filter(":even").css("background-color","yellow"
		).end().filter(":odd").css("background-color","pink"
		).end().filter(".check").css("font-size","25px");	
	});
</script>
<body>
	<h2 align="center"></h2>
	<table id="empTab" align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>직책</th><th>급여</th></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr class="check"><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr class="check"><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr class="check"><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
		<tr><td>7001</td><td>홍길동</td><td>대리</td><td>4000</td></tr>
	</table>
	
	<ul>
		<li>아이템1</li>
		<li>아이템2</li>
		<li class="orange">아이템3</li>
		<li>아이템4</li>
		<li id="apple">아이템5</li>
		<li>아이템6</li>
		<li>아이템6</li>
		<li>아이템6</li>
		<li>아이템6</li>
		<li>아이템6</li>
		<li>아이템6</li>
		<li>아이템6</li>
		<li>아이템6</li>
		<li>아이템6</li>
	</ul>
	
	
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