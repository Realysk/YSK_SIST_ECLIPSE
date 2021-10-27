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
4. [js] 전날한 생성자 class를 선언하고, 객체를 생성하는 형식을 활용하여, 장바구니에 담은 상품을 누적처리하세요.
    물건 매장
    물건명:[   ] 가격:[    ] 갯수:[   ] [장바구니담기]
    
    
    클라이언트(브라우저)   			=====>    	서버(톰캣was)
    											세션(cartList-ArrayList<Product>)
    1) 초기화면 
    	요청값 없음..  							f(name!=null)  세션(cartList) 없음.
    2) 첫번째 데이터 입력하고 장바구니 담기.
		요청값 전달 sumit를 통해서			    	요청값 가져온다, 객체 생성(new Product)   	세션(cartList) 없음.
										    	if(clist==null){ 세션없는 것을 check해서
										    	clist= new ArrayList<Product>(); 만들고
										    	생성된 객체는 clist에 할당. clist.add(prod)
										    	세션(cartList) 		세션값이 생성(첫번째 세션)
    3) 두번째 데이터 입력하고 장바구니 담기.				요청값 가져온다, 객체 생성(new Product) 
    	요청값 전달 sumit를 통해서					현재 세션값이 있기에 ArrayList<Product> clist =(ArrayList<Product>)session.getAttribute("cartList");
    											로 가져올 수 있다.
    											clist.add(생성객체할당) :기존에 있는 내용에 추가..
    											다시, session값에 할당. session.setAttribute("cartList",clist); 
    
--%>
<%
	String name = request.getParameter("name");
	String priceS = request.getParameter("price");
	String cntS = request.getParameter("cnt");
	// 장바구니에 담겨져 있는 리스트 가져오기...
	ArrayList<Product> clist =(ArrayList<Product>)session.getAttribute("cartList");
	
	if(name!=null){
		Product prod = new Product(name, Integer.parseInt(priceS),Integer.parseInt(cntS));
		if(clist==null){
			clist= new ArrayList<Product>();
		}
		clist.add(prod); // session에 추가할 장바구니 처리한다.
		System.out.println("현장바구니현황:"+clist.size());
		session.setAttribute("cartList",clist);
	}
%>
<body>
	<h2 align="center">장바구니담기</h2>
	<form id="frm01" method="post">
	<table align="center" class="listTable" width="50%">
		<tr><th>물건명</th><td><input type="text" name="name" value=""/></td></tr>
		<tr><th>가격</th><td><input type="text" name="price" value="0"/></td></tr>
		<tr><th>갯수</th><td><input type="text" name="cnt" value="0"/></td></tr>
		<tr><td colspan="2" style="text-align:center" ><input type="submit"  value="장바구니담기"/></td></tr>
	</table>	
	</form>
	<h3 align="center" 
		onclick="location.href='a0804_3_show_session.jsp'">장바구니확인하러가기</h2>
</body>
</html>