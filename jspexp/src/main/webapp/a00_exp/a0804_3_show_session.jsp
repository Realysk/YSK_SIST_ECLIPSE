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
	td {text-align:center;}
</style>
<script src="<%=path%>/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
			
	});

</script>
</head>
<%-- 
# 
5. [jsp]위 내용을 jsp로 요청값으로 넘기고, session에 누적처리하는 프로그램을 작성하고,
    [장바구니확인하러가기] 를 통해 현재 담기 session 객체를 리스트 확인하세요.
    물건명:[   ] 가격:[    ] 갯수:[   ] [장바구니담기]
    [장바구니 확인]
--%>
<%
ArrayList<Product> clist =(ArrayList<Product>)session.getAttribute("cartList");

%>
<body>
	<h2 align="center">장바구니현황</h2>
	<table id="showCart" align="center" class="listTable" width="70%">
		<thead><tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th><th>계</th></tr></thead>
		<tbody>
		<%
		int tot = 0;
		if(clist==null||clist.size()==0){
		%>
			<tr><th colspan="5">장바구니에 담긴 물건 없습니다.</th></tr>
		<%	
		}else{
			for(int idx=0;idx<clist.size();idx++){
				Product pro = clist.get(idx);
				tot+=pro.getPrice()*pro.getCnt();
		%>
		<tr><td><%=idx+1%></td><td><%=pro.getName()%></td>
			<td><%=pro.getPrice()%></td><td><%=pro.getCnt()%></td>
			<td><%=pro.getPrice()*pro.getCnt()%></td></tr>
		<%	
			}
		}
		%>		
		</tbody>
		<tfoot><th colspan="3">총계<th><td id="tot"><%=tot%></td></tfoot>
	</table>	
	<h3 align="center" 
		onclick="location.href='a0804_2_session.jsp'">
			물건구매하러가기</h2>
	
</body>
</html>