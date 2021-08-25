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
# ex_ 로그인 화면 구성해서, bean으로 요청값을 받아 dao를 호출하여 데이터가
   있으면 session bean에 등록되게 처리하세요.

--%>
   <jsp:useBean id="mem" class="jspexp.z02_vo.Member" scope="session"/>
   <jsp:setProperty property="*" name="mem"/>
   <jsp:useBean id="dao" class="jspexp.z01_database.A05_PreparedDao" scope="session"/>

   <%
      if(mem.getId()!=null){
         log(mem.getId()+":"+ mem.getPass());
         // 요청값으로 받아서 bean에 데이터를 담은 후.. mem에 할당처리
         mem = dao.login2(mem.getId(), mem.getPass());
         session.setAttribute("mem",mem);
      }
   %>
<script type="text/javascript">
   $(document).ready(function(){
      var name = "${mem.name}";
      if(name!=""){
         alert("로그인 성공\n세션설정");
      }
      $("h2").text("로그인(bean)");
   });
</script>
<body>

   <h2 align="center"></h2>
   <form id="frm01" method="post">
   <table align="center" class="listTable">
      <tr><th>아이디</th><td><input type="text" name="id" value=""/></td></tr>
      <tr><th>패스워드</th><td><input type="password" name="pass" value=""/></td></tr>
      <tr><td colspan="2" style="text-align:center" ><input type="submit" value="로그인"/></td></tr>
   </table>   
   </form>

   <h3 align="center">현재 세션 내용</h3>
   <h3 align="center" onclick="location.href='a06_showSession.jsp'">다른 페이지에서 session 확인</h3>
      <table align="center" class="listTable">
      <tr><th>아이디</th><td>${mem.id }</td></tr>
      <tr><th>패스워드</th><td>${mem.pass }</td></tr>
      <tr><th>이름</th><td>${mem.name }</td></tr>
      <tr><th>권한</th><td>${mem.auth }</td></tr>
      <tr><th>포인트</th><td>${mem.point }</td></tr>
   </table>
<%

 	pageContext.setAttribute("bcnt", 19);
   	request.setAttribute("bprice", 15000);
   	session.setAttribute("bname", "자바의정석"); 
   	application.setAttribute("bwriter", "바른글");
%>   
   

   <table  align="center" class="listTable">
      <tr><th>도서명</th><th>도서가격</th><th>도서갯수</th><th>출판사</th></tr>
      <tr><td>${sessionScope.bname }</td><td>${requestScope.bprice }</td>
         <td>${pageScope.bcnt }</td><td>${bwriter }</td></tr>
   </table>   
<%
	// p01이라는 이름으로 객체를 할당..
	request.setAttribute("p01", new Person("홍길동",25,"서울신림")); 
%>  
	${p01.setName('김유신')} ${p01.setAge(31)} <%-- el을 통한 변경이 가능하다. --%>
	<h3 align="center">객체로 할당.</h3>
	   <table  align="center" class="listTable">
	   <%-- property 개념으로 해당 객체에 할당된 데이터를 확인할 수 있다. --%>
	      <tr><th>${p01.name}</th><th>${p01.age}</th>
	      	<th>${p01.loc}</th></tr>
	   </table> 	
<%-- ex)
	session범위로 객체로 물건명, 가격, 갯수를 할당하고
	가격을 el로 인상하고 10%
	출력처리하세요   4조, 전체(손들기)

--%>	      
<%
	session.setAttribute("p02",new Product("사과",3000,5));
%>
   ${p02.setPrice(p02.price*1.1)}
   <h3 align="center">객체의 구매 정보 내용 확인.</h3>
   <table align="center" class="listTable">
      <tr><th>물건명</th><th>${p02.name }</th></tr>
      <tr><th>가격</th><th>${p02.price }</th></tr>
      <tr><th>갯수</th><th>${p02.cnt }</th></tr>
   </table>
<%
	// 배열형 데이터 처리.
	request.setAttribute("array01", new String[]{"사과","바나나","딸기"});
	//  ArrayList 형 데이터 처리
	List<Product> list = new ArrayList<Product>();
	list.add(new Product("사과",3000,2));
	list.add(new Product("바나나",4000,3));
	list.add(new Product("딸기",12000,5));
	request.setAttribute("list", list);

%>   
   <h3 align="center">리스형 배열 데이터 처리.</h3>
   <table align="center" class="listTable">
      <tr><th>array01</th><th>${array01[0]},${array01[1]},${array01[2]}</th></tr>
      <tr><th>list</th><th>${list.get(0).getName()}</th></tr>
      <tr><th>list</th><th>${list.get(1).getPrice()}</th></tr>
      <tr><th>list</th><th>${list.get(2).getCnt()}</th></tr>
   </table>  
 <%--
 ex) 부서정보 ArrayList<Dept>로 할당하여 el로 호출하여 출력하세요.. 5조, 전체손들기 
 
  --%> 
     <%
       ArrayList<Dept> dlist = new ArrayList<Dept>();
       dlist.add(new Dept(10,"si","서울신림"));
       dlist.add(new Dept(20,"기획","서울신림"));
       dlist.add(new Dept(30,"회계","서울마포"));
       dlist.add(new Dept(40,"개발","서울강남"));
       request.setAttribute("dlist", dlist);
    %>
    <table>
       <tr><th>부서번호</th><th>부서명</th><th>위치</th></tr>
       <tr><td>${dlist.get(0).deptno}</td><td>${dlist.get(0).dname}</td><td>${dlist.get(0).loc}</td></tr>
       <tr><td>${dlist.get(1).deptno}</td><td>${dlist.get(1).dname}</td><td>${dlist.get(1).loc}</td></tr>
       <tr><td>${dlist.get(2).deptno}</td><td>${dlist.get(2).dname}</td><td>${dlist.get(2).loc}</td></tr>
       <tr><td>${dlist.get(3).deptno}</td><td>${dlist.get(3).dname}</td><td>${dlist.get(3).loc}</td></tr>
    </table> 

</body>
