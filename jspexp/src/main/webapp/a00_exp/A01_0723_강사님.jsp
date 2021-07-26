<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="jspexp.z02_vo.*"
    import="jspexp.z01_database.A05_PreparedDao"
    
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
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="연습문제!!";
	};

</script>
</head>
<%--
# 정리문제
1. 아래내용을 jsp로 출력하세요.
    1) 반복문 1~4선언하고, 테이블행(4X1)과 테이블열(1X4)로 출력하세요.
    2) 배열로 무지개색상 선언, h2로 7개의 무지개 배경색상으로 문자열과 함께 출력
    3) 아래와 같은 형식을 반복문을 활용하여 form하위 요소객체를 이용하여 테이블과 함께 출력하세요
        선택 물건명   가격  갯수
        []  [   ]  [  ] [select(1~10)]
        []  [   ]  [  ] [select(1~10)]
        []  [   ]  [  ] [select(1~10)]
    4) ArrayList<String>으로 메뉴리스트를 선언하고, ul하위에 li안에 a link로 메뉴로 출력하세요.
    5) 회원 VO를 Member(아이디,패스워드,이름,권한,포인트)로 만들고, 회원리스트 ArrayList<Member>로
        회원 5명 등록하고, 테이블 리스트로 출력처리하세요.
    6) 반복문과 조건문을 활용하여 번호가 있는 4X4테이블을 출력하세요.
2. 학번 이름 국어 영어 수학 형식으로 출력할 내용을 테이블로 설계를 하고, 데이터를 입력후,
    기존 dao(전날)에 출력 list하는 메서드를 만든 후, jsp 화면으로 출력처리하세요.
 --%>
<style>li{float:left;}</style>
<%--
# DB 처리 화면 구성
1. db 구조 만들기, 데이터 입력, sql 작성
2. vo만들기
3. Dao, 기능메서드 구현
4. 화면에서 호출 출력.
 --%>
<body>
<%--
<%
	A05_PreparedDao dao = new A05_PreparedDao();

%>
	<h4>학생 성적 리스트</h4>
	<table>
		<tr><th>학생번호</th><th>학생명</th><th>국어</th><th>영어</th><th>수학</th><th>평균</th></tr>
		<%
		int tot=0;
		for(Student s:dao.getStudents()){
			int avg = (s.getKor()+s.getEng()+s.getMath())/3;
			tot+=avg;
		%>
		<tr><td><%=s.getSno()%></td><td><%=s.getName()%></td>
			<td><%=s.getKor()%></td><td><%=s.getEng()%></td>
			<td><%=s.getMath()%></td><td><%=avg%></td>
		</tr>
		<%
		}%>
		<tr><td colspan="5">전체평균</td><td><%=tot/dao.getStudents().size() %></td></tr>
	</table>

	<h4>회원등록리스트</h4>
	<%
	List<Member> memlist = Arrays.asList(
			new Member("himan","7777","홍길동","관리자",1000),
			new Member("higirl","8888","홍리나","일반사용자",2000),
			new Member("goodMan","9999","김철희","관리자",1000),
			new Member("ohMyLover","555","신현숙","방문객",1200)
	);
// 	
	%>
	<script>
		function upt(id){
			alert("수정할 id:"+id);
		}
	</script>

	<table>
		<tr><th>전체선택</th><th>아이디</th><th>패스워드</th><th>이름</th>
			<th>권한</th><th>포인트</th><th>수정</th></tr>
		<%
		for(Member m:memlist){
		%>
		<tr>
			<td><input type="checkbox" name="ch" value="<%=m.getId()%>"/></td>
			<td><input type="text" name="id" value="<%=m.getId()%>"/></td>
			<td><input type="text" name="pass" value="<%=m.getPass()%>"/></td>
			<td><input type="text" name="pass" value="<%=m.getName()%>"/></td>
			<td><input type="text" name="auth" value="<%=m.getAuth()%>"/></td>
			<td><input type="text" name="point" value="<%=m.getPoint()%>"/></td>
			<td><input type="button" name="upt" onclick="upt('<%=m.getId()%>')"
				 value="수정"/></td>
		</tr>
		<%
		}
		%>
	</table>
	 --%>

	<%
	// Arrays.asList(데이터유형1, 데이터유형2)
	List<String> mlist = Arrays.asList("로그인","식료품","의류","공산품","관리자");
	%>
	<ul type="none">
		<%
		for(String menu:mlist){%>
		<li>	<a href="#"><%=menu%></a>&nbsp;&nbsp;&nbsp;	</li>
		<%
		}
		%>
	</ul><br>


	<%-- jsp ==> java(servlet) ==> class ==> 실행 결과 ==> html ==> 네트웍을 통해 클라이언트에 전달. --%>
	<h4>form요소객체 처리..</h4>
	<table>
		<tr><th>선택</th><th>물건명</th><th>가격</th><th>갯수</th></tr>
		<%for(int idx=0;idx<3;idx++){%>
		<tr>
			<td><input type="checkbox"/></td>
			<td><input type="text"/></td>
			<td><input type="text"/></td>
			<td>
				<select>
					<%for(int cnt=1;cnt<=10;cnt++){ %>
					<option><%=cnt%></option>
					<% }%>
				</select>
			</td>
		</tr>
		<%}%>
	</table>
	<%--
	회원가입
	아이디 : [    ]  ==> 타이틀은 배열로 선언하여 for 0~4로 선언하여 화면을 출력하세요
	패스워드 : [    ]	   2조  ~15:15
	이름 : [   ]
	포인트 : [   ]
	--%>
	<h2>회원 가입</h2>
	<%
	String titles[]={"아이디","패스워드","이름","포인트"};
	%>
	<table>
		<%
		for(int idx=0;idx<titles.length;idx++){
		%>
		<tr>
			<th><%=titles[idx] %></th>
			<td><input type="<%=idx==1?"password":"text"%>"/></td>
			<%--3항연산자 활용:  --%>
		</tr>	
		<%
		}
		%>
	</table>
	
	
	
	
	<select>
		<%for(int cnt=1;cnt<=10;cnt++){ %>
		<option><%=cnt%></option>
		<% }%>
	</select>




	<h4>레인보우</h4>
	<%
	String[]colors = {"red", "orange", "yellow", "green", "blue", "navy", "purple"};
	for(String color:colors){
	%>
	<h2 style="background-color:<%=color %>" align="center"><%=color %></h2>
	<%}%>


	<h3></h3>
	<h4>4X1테이블</h4>
	<table>
		<%for(int cnt=1;cnt<=4;cnt++){ %>
		<tr><td><%=cnt%></td></tr>
		<%}%>
	</table>
	<h4>1X4테이블</h4>
	<table>
		<tr>
		<%for(int cnt=1;cnt<=4;cnt++){ %>
		<td><%=cnt%></td>
		<%}%>
		</tr>
	</table>	
	<h4>4X4테이블</h4>
	<table>
		<%for(int row=1;row<=4;row++){ %>
		<tr>
			<%for(int col=1;col<=4;col++){ %>
			<td><%=row%>행, <%=col%>열</td>
			<%}%>
		</tr>
		<%} %>
	</table>		
	
	
	<br>
	<%--
	ex) 2X3 테이블만들기, 4X3테이블(1~12표시)  1조 진행
	 --%>
	<table>
      	<%for(int row=1;row<=2;row++){ %>
      	<tr>
         	<%for(int col=1;col<=3;col++){ %>
         	<td><%=row%>행, <%=col%>열</td>   
         	<%} %>
      	</tr>
      <%} %>
   </table>
   
   	<table>
   	<% 
   		int cnt=1; 
   		for(int row=1;row<=4;row++){ 
   	%>
      	<tr>
         	<%
         	for(int col=1;col<=3;col++){ 
         	%>
         	<td><%=cnt++%></td>            
         	<% 
         	} 
         	%>
      	</tr>      
    <% 
    	} 
    %>
   </table>		

</body>
</html>