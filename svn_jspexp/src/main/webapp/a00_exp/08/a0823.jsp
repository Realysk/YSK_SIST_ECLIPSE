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
# 
# 정리문제
1. [jquery] filter()의 사용형식과 end()기능메서드의 의미를 기술하세요.
	$("선택자").filter("선택자|가상선택").적용기능메서드();
	$("선택자").filter(function(idx, ele){ return boolean값;}.적용기능메서드();
		해당 선택자 중에, 다시 선택자|가상선택자에 해당하는 객체나 
		callback함수를 적용하여 boolean값이 true인경우 이후에 나타나는 적용기능메서드처리. 
	$("선택자").메서드1().메서드2().end().메서드3().메서드4()
	선택자 이후 메서드는 해당 선택자에 중첩적으로 적용된다.
	end()메서드가 처리되는 경우에 해당 선택자의 중첩적 적용을 중단하고 초기 선택자에
	다시 적용메서드를 이후에 처리할 때, 활용된다. 
2. [jquery] event.target의 활용하는 기본예제를 기술하세요.
		$("h2").text("시작클릭!!").click(function(){
			$("div").append("<h3>안녕!!!</h3>");
		});
		$("div").click(function(event){
			if($(event.target).is("h3")){
				$(event.target).css("background","orange");
			}
			
		});
3. [jquery] 버튼을 클릭시, 하단에 h3가 추가되고, h3를 클릭시, 배경색상이 변경되게 처리하세요.
		$("div").click(function(event){
			$(this).find($(event.target)).css("background","yellow");
		});	

4. [jquery] 계층 구조 메서드를 기술하세요.
   1) children("자식중선택자")
   2) parents() : 상위계층 객체들.ex) parents("선택자") : 상위 계층 중에 특정한 선택자를 요소객체로 선택.
      parent() : 바로 상위 부모객체
   3) next() : 형제(같은 부모 요소객체를 둔 같은 level에 있는 요소객체)중에 다음 요소객체지정
   4) prev() : 형제(같은 부모 요소객체를 둔 같은 level에 있는 요소객체)중에 앞선 요소객체지정
   5) siblings() : 형제요소객체들 지정.
5. [jsp] 액션 태그 <jsp:include><jsp:forward>의 차이점을 기술하세요.
   # <jsp:include> 액션 태그
   1) 다른 jsp페이지의 실행 결과를 현재 위치에 삽입한다.
   2) 기본형식
      <jsp:include page="포함된 페이지" flush="true/false"/>
         <jsp:param name="param1" value="value1"/>
         <jsp:param name="param2" value="value2"/>
         
      flush : 지정한 jsp 페이지를 실행하기 전에 출력 버퍼를 플러시한 지의 여부를 지정한다.
      true이면 출력 버퍼를 플러시하고, false이면 하지 않는다.
      해당 페이지에 param1=value1&param2=value2 형식으로 매개데이터를 전달할 수 있다.
   # jsp:forward
   1) 해당 페이지로 요청값과 함께 이동 처리된다.
   2) request 요청값은 함께 이동 처리된다.
   3) 기본 형식
      <jsp:forward page="이동할페이지"/>


6. [jsp] 위 액션 태그를 활용하서 메뉴별 페이지가 이동되게 처리하세요.
         <th>메뉴</th>
         <td>
            <select name="menu">
               <option value="">권한선택</option>
               <option value="a0823_page1.jsp">메뉴1</option>
               <option value="a0823_page2.jsp">메뉴2</option>
               <option value="a0823_page2.jsp">메뉴3</option>
            </select>
         </td>
      $("[name=menu]").change(function(){
         $("form").submit();
      });
	<%
	String goPage = request.getParameter("menu");
   if(goPage!=null&&!goPage.equals("")){
   %>
   <jsp:forward page="<%=goPage %>"/>
   <%} %>
7. [jsp] 에러 코드와 클래스별 예외 처리를 web.xml(서버)단위로 처리하는 것을 기술하세요.
	1. 페이지별 예외 처리
		에러페이지 지정 :errorPage="예외발생시처리할페이지"
		에러페이지 작성 : isErrorPage="true"
			exception.getMessage(), exception.printStackTrace()
	2. 웹서버 전체적으로 에러 지정.
	web.xml
	1) 에러 코드별 지정.
		<error-page>
			<error-code>에러코드</error-code>
			<location>에러페이지</location>
	2) 에러 클래스 지정.
		<error-page>
			<exception-type>에러클래스</exception-type>
			<location>에러페이지</location>				
8. [jsp] 쿠키를 활용하여, 물건을 카트에 담고, 삭제 처리하게 하세요.
9. [jsp] 세션값의 설정과 할당을 List<VO>로 설정되게 하세요.
10. [jsp] 해당 기능 버턴을 클릭시, 세션값이 없을 때, 로그인 페이지로 이동되게 처리하세요.

	// 초기화면에 session id가 없으면 로그인하라고 뜨고..
	if("${id}"==""){
		alert("로그인이 필요합니다.\n로그인 페이지 이동")
		location.href="a06_login.jsp";
	}else{ 
		// session 값이 있을 때는 정상 프로세스 처리..
		// ${param.proc} == request.getParameter("proc")
		if("${param.proc}"=="insert") alert("등록처리수행");
		if("${param.proc}"=="update") alert("수정처리수행");
	}	
	$(document).ready(function(){
		// session 값은 el로 받아서 있을 때는 로그인 중..
		$("h2").text("${id}님 로그인중");
		// 기능 버튼을 클릭시,  insert/update 프로세스 처리
		$("#regBtn").click(function(){
			$("[name=proc]").val("insert");
			$("form").submit();
		});
		$("#uptBtn").click(function(){
			$("[name=proc]").val("update");
			$("form").submit();
		});		
	});	
</script>
<body>
	<h2 align="center"></h2>
	<form method="post">
		<input type="hidden" name="proc"/>
	</form>
	<table align="center" class="listTable">
		<tr><td colspan="2" style="text-align:center" >
		<input type="button" id="regBtn" value="등록"/>
		<input type="button" id="uptBtn" value="수정"/></td></tr>
	</table>

--%>
<%

%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작클릭!!").click(function(){
			$("div").append("<h3>안녕!!!</h3>");
		});
		/*
		$("div").click(function(event){
			if($(event.target).is("h3")){
				$(event.target).css("background","orange");
			}
			
		});
		*/
		$("div").click(function(event){
			$(this).find($(event.target)).css("background","yellow");
		});		
	});
	
</script>
<body>
	<h2 align="center"></h2>
	<div>
	
	</div>
	<%
	ArrayList<String> fruits = new ArrayList<String>();
	String[] ranFruit = {"사과","바나나","딸기","오렌지","수박"};
	if(session.getAttribute("fruits")!=null){
		fruits = (ArrayList<String>)session.getAttribute("fruits");
	}
	fruits.add(ranFruit[(int)(Math.random()*5)]);
	session.setAttribute("fruits", fruits);
	%>
	<h3 align="center">세션 List</h3>	
	<table  align="center" class="listTable">
		<tr><th>물건명</th></tr>
		<%for(String fruit:fruits){ %>
		<tr><td><%=fruit%></td></tr>
		<%} %>
	</table>	
		
	
</body>
</html>