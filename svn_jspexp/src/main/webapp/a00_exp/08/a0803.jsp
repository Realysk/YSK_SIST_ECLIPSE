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
		document.querySelector("h3").innerText="로그인";
	}
</script>
</head>
<%-- 
# 정리문제
1. 액션태그 중, include, forward의 차이를 기술하세요!
	<jsp:include page="포함될페이지"/> : 한 화면에서 포함될 페이지를 처리
	<jsp:forward page="요청값을전달하고이동할페이지" /> : 요청값(key=value)을 함께 해당 페이지
		에 전달하면서 이동 처리..
2. 예외페이지 기본처리 형식을 파일로 기술하세요.
	예외가 발생할 가망성이 있는 페이지 : errorPage="에러가발생시처리페이지"
	에러가발생시처리페이지 : isErrorPage = "true"
	==> web.xml에서 전체 에러페이지 지정으로 처리가능.
3. 서버, 클라이언트의 관계에서 임시 저장 객체 두가지를 기술하고, 그 중 client에 저장될 때, 핵심
   코드를 기술하세요.
   클라이언트(브라우저) ==(request)=> 서버
   클라이언트(브라우저) <==(response)= 서버
   이러한 데이터 전송에 있어서, 서버와 클라이어트간에 연결된 상태(전제 조건)
   서버에 임시 데이터 저장 : session
   브라우저에 임시 데이터 저장 : cookie
   
4. ID:[   ][로그인] 요청값을 받아 조건문과 forward 액션태그를 이용해서, himan이면 
   main.jsp 아니면 login.jsp페이지로 이동하게하세요
5. 생성자 객체를 아이디, 패스워드, 이름, 기능메서드로 화면에 있는 테이블에 출력하게 선언하고,
   아이디[   ] 패스워드[    ] 이름[    ][등록] ==> 클릭시 하단 테이블에 생성자 객체의 메소드 show() 
   테이블					    출력
9:50까지 전달해주세요..

--%>
<%
	String id = request.getParameter("id");
%>
<body>
	<%
	if(id!=null){
		if(id.equals("himan")){
	%>
	<jsp:forward page="a0803_1.jsp"></jsp:forward>
	<%	}else{
	%>
		<script type="text/javascript">
			alert("로그인 실패!\n인증된 아이디가 아닙니다.");
		</script>
	<%
		}
	} 
	%>
	<h3 align="center"></h3>
	<form id="frm01">
	<table align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><td colspan="2"><input type="submit" value="로그인"/></td></tr>
	</table>	
	</form>

	<h4  align="center">5번 문제</h4>
	<table id="insFrm" align="center" class="listTable">
		<tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
		<tr><th>패스워드</th><td><input type="password" name="pass" value=""/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" onclick="reg()" value="추가"/></td></tr>
	</table>	
	<table id="showTab" align="center" class="listTable">
		<thead><tr><th>아이디</th><th>패스워드</th><th>이름</th></tr></thead>
		<tbody></tbody>
	</table>		
	<script type="text/javascript">
		function Member(id, pass, name){
			this.id = id;
			this.pass = pass;
			this.name = name;
			this.insert = function(){
				var tabAdd = document.querySelector("#showTab tbody");
				// el 태그와 충돌
				tabAdd.innerHTML +="<tr><td>"+this.id+"</td><td>"+this.pass+"</td><td>"+this.name+"</td></tr>";
			}
		}
		function reg(){
			var idVal = document.querySelector("#insFrm [name=id]").value;
			var passVal = document.querySelector("#insFrm [name=pass]").value;
			var nameVal = document.querySelector("#insFrm [name=name]").value;
			var m01 = new Member(idVal,passVal,nameVal);
			m01.insert();
		}
	</script>
</body>
</html>