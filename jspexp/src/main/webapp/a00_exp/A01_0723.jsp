<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="jspexp.z02_vo.*"
   	import="java.util.*"
   	import="jspexp.z01_database.*"
%>
<%
//   import="jspexp.z02_vo.*" : VO 객체 import
//   import="jspexp.z01_database.*" : DAO import 
//   import="java.util.*" : 내장 객체 import

   request.setCharacterEncoding("utf-8");
   String path = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>

	li{float:left;}

</style>
<script type="text/javascript">
   window.onload=function(){
      document.querySelector("h3").innerText="07.23 정리 문제";
   };

</script>
</head>
<body>
<%--
   1. 아래 내용을 JSP로 출력하세요.
      1) 반복문 1~4 선언 후 테이블 행(4X1)과 열(1X4)로 출력하세요.
      
         --%>
            <h3></h3>
         	<h4> [1-1] : 4X1, 1X4 테이블 만들기 </h4>            
            <table>
            <%for(int cnt=1; cnt<=4; cnt++) { %>
               <tr>
                  <td><%=cnt %></td>
                  <td><%=cnt %></td>
                  <td><%=cnt %></td>
                  <td><%=cnt %></td>
               </tr>
            <% } %>
            </table><br>
         <%--
      
      2) 배열로 무지개색상 선언 후 h2로 7개의 무지개 배경색상으로 문자열과 함께 출력하세요.
      
         --%>
         	<h4> [1-2] : 무지개 출력 </h4>
            <% for(int cnt=1; cnt<=7; cnt++) { %>
            <h2 id="rainbow" style="background-color:red; text-align:center;">무지개</h2>
            <% } %><br>      
         <%--      
      
      3) 아래와 같은 형식을 반복문을 활용하여 form하위 요소객체를 이용하여 테이블과 함께 출력하세요.
         선택      물건명   가격      수량
         []      [  ]   [  ]   [select(1~10)]
         []      [  ]   [  ]   [select(1~10)]
         []      [  ]   [  ]   [select(1~10)]
         
         --%>
			   <h4> [1-3] : 물건 정보 form 만들기 </h4>
			   <br>    
         <%--
         	
         	회원가입
         	아이디 : [   ] => 타이틀은 배열로 선언하여 for 0~4로 선언하여 화면을 출력하세요.
         	패스워드 : [   ]
         	이름 : [   ]
         	포인트 : [   ]
         	
         	--%>
         		<h4> [1-3-2] : 회원가입 form 만들기 </h4>
         		<%
         		String titles[] = {"ID", "PW", "이름", "포인트"};
         		%>
         		<table>
         			<%
         			for(int idx=0; idx<titles.length; idx++) {
         			%>
         			<tr>
         				<th><%=titles[idx] %></th>
         				<td><input type="<%=idx==1 ? "password":"text"%>"/></td>
         				<%-- 3항 연산자 활용 :  --%>
         			</tr>
         			<% } %>
         		</table><br>
         	<%--      
         
       4) ArrayList<String>으로 메뉴리스트를 선언하고, ul하위에 li안에 a link로 메뉴로 출력하세요.
       
         --%>
         	<h4> [1-4] : ArrayList로 메뉴 링크 만들기 </h4>
			<%
				// Arrays.asList(데이터유형1, 데이터유형2)
				List<String> mlist = Arrays.asList("로그인","식료품","의류","공산품","관리자");
			%>
			<ul type="none">
				<%
				for(String menu:mlist) { %>
				<li><a href="#"><%=menu %></a>&nbsp;&nbsp;&nbsp;</li>
				<% } %>
			</ul><br>
         <%--    
       
       5) 회원 VO를 Member(아이디,패스워드,이름,권한,포인트)로 만들고, 회원리스트 ArrayList<Member>로 회원 5명 등록하고, 테이블 리스트로 출력처리하세요.
       
         --%>
         	<h4> [1-5] : VO 호출하여 ArrayList로 회원 리스트 호출 </h4>
             <%
               //ArrayList<Member> mem = new ArrayList<Member>();
               //mem.add(new Member("himan","1111","홍길동","사용자",1000));
               //mem.add(new Member("badman","2222","김길동","사용자",4000));
               //mem.add(new Member("goodjob","3333","마길동","관리자",2000));
               //mem.add(new Member("badgirl","4444","신길동","관리자",7000));
               //mem.add(new Member("heyman","5555","고길동","사용자",6000));
               
               List<Member> mem = Arrays.asList(
            		   		new Member("himan","1111","홍길동","사용자",1000),
            		   		new Member("badman","2222","김길동","사용자",4000),
            		   		new Member("goodjob","3333","마길동","관리자",2000),
            		   		new Member("badgirl","4444","신길동","관리자",7000),
            		   		new Member("heyman","5555","고길동","사용자",6000)
            		   );
             %>
            <script>
            	function upt(id) {
            		alert("수정할 ID : " + id);
            	}
            </script>
            <table>
               <tr><th> 전체선택 </th><th> ID </th><th> PW </th><th> 이름 </th><th> 권한 </th><th> 포인트 </th><th> 수정 </th></tr>
               <%for(Member m:mem) { %>
               <tr>
                  <td><input type="checkbox" name="ch" value="<%=m.getId()%>"/></td>
                  <td><input type="text" name="id" value="<%=m.getId()%>"/></td>
                  <td><input type="text" name="pw" value="<%=m.getPw()%>"/></td>
                  <td><input type="text" name="name" value="<%=m.getName()%>"/></td>
                  <td><input type="text" name="auth" value="<%=m.getAuth()%>"/></td>
                  <td><input type="text" name="point" value="<%=m.getPoint()%>"/></td>
                  <td><input type="button" name="upt" onclick="upt('<%=m.getId()%>')" value="수정"/></td>
                  <%-- 수정 할 항목 대입 --%>
               </tr>
               <% } %>
            </table><br>         
         <%--       
       
       6) 반복문과 조건문을 활용하여 번호가 있는 4X4테이블을 출력하세요.
       
         --%>
         	<h4> [1-6] : 반복문과 조건문 활용하여 번호가 있는 4X4 테이블 만들기 </h4>
            <table>
            <%for(int cnt=1; cnt<=4; cnt++) { %>
               <tr>
                  <td><%=cnt %></td>
                  <td><%=cnt %></td>
                  <td><%=cnt %></td>
                  <td><%=cnt %></td>
               </tr>
            <% } %>
            </table><br>
         <%--       
       
   2. 학번 이름 국어 영어 수학 형식으로 출력할 내용을 테이블로 설계를 하고 데이터를 입력후 기존 dao(전날)에 출력 list하는 메서드를 만든 후, jsp 화면으로 출력처리하세요.

         --%>
         	<h4> [2] : DB 연동 후 DAO 호출 </h4>
            <%
               StudentDAO dao = new StudentDAO();
               ArrayList<Studentexp1> stulist = dao.getStuList();
            %>
         
            <table>
               <tr><th> 학번 </th><th> 이름 </th><th> 국어 </th><th> 영어 </th><th> 수학 </th><th> 평균 </th></tr>
               <%
               	int tot=0;
               	for(Studentexp1 s:dao.getStuList()) {
               		int avg = (s.getKor() + s.getEng() + s.getMath()) / 3;
               		tot += avg;
               	%>
               <tr>
                  <td><%=s.getSno() %></td>
                  <td><%=s.getName() %></td>
                  <td><%=s.getKor() %></td>
                  <td><%=s.getEng() %></td>
                  <td><%=s.getMath() %></td>
                  <td><%=avg%></td>
               </tr> 
               <% } %>
               <tr><td colspan="5"> 전체 평균 </td><td><%=tot/dao.getStuList().size() %>
            </table>
         <%--
 --%>
</body>
</html>