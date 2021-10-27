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
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="회원정보 상세";
	}
</script>
</head>
<%-- 
# 상세화면 출력 등록 처리 프로세스.
1. 상세화면 기본 출력..
	1) dao 단위 데이터 기능메서드 구현
	2) 요청 키단위로 해당 단위 데이터 기능메서드 매개변수 전달.
2. 처리 프로세스.(one page 처리)
	1) 수정/삭제 처리 구분 : <input type="hidden" name="proc"/>
	2) 수정 버튼 클릭시 : document.querySelector("[name=proc]").value="upt";
	3) 삭제 버튼 클릭시 : document.querySelector("[name=proc]").value="del";
    4) 처리 후, 요청값에 의해 프로세스 변경..
    	String proc = request.getParamter("proc");  	
    	if(proc!=null){
    		if(proc.equals("upt")){
    			요청값들 가져와서 Member객체에 upt이름으로 담기
    			dao.uptMember(upt);
    		}
    		if(proc.equals("del")){
    			dao.delMember(no);
    		}
    	}else{
    		proc = "";
    	}
    	js
    	var proc = "<%=proc%>";
    	조건에 따라 alert으로 수정/삭제 완료..
	

--%>
<%
	String proc = request.getParameter("proc");
	String id = request.getParameter("id");

	Member m = null;
	A05_PreparedDao dao = new A05_PreparedDao();

	if(proc!=null){
		if(proc.equals("upt")){
			String pass = request.getParameter("pass");
			String name = request.getParameter("name");
			String auth = request.getParameter("auth");
			int point = Integer.parseInt(request.getParameter("point"));		
			Member upt = new Member(id,pass,name,auth,point);
			dao.updateMember(upt);
		}
		if(proc.equals("del")){
			dao.deleteMember(id);
		}		
	}else{
		proc="";
	}
	if(id!=null){
		m = dao.getMember(id);
	}	
%>


<body>
	<script type="text/javascript">
		var proc = "<%=proc%>";
		if(proc == 'upt'){
			if(confirm("수정되었습니다.\n메인화면으로 이동하시겠습니까?"))	
				location.href="a0729_1_memberList.jsp";
		}
		if(proc == 'del'){
			alert("삭제되었습니다.\n메인화면으로 이동하겠습니다");	
			location.href="a0729_1_memberList.jsp";
		}		
	
		function upt(){
			var frm01 = document.querySelector("#frm01");
			document.querySelector("[name=proc]").value="upt";
			frm01.submit();
		}
		function del(){
			var frm01 = document.querySelector("#frm01");
			document.querySelector("[name=proc]").value="del";			
			frm01.submit();
		}		
	</script>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<input type="hidden" name="proc" />
		<%if(m!=null){ %>
		<tr><th>아이디</th><td><input type="text" name="id" value="<%=m.getId()%>"/></td></tr>
		<tr><th>패스워드</th><td><input type="text" name="pass" value="<%=m.getPass()%>"/></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" value="<%=m.getName()%>"/></td></tr>
		<tr><th>권한</th><td><input type="text" name="auth" value="<%=m.getAuth()%>"/></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point" value="<%=m.getPoint()%>"/></td></tr>
		<%} %>
		<tr><td colspan="2">
			<input type="button" onclick="upt()" value="수정" id="uptBtn"/>
			<input type="button" onclick="del()" value="삭제" id="delBtn"/>
			<input type="button" value="메인화면" id="mainBtn"/>
			
			</td></tr>
	</table>	
	</form>
	
</body>
</html>