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
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	div{display:inline}
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="연습예제";
	}
</script>
</head>
<%-- 
# 
정리문제
1. 요청값의 post방식과 get방식의 차이점을 기술하세요.
	location.href, a href로 url을 통해서 요청값을 전달하는 방식은
	모두, get방식
	<form> <form method="get"> ==> 요청값을 get방식으로 전달된다.
	get방식은 한정된 요청값을 url로 전송하는 방식을 말한다.
	<form method="post"> ==> 요청값을 post방식으로 전달된다.
	요청값에 대한 제한이 없고, 요청 body안에 내부적으로 전달되어 url에는
	표시되지 않는다.
	

2. 아래와 같은 도서구매 시스템을 post방식으로 처리하세요.(한페이지처리)
    도서명 [     ] 가격 [    ] 수량 [    ] [구매] 
    ==> 구매한 도서 @@@ 총비용 @@ 할인 15% 후, 금액 @@@@
    1) 화면구현
    2) 초기화면/요청값 후 처리를 요청값으로 분리(request.getParameter())
    3) 숫자형 변환 처리, 로직처리..
    
    
3. 사원 정보 등록 처리 프로세스을 파일명과 요청값처리, js, dao 핵심 코드위주로
   기술하세요.
   	1) 전체 화면 및 파일 : 
   		조회리스트(a28_empList.jsp)
   		등록화면(a29_empInsert.jsp)
   	2) 화면이동처리
   		조회리스트 ==> 등록화면
   			등록버튼 클릭시, 등록화면이동.
   			input onclick="insertFrm()"
   			function insertFrm(){
   				location.href="등록화면";
   			}
   		등록화면에서 등록처리(2개의 프로세스 처리) 
   			- 1) 초기화면과 
   			[jsp]데이터입력후, input type="submit" 버튼클릭시,
   			- 2)등록 후 처리 proc
   			[jsp]String ename = request.getParameter("ename"); //입력값을 받음.
   			[jsp]등록 dao에 기능 메서드의 매개변수로 할당하기 위한 객체 생성
   				Emp ins = new Emp(0,ename,job, .....);
   			[dao.java]Dao에 입력 처리 기능메서드 추가. public void insertEmp(Emp ins)
   				sql 작성(insert into emp02 values(emp_seq.nextval,?,?,?,?..)
   				pstmt.setString(1, ins.getEname());	
   			[jsp]
   			    if(ename!=null)
   					Dao 객체 생성 : 
   					기능메서드 호출  : dao.insertEmp(ins);
   					isInsert = true;
   				등록완료 js 처리
   					var isInsert = <%=isInsert%>		
   					if(isInsert){
   						등록 성공, 조회페이지이동 처리
   					}
   				
   				
   
   
   
   
   
   
4. 회원정보 관리시스템을 기존 member테이블을 활용하여 진행하되, 
전체리스트에서 등록처리화면로 처리하세요. (회원리스트화면, 등록처리화면, dao 등록)
	1) 주요기능 파일
	회원조회리스트(a0729_1_memberList.jsp)
	회원등록처리(a0729_2_memberInsert.jsp)
	데이터처리Dao(A05_PreparedDao.java)
		회원조회메서드(getMemberList())
		회원등록메서드(insertMember(Member ins))
	2) 핵심처리내용
	- 페이지 전환 : 이벤트 속성으로 함수호출과 location.href="이동할페이지";
	- 요청값 처리 : name="요청키" request.getParameter("요청키")
				submit, post방식
				초기화면과 분리 if(요청변수!=null)
	- dao 처리 : sql 확인, 메서드 선언(입력값, 리턴값),
		?,?,? ==> pstmt.setXXXX(1,데이터)
		 ==> 결과값 있을 때, rs.next() rs.getXXX("컬럼명")
	- 화면에서 dao 호출 및 기능 메서드 처리 
		초기화면과 요청값이 왔을 때, 조건 처리
		if(요청변수!=null)
			Dao객체 생성, 기능메서드 호출 및 매개변수로 입력 객체 전달
			dao.insertMember(ins);
		js로 등록완료 처리..


5. 아래와 같은 임의의 구구단 문제를 10문제 리스트하고, 현재페이지에 post방식을 전달하여 
   최종 점수를 출력하세요.
    번호  문제     정답
    1    2 * 5  [   ]
    2    4 * 3  [   ]
    3    6 * 5  [   ]
	...
        [시험완료] ==>  @@ 점.
--%>
<%
	int point = 0;
	String num01S = request.getParameter("num01_1");
	for(int no=1;no<=10;no++){
		num01S = request.getParameter("num01_"+no);
		String num02S = request.getParameter("num02_"+no);
		String replyS = request.getParameter("reply_"+no);
		if(num01S!=null){ // 초기값이 아님
			int num01 = Integer.parseInt(num01S);
			int num02 = Integer.parseInt(num02S);
			int reply = Integer.parseInt(replyS);
			if(num01*num02==reply){
				point+=10;
			}
		}
	}
%>
<%--
String names[]=request.getParameterValues("다수name")
동일한 name값이 여러개일 때
 --%>
<body>
	<h3 align="center"></h3>
	<h4 align="center">요청값처리(post)</h4>
	<%
	// 
	//String num01
	%>
	
	<form id="frm02" method="post">
	<table>
		<tr><th>번호</th><th colspan="3">문제</th><th>정답</th></tr>
		<%
		for(int no=1;no<=10;no++){
			int ran01 = (int)(Math.random()*8+2);
			int ran02 = (int)(Math.random()*9+1);
			//int corrpl = num01*num02;
			%>
			<tr><td><%=no%></td>
				<td ><input type="text" name="num01_<%=no%>" size="1" 
						value="<%=ran01%>"/>
				</td>
				<td>X</td>
				<td><input type="text" name="num02_<%=no%>" size="1" 
						value="<%=ran02%>"/>
					<%-- <input type="hidden" name="corrpl" value="<%=corrpl%>"/>--%>
				</td>
				<td><input type="text" name="reply_<%=no%>" size="2" value="0"/></td>
				</tr>
		<%}%>	
		<tr><td colspan="5">
			<input type="submit" value="시험완료"/></td></tr>
			<%-- 클릭시, 요청값으로 입력한 답과 정답을 전달하여야 정답 여부를 처리할 수 있다.
			 --%>
	</table>	
	</form>
	<%if(num01S!=null){%> <%-- 시험 완료클릭시 --%>
	<h4 align="center">획득 점수:<%=point%></h4>
	<%}%>

	<form id="frm01" method="post">
	<%--도서명 [     ] 가격 [    ] 수량 [    ] [구매]  --%>
	<table>
		<tr><th>도서명</th><td><input type="text" name="bname" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>수량</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="구매"/></td></tr>
	</table>	
	</form>
	<%
	String bname = request.getParameter("bname");
	String priceS = request.getParameter("price");
	String cntS = request.getParameter("cnt");
	if(bname!=null){
		int price = Integer.parseInt(priceS);
		int cnt = Integer.parseInt(cntS);
	%>	
	<h4>구매한 도서 <%=bname%> 총비용 <%=price*cnt%>원 할인 15% 후, 
		금액 <%=(int)(price*cnt*0.85)%>원</h4>
	<%}%>
</body>
</html>