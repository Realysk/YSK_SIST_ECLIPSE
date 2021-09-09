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
# 정리문제
1. [jsp]directive 종류를 기술하세요
	<%@ page : 전체 페이지 설정(문서종류, session, 에러, import 등..)
	<%@ taglib : 새로운 태그를 정의해서 사용할 때 쓰임
	<%@ include : 포함될 내부페이지를 지정할 때, 사용
2. [jsp]script의 종류 3가지를 기술하고, 간단한 예제로 출력까지 하세요.
	<%! %> : declare 변수|상수, 메서드의 선언
	<%  %> : scriptlet 자바의 데이터 할당, 조건/반복문 등 프로세스 처리
	<%= %> : 화면에 출력할 변수/상수/메서더 리턴값을 선언할 때 사용.
3. [jsp]request와 response객체를 서버/클라이언트 관점에서 기술하세요.
	클라이언트(브라우저) <=====> 서버(톰캣)
	1. 서버(Web application server)에서 둘 다 코드로 수행되는 내용이다.
	2. request는 주로 클라이언트에서 요청하는 정보에 대한 처리를 한다.
		url 정보, 요청값, 서버로전달하는 cookie
	2. response는 주로 서버에 있는 내용을 클라이언트에 전달할 때, 사용된다.
		브라우저에 전달할 화면(html 태그 등), 클라이언트에 저장할 쿠키.
		기타 (파일, pdf, excel 전송 등)

4. 아래 내용은 어떤 filter선택자를 활용할 것인가를 기술하세요
    성별 :()남자()여자 [등록]  	
    	등록 클릭시, check가 된 값을 가져올 때
    	$("input[name=gender]:checked").val() :단일 내용
    관리자[   ] 일반사용자[    ] [관리자활성화][일반사용자활성화]
    	$("input[name=admin]:disabled").attr("disabled",""); 
    		: 비활성화 된것 활성화
    	$("input[name=normal]:enabled").attr("disabled","disabled") 
    		: 활성화 된 내용을비활성화 처리
    취미 :[]운동[]게임[]독서[]음악 [취미등록]
    	$("input[name=hobby]:checked") : 다중의 내용
    	for(var idx=0;idx<$("input[name=hobby]:checked").length;idx++){
    		// hobby의 checked가 된 것의 값을 가져오기 처리..
    		$("input[name=hobby]:checked").eq(idx).val()
    	}
    	
    
5. 아래와 같은 화면을 연산자를 선택시, 계산결과를 출력하는 프로그램을 만들세요.
    [    ][select연산자][     ]
    결과 :  @@ X @@ = @@
6. 학생의 성적이 리스트되는 화면에서 검색할 행(필터선택자 확인)의 배경색상을 
   표기해주는 프로그램을 작성하세요.(1단계-해당데이터td,2단계-해당포함tr)
    검색내용 [    ][검색]
    no  이름  국어 영어 수학
    1   @@@  @@  @@ @@@
    2   @@@  @@  @@ @@@
    3   @@@  @@  @@ @@@
7. 전날 다운 받은 이미지와 속성을 활용해서 해당 기능을 처리하세요
    [이미지]  [select-이미지변경][커져라][작아져라]

--%>
<%!
	String toDay;
%>
<%
	toDay = "오늘 성과있는 유익할 날 되길!!";
%>
<body>
	<h2 align="center"></h2>
	<h3 align="center"><%=toDay%></h3>
<%--
    [    ][select연산자][     ]
    결과 :  @@ X @@ = @@
--%>	
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("시작");
		$("[name=cal]").change(function(){ // <select name="cal"> 선택값이 변경..
			var num01 = Number($("[name=num01]").val());
			var num02 = Number($("[name=num02]").val());
			var calIdx = $("[name=cal]").val(); // 선택되어진 내용을 value값을 가져오기..
			var cal = $("[name=cal]>option:selected").text(); 
			// <option value="0"> + </option>에서  + :이부분은 text(),  value="0" 값을 가져오는 부분은 .val()
			// 사칙연산을 배열로 선언하고, 해당 선택한 index값을 가져와서 조건문 없이도 결과를 가져올 수 있다.
			var rs = [num01+num02,num01-num02,num01*num02,
						(num01/num02).toFixed(1)]; // toFixed(1) 소숫점 1자까지 보이게 처리
			if(cal!="연산자선택"){
				$("#calShow").text(num01+cal+num02+" = "+rs[calIdx]);
			}else{
				$("#calShow").text("");
			}
		})
		// 넓이와 폭을 전역변수로 설정..
		var wid=100;
		var hei=100;
		// select로 이미지를 선택했을 ..
		$("[name=chImg]").change(function(){
			// $(this).val() : 선택한 option의 value값을 가져온다.
			// ex) value="img01.PNG"
			// 이미지의 src 속성으로 해당 데이터를 할당 처리..
			<%-- 
			"<%=path%> :\jspexp\src\main\webapp로  서버상의 절대 위치를 가져온다.
			--%>
			$("img").attr("src","<%=path%>/z01_img/"+$(this).val());
		});
		$("#enlarge").click(function(){
			// 커져라 버튼 클릭시, 증가 처리 후, 다중의 속성값 지정 {속성1:속성1값, 속성2:속성2값}
			wid+=10; hei+=10;
			$("img").attr({width:wid,height:hei});
		});
		$("#ensmall").click(function(){
			// 작아져라 버튼 클릭시, 감소 후, 다중의 속성값 지정..
			wid-=10; hei-=10;
			$("img").attr({width:wid,height:hei});
		});
	});
</script>	
 	<p align="center">
		<img src="<%=path%>/z01_img/img01.PNG" width="100" height="100"/><br>
		<select name="chImg">
			<option value="img01.PNG">애완견1</option>
			<option value="img02.PNG">애완견2</option>
			<option value="img03.PNG">애완견3</option>
		</select>
		<input type="button" id="enlarge" value="커져라"/>
		<input type="button" id="ensmall" value="작아져라"/>
	</p>
	<form id="frm01">
	<table align="center" width="50%" class="listTable">
		<tr><th>
		<input type="text" name="num01" value="0" size="1"/>
		<select name="cal">
			<option value="-1">연산자선택</option>
			<option value="0"> + </option>
			<option value="1"> - </option>
			<option value="2"> * </option>
			<option value="3"> / </option>
		</select>
		<input type="text" name="num02" value="0" size="1"/>
		</th></tr>
		<tr><td id="calShow" style="text-align:center" ></td></tr>
	</table>	
	</form>
</body>
</html>