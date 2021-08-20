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
# 
5. 아래와 같이 list된 장바구니 제품 중에 []로 선택하여, 아래 기능에 의해 출력되게 하세요.
    [] 물건명    
    [] @@@
    [] @@@
    [] @@@
   [선택][제거] ==> 선택시 요청값으로 선택 물건만, 제거시 제거된 값 이외 물건만 출력하세요.
--%>
<%
	// 웹상의 Thread환경에서 ArrayList/List  remove()기능 메서드 처리 에러발생..
	Vector<String> plist = new Vector();
	plist.add("사과");
	plist.add("수박");
	plist.add("딸기");
	plist.add("오렌지");
	plist.add("키위");
	plist.add("망고");
	//,"바나나","수박","딸기","오렌지","키위","망고");
	String proc = request.getParameter("proc");
	String []ckprod = request.getParameterValues("ckprod");
	System.out.println("처리 프로세스:"+proc);
	Vector<String> result = new Vector<String>();
	if(proc!=null){
		if(proc.equals("choice")){
			if(ckprod!=null&&ckprod.length>0){
				for(String prod:ckprod){
					result.add(prod);
				}
			}
		}
		if(proc.equals("delete")){
			result=plist;
			if(ckprod!=null&&ckprod.length>0)
			result.removeAll(Arrays.asList(ckprod));
		}	
	}else{ // 초기화면...
		result=plist;
	}
	/*
	if(proc!=null){
		if(proc.equals("choice")&&ckprod!=null){
			for(int idx=plist.size()-1;idx>=0;idx--){
				
				for(String prod:ckprod){
					System.out.println(plist.get(idx)+":"+prod);
					if(!plist.get(idx).equals(prod)){
						//plist.remove(idx);
						System.out.println("삭제될 idx:"+idx);
					}
				}
			}
		}
		if(proc.equals("delete")&&ckprod!=null){
			for(int idx=0;idx<plist.size();idx++){
				for(String prod:ckprod){
					if(plist.get(idx).equals(prod)){
						//plist.remove(idx);
						System.out.println("삭제될 idx:"+idx);
					}
				}
			}
		}		
	}
	*/
%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("장바구니");
		$("[type=button]").click(function(){
			if($(this).val()=="선택") $("[name=proc]").val("choice");
			if($(this).val()=="제거") $("[name=proc]").val("delete");
			$("#frm01").submit();
		});
	});
</script>
<style>td{text-align:center;}</style>
<body>
	<h2 align="center"></h2>
	<form id="frm01" method="post">
		<input type="hidden" name="proc" />
	<table width="30%"  align="center" class="listTable">
		<tr><th><input type="checkbox" name="ckAll"/></th><th>물건명</th></tr>
		<%for(String prod:result){%>
		<tr><td><input type="checkbox" name="ckprod" value="<%=prod%>"/></td><td><%=prod%></td></tr>
		<%}%>
		<tr><td colspan="2">
				<input type="button" value="선택"/> 
				<input type="button" value="제거"/> 
		</td></tr>
	</table>	
	</form>	
<%
	
%>	
</body>
</html>