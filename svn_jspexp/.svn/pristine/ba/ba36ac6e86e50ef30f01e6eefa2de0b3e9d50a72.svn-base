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
	//$("h2").text("시작");
		var cnt = 1;
		var tot = 0;
		// 장바구니담기 클릭시
		$("#regBtn").click(function(){
			// 입력된 정보 가져오기..
			var nameVal = $("[name=name]").val();
			var priceVal = $("[name=price]").val();
			var cntVal = $("[name=cnt]").val();
			// 객체 생성..
			var prod = new Product(nameVal,priceVal,cntVal);
			$("#showCart tbody").html( $("#showCart tbody").html()
					 +prod.addProduct(cnt++))
			// append() : 기존에 있는 html 내용에서 바로 추가 처리.
			//$("#showCart tbody").append(prod.addProduct(cnt))
			tot += priceVal*cntVal;
			$("#tot").text(tot);
		});
			
	});
	// 클래스 구조 처리..
	class Product{
		constructor(name, price, cnt){
			this.name = name;
			this.price = price;
			this.cnt = cnt;
		}
		addProduct(no){  //  번호는 입력을 받게 처리.. 그 외는 객체 속성..
			return "<tr><td>"+no+"</td><td>"+this.name+"</td><td>"+this.price+
				"</td><td>"+this.cnt+"</td><td>"+this.price*this.cnt+"</td></tr>";
		}
		
	}
	
</script>
</head>
<%-- 
# 
4. [js] 전날한 생성자 class를 선언하고, 객체를 생성하는 형식을 활용하여, 장바구니에 담은 상품을 누적처리하세요.
    물건 매장
    물건명:[   ] 가격:[    ] 갯수:[   ] [장바구니담기]
--%>
<%

%>
<body>
	<h2 align="center">장바구니담기</h2>
	<form id="frm01">
	<table align="center" class="listTable" width="50%">
		<tr><th>물건명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value=""/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value=""/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="button" id="regBtn" value="장바구니담기"/></td></tr>
	</table>	
	</form>
	<h2 align="center">장바구니현황</h2>
	<table id="showCart" align="center" class="listTable" width="70%">
		<thead><tr><th>번호</th><th>물건명</th><th>가격</th><th>갯수</th><th>계</th></tr></thead>
		<tbody></tbody>
		<tfoot><th colspan="3">총계<th><td id="tot"></td></tfoot>
	</table>	
</body>
</html>