<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.sql.*"
	import="java.util.*"
%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Games</title>
<link rel="stylesheet" href="<%=path%>/games/main_nav.css"/>

<script>
</script>

<style type="text/css">
	
	html, body{color:white; text-align:center;}
	header {width:0%; height:0%; background:yellow;}
	section {width:70%; height:70%; float:left;}
	aside {width:15%; height:70%; float:left;}
	footer {width:100%; height:15%; clear:both; float:center;}
	.cart-wrapper {width:100%; text-align:center;}
	.cartmargin {margin-top:3%; margin-bottom:2%;}
	
</style>

</head>
<body>
	
  <header></header>

  <nav class="navbar">
    <div class="nav-wrapper">
      <ul class="logo">
        <li><a href="../main_nav.html">Games</a></li>
      </ul>
      <form class="search_bar" method="post">
        <input type="text" id="input">
        <input type="submit" id="btn" value="검색"/>
      </form>
    </div>
    
    <div class="menu-wrapper">
      <ul class="menu">
        <li><a href="#">로그인</a></li>
        <li><a href="#">회원가입</a></li>
        <li><a href="cart.jsp">장바구니</a></li>
        <li><a href="#">마이페이지</a></li>
      </ul>
    </div>
  </nav>
  
  <nav class="navbar2">
	   <ul class="side_menu1">
	        <li><a href="#"><b>게임</b></a></li>
	        <li><a href="#"><b>공지사항</b></a></li>
	        <li><a href="#"><b>고객지원</b></a></li>
	   </ul>
   </nav>
   
   <aside class="aside01"><h3> 왼쪽 aside 영역표시 </h3></aside>
   
   <section>
   		<form id="frm01" action="cart.jsp" method="post">
	   		<div class="cartmargin">
	   			<h1 style="text-align:left;"> 마이페이지 </h1>
	   			<table class="cart-wrapper" border>
	   				<tr><th> 정보수정 </th><th> 주문내역 </th><th> 문의내역 </th><th> 적립금 </th><th> 캐시 </th><th> 회원탈퇴 </th></tr>
	   			</table>
	   			<h3 style="text-align:left;"> 위시리스트 </h3>
	   			<hr>
	   		</div>
	   		<div>
	   		<%
	   			// 장바구니 DAO 추가
	   		%>
				<table class="cart-wrapper" border>
					<tr><th><input type="checkbox" name='selectall' onclick="selectAll(this)"/></th><th> 상품코드 </th><th> 상품명 </th><th> 정상가 </th><th> 판매가 </th><th> 할인률 </th><th> 판매상태 </th><th> 저장일 </th><th> 비고 </th></tr>
					<% for(int cnt=1; cnt<=5; cnt++) { %>
					<tr>
						<td><input type="checkbox" name="prodChk" onclick='checkSelectAll(this)'/></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<% } %>
				</table>
			<div>
				<label>
	   				<input type="button" value="전체삭제" style="margin-top:5%; margin-bottom:5%; margin-right:1%; font-size:20px; float:left;"/>
	   				<input type="button" value="선택삭제" style="margin-top:5%; margin-bottom:5%; font-size:20px; float:left;"/>
	   				<input type="submit" value="장바구니" style="margin-top:5%; margin-bottom:5%; font-size:20px; float:right;"/>
	   			</label>
	   		</div>
	   		</div>
		</form>
		
   </section>
   
   <aside class="aside02"><h3> 오른쪽 aside 영역표시 </h3></aside>
   
</body>

<script type="text/javascript">

	function checkSelectAll()  {
		  // 전체 체크박스
		  const checkboxes = document.querySelectorAll('input[name="prodChk"]');
		  // 선택된 체크박스
		  const checked = document.querySelectorAll('input[name="prodChk"]:checked');
		  // select all 체크박스
		  const selectAll = document.querySelector('input[name="selectall"]');
  
		  if(checkboxes.length === checked.length)  {
		    selectAll.checked = true;
		  } else {
		    selectAll.checked = false;
		  }
	}
	
	function selectAll(selectAll)  {
		  const checkboxes = document.getElementsByName('prodChk');
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked
		  })
		}

</script>
</html>