<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    import = "java.net.*"    
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
# 
	String noS= request.getParameter("cnt1");
	String title= request.getParameter("titl"+noS);
	String kind= request.getParameter("kind"+noS);
	String pay= request.getParameter("pay_"+noS);
	String cnt= request.getParameter("cnt_"+noS);
--%>
<%
	String ckNames[] = request.getParameterValues("ck");
	if(ckNames!=null&&ckNames.length>0){
		for(Cookie ck:request.getCookies()){
			for(String name:ckNames){
				if(
					ck.getName().equals("titl"+name)||
					ck.getName().equals("kind"+name)||
					ck.getName().equals("pay_"+name)||
					ck.getName().equals("cnt_"+name)
						
				){
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
			}
		}
		response.sendRedirect("a0820_show2.jsp");
	}
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("예매 내역");
	});
</script>
<style>td{text-align:center;}</style>
<body>


	<h2 align="center"></h2>
	<form id="frm01">
	<table  align="center" width="50%" class="listTable">
		<tr><th>ck</th><th>종류</th><th>영화명</th><th>비용</th><th>예약인원</th></tr>
<%
	

%>		
		<%
		List<Cart> clist = new ArrayList<Cart>();
		
		int cnt=1;	
		Cart cart = null;
		if(request.getCookies()!=null){
				int icnt=0;
				for(Cookie ck:request.getCookies()){ 
			
					if(!ck.getName().equals("JSESSIONID")&&!ck.getName().equals("no")){

						String ckname = ck.getName().substring(0,4);
						cnt = Integer.parseInt(ck.getName().substring(4));
							if(icnt==0){
								cart = new Cart(cnt);
								icnt++;
							}								
							System.out.println(cnt+":"+ckname+":"+ URLDecoder.decode(ck.getValue(),"utf-8"));
							if(ckname.equals("kind")){
								cart.setKind( URLDecoder.decode(ck.getValue(),"utf-8"));
								icnt++;
							}
							if(ckname.equals("titl")){
								cart.setTitle( URLDecoder.decode(ck.getValue(),"utf-8"));
								icnt++;
							}
							if(ckname.equals("pay_")){
								cart.setPay(Integer.parseInt(ck.getValue()));
								icnt++;
							}
							if(ckname.equals("cnt_")){
								cart.setCnt(Integer.parseInt(ck.getValue()));
								icnt++;
							}
							System.out.println("icnt:"+icnt);
							if(icnt==5){
								clist.add(cart);
								icnt=0;
								cnt++;
							}

					}
					
				}		
		}
		
		%>
		<%
		int no=0;
		for(Cart c:clist){ 
			System.out.println("no");
		%>
		<tr><td><input type="checkbox" name="ck" value="<%=c.getNo()%>"/></td>
			<td><%=c.getKind() %></td>
			<td><%=c.getTitle() %></td>
			<td><%=c.getPay()%></td>
			<td><%=c.getCnt()%></td>
			
			</tr>
		<%
		}
		%>
		<tr><td colspan="5" style="text-align:center" >
				<input type="submit" value="제외"/>
				<input type="button" value="결재"/>
				<input type="button" id="preBuy" value="예매하러가기"/>
			</td></tr>
	</table>	
	</form>
	<script>
		$("#preBuy").click(function(){ location.href="a0820_2.jsp";});
	</script>
</body>
</html>