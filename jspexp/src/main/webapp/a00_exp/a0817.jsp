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

</head>
<%-- 
# 주간 정리문제
1. [jquery]form 요소객체 관련 filter 선택자를 기술하세요.
	form하위 요소객체 관련..
	$(":button") : input type="button|submit|reset")
	$(":checkbox|:radio")  : input type="checkbox|radio"
	$(":checked") : input type="checkbox|radio"가  checked 체크되었을 때, 선택자.
	$(":selected") : select의 하위 option이 선택되었는지 여부..
	$(":disabled|:enabled") : 폼하위 요소객체의 속성 disabled="disabled" 가 되었는지
		여부에 따른 속성 설정.
	$(":file, :image, :hidden, password ") : 폼 하위 여러 요소객체
	$(":input") : 폼에 입력되는 요소객체를 선택..

2. [jquery]위치기반 셀렉터와 동일하게 지원하는 메서드를 기술하세요? ex) $("td:eq(0)") $("td").eq(0)
	$("td:first") $("td").first()
	$("td:start") $("td").start()
	$("tr:odd") $("tr").odd()
	$("tr:even") $("tr").even()
	
3. [jquery]select 관련 이벤트와 선택자를 활용하여 물건의 구매정보를 출력처리하세요.
4. [jquery]속성관련 기능메서드와 활용방법을 기술하세요.
	속성기능메서드 : attr(), css()
	$("선택자").속성메서드("속성","속성값")
	$("선택자").속성메서드({"속성1":"속성1값","속성2":"속성2값","속성3":"속성3값",...});
	$("다중 선택자").속성메서드("속성", function(index){ return 다중속성값;})
	$("다중 선택자").속성메서드({"속성1":function(index){ return 다중속성값;}},{"속성2":function(index){ return 다중속성값;}}..)

5. [jquery]출력관련 기능메서드를 정리하세요.
	출력기능메서드 : text(), html(), val()
	text() : html 랜더링 없이 바로 화면에 출력하거나, 태그 코드를 제외한 순수 문자열 추출
	html() : html 랜더링 처리 후 화면에 출력하거나, 태그 코드를 포함하여 문자열 추출.
	val() : form 하위 요소객체의 value 속성값을 가져온다.
	$("선택자").출력메서드(function(index){ return 각각처리할값;}); : callback함수 활용..
	
6. [jquery]callback 메서드란 무엇인가? 기능메서드를 통해서 기술하세요.
	다중의 선택자의 속성이나 출력할 내용을 각각 index 기준으로 데이터를 처리할 때, 활용된다.
	$("다중 선택자").속성메서드("속성", function(index){ return 다중속성값;})
	$("선택자").출력메서드(function(index){ return 각각처리할값;}); : callback함수 활용..

7. [jquery]callback 메서드를 통해서, emp테이블의 데이터를 json 배열객체로 선언하여,
    테이블에 출력하세요.
8. [jsp]request의 주요기능과 기본 정보제공 메서드를 uri와 함께 기술하세요.
	request:웹브라우저와 웹서버에 전송한 요청 관련 정보를 제공
	주요기능
	1) 클라이언트 관려된 정보 읽기
	2) 서버와 관련된 정보 읽기
	3) 클라이언트가 전송한 요청 파라미터값 읽기 기능
	4) 클라이언트가 전송한 요청 헤더값 읽기 기능
	5) 클라이언트가 전송한 쿠기 읽기 기능
	6) 속성 처리 기능
	http://localhost:7080/jspexp/index.jsp
	1) 클라이언트의 ip주소(맥address) : request.getRemoteAddr();
	2) 요청 방식(get/post) : request.getMethod();
	3) 요청 url 주소 : request.getRequestURI() : ex) /jspexp/index.jsp
	4) 요청 context 명 : request.getContextPath() ex) /jspexp/
	5) 서버 이름 : request.getServerName()  ex) localhost
	6) 서버 port : request.getServerPort() ex) 7080


9. [jsp]form 하위 객체와 연관되어 있는 request의 요청값관련 메서드의 처리방법의 특성에 대하여 기술하세요.
	요청값에 의한 처리로 단일 요청(name=himan)와 다중 요청(name=himan&name=batman)에 대한 구분으로
	request.getParameter("단일요청")
	request.getParameterValues("다중요청")
	type='radio' : 이름이 동일하면 checked된 하나의 값만 요청값으로 전달.
	type="checkbox" : 이름이 동일하면 checked된 다중의 요청값으로 전달.
	type="hidden" : 화면에 보이지 않지만 요청값을 전달.


10. [jsp]hidden을 활용하여 중고물품의 판매등록/구매를 처리하세요
    물건명[   ] 가격[     ][판매등록][구매] ==> 클릭시, 하단에 해당 물건/가격을 등록/구매 표기.

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("연습예제");
		var price=0;
		var cnt=0;
		$("select").change(function(){			
			//if($(this).attr("name")=="price") price=$(this).val();
			//if($(this).attr("name")=="cnt") cnt=$(this).val();
			var name= $("[name=name]").val();
			var price= $("[name=price]").val();
			var cnt= $("[name=cnt]").val();
			console.log("물건명:"+name);
			console.log("가격:"+price);
			console.log("갯수:"+cnt);
			$("#show").text("물건명:"+name+",가격:"+price+",갯수:"+cnt);
		});
		$("#frm02 [type=button]").click(function(){	
			console.log($(this).val());
			$("[name=proc]").val($(this).val());
			$("#frm02").submit();
		});		
	});
</script>
<body>
	<h2 align="center"></h2>
	<form id="frm02">
		<input type="hidden" name="proc"/>
	<table align="center" class="listTable">
		<tr><th>물건명</th><td><input type="text" name="name1" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price1" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" >
			<input type="button" value="판매등록" />
			<input type="button" value="구매"/>
			</td></tr>
	</table>	
	</form>	
	<% 
	String name1 = request.getParameter("name1");
	String price1 = request.getParameter("price1");
	String proc = request.getParameter("proc");
	if(proc!=null){
	%>
	<h3 align="center">물건명:<%=name1%>, 가격:<%=price1%>, <%=proc%>처리</h3>
	<%} %>	
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>구매물품</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>가격</th><td>
				<select name="price">
					<%for(int price=1000;price<=10000;price+=1000){ %>
					<option><%=price%></option>
					<%}%>
				</select>
				</td></tr>
		<tr><th>갯수</th><td>
				<select name="cnt">
					<%for(int cnt=1;cnt<=10;cnt++){ %>
					<option><%=cnt%></option>
					<%}%>
				</select>		
				</td></tr>
		<tr><td colspan="2" style="text-align:center" id="show" ></td></tr>
	</table>	
	</form>
	<table id="empTab" align="center" class="listTable">
		<tr><th>사원번호</th><th>사원명</th><th>부서번호</th></tr>
		<tr class="list"></tr>
		<tr class="list"></tr>
		<tr class="list"></tr>
	</table>	
	<script>
		var elist = [
			{empno:7001,ename:'홍길동',deptno:10},
			{empno:7002,ename:'김길동',deptno:20},
			{empno:7003,ename:'신길동',deptno:30}
		];
		$("#empTab tr.list").html(function(idx){
			var emp = elist[idx];
			return "<td>"+emp.empno+"</td><td>"+emp.ename+"</td><td>"+emp.deptno+"</td>";
		});
	
	</script>
</body>
</html>