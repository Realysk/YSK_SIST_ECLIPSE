<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "jspexp.z01_database.*"
    import = "jspexp.z02_vo.*"
    import = "java.util.*"    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var = "path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근면하고 성실하게 살아라. 그리고 늘 유익한 일에 열중하라(프랭클린)</title>
<link rel="stylesheet" href="${path}/a00_com/a01_com.css">
<style>
	
</style>
<script src="${path}/a00_com/jquery-3.6.0.js" 
	type="text/javascript"></script>

</head>
<%-- 
	1) 파일 및 핵심 코드
	controller(A27_AjaxController.java, /schMember.do)
		요청
		조건에 따른 초기화면, ajax 데이터
			service단
	service(CommonService.java)
		
	view(a14_mvc\a07_mvc_DB3.jsp)
		초기화면 호출	

# 등록 처리..
1. 등록 데이터 입력
2. 이벤트에 의해 ajax 요청 처리.
	$("[name=proc]").val("ins");
	input type="hidden" name="proc"
	$("form").serialize() : form하위에 있는 모든 요소객체들을 key=value query string을 자동으로 만들어 준다.
3. controller단 처리.
	요청값이 proc가  ins인 경우
	기존의 있는 요청값을 Member객체에 할당..
	
4. service단 
	 1) 입력하는 dao단 확인..
	 2) 메서드 선언 및 리턴값으로 등록성공
	 	public String insert(Member ins){
	 		String ret="등록성공";
	 		try{
	 			dao.insert(ins);
	 		}catch(Exception e){
	 			ret="등록시 문제발생";
	 		}
	 		// 화면에 입력후, 결과와 함께 list되는 데이터를 출력하기 위해서 json 형태로 넘겨준다.
	 		ret ="{\"result\":"+ret+",\"list\":"+getMemberList()+"}"
	 		return ret;
	 	}
	 	public String getMemberList(){
	 		String jsonData = gson.toJson(dao.getMemberList());
	 		return jsonData;
	 	}
5. controller단
	out.print(service.insert(int));	
6. view단
	//alert(xhr.responseText);	 	
	var jsonData = JSON.parse(xhr.responseText);
	alert(jsonData.result);
	var list = jsonData.list
	반복문을 통해서 화면에 리스트 처리..
	
--%>

<script type="text/javascript">
	$(document).ready(function(){
		var xhr = new XMLHttpRequest();
		$("[name=id]").keyup(function(event){
			if(event.keyCode==13){
				$("#show td").text("");
				var idVal = $("[name=id]").val();
				xhr.open("get","${path}/schMember.do?proc=sch&id="+idVal,true);
				xhr.send();
				xhr.onreadystatechange=function(){
					if(xhr.readyState==4&&xhr.status==200){
						var jTxt = xhr.responseText;
						
						if(jTxt!="{}"){
							var member = JSON.parse(xhr.responseText);
							console.log(member);
							$("#show td").eq(0).text(member.id);
							$("#show td").eq(1).text(member.pass);
							$("#show td").eq(2).text(member.name);
							$("#show td").eq(3).text(member.auth);
							$("#show td").eq(4).text(member.point);
						}else{
							alert("해당 회원번호 데이터가 없습니다.");					
						}
					}
				};
				
			}
		});
		$("#addBtn").click(function(){
			$("[name=id]").val($("#show td").eq(0).text());
			$("[name=pass]").val($("#show td").eq(1).text());
			$("[name=name]").val($("#show td").eq(2).text());
			$("[name=auth]").val($("#show td").eq(3).text());
			$("[name=point]").val($("#show td").eq(4).text());
		});
		$("#regBtn").click(function(){
			if(confirm("등록하시겠습니까?")){
				$("[name=proc]").val("ins");
				ajaxFun();
			}
		});
		$("#uptBtn").click(function(){
			if(confirm("수정하시겠습니까?")){
				$("[name=proc]").val("upt");
				ajaxFun();			
			}
		});
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				$("[name=proc]").val("del");
				ajaxFun();				
			}
		});		
		function ajaxFun(){
			var snd = $("form").serialize();
			console.log(snd);
			xhr.open("get","${path}/schMember.do?"+snd,true);
			xhr.send();
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var jTxt = xhr.responseText;
					console.log(jTxt);
					var jData = JSON.parse(jTxt);
					alert(jData.result);
					var list = jData.list;
					console.log(list);
					var show="";
					$(list).each(function(idx, mem){
						show+="<tr><td>"+mem.id+"</td><td>"+
						mem.pass+"</td><td>"+mem.name+"</td><td>"+
						mem.auth+"</td><td>"+mem.point+"</td></tr>";
					});
					$("#list tbody").html(show);
				}
			};				
		}
		
	});
</script>
<style>td{text-align:center;}</style>
<body>
	<h2 align="center">회원정보 mvc(ajax처리)</h2>
	<table align="center" class="listTable">
		<tr><th>회원아이디</th><td><input type="text" name="id" value=""/></td></tr>
	</table>
	
	<table id="show" align="center" class="listTable" width="50%">
		<col width="20%"><col width="30%"><col width="20%"><col width="30%">
		<tr><th>아이디</th><td></td><th>패스워드</th><td></td></tr>
		<tr><th>이름</th><td></td><th>권한</th><td></td></tr>
		<tr><th>포인트</th><td></td><th></th><td></td></tr>
		<tr><th colspan="4"><input type="button" id="addBtn" value="아래로"/></th></tr>			
	</table>
	<form method="post"><input type="hidden" name="proc"/>
	<table align="center" class="listTable" width="50%">
		<col width="20%"><col width="30%"><col width="20%"><col width="30%">
		<tr><th>아이디</th><td><input type="text" name="id" /></td>
			<th>패스워드</th><td><input type="text" name="pass" /></td></tr>
		<tr><th>이름</th><td><input type="text" name="name" /></td>
			<th>권한</th><td><input type="text" name="auth" /></td></tr>
		<tr><th>포인트</th><td><input type="text" name="point" /></td>
			<th></th><td></td></tr>
		<tr><th colspan="4">
			<input type="button" id="regBtn" value="등록"/>
			<input type="button" id="uptBtn" value="수정"/>
			<input type="button" id="delBtn" value="삭제"/>
			<input type="reset"  value="초기화"/>
		</th></tr>			
	</table>	
	</form>
	<table id="list" align="center" class="listTable">
		<thead>
		<tr><th>아이디</th><th>패스워드</th><th>이름</th><th>권한</th><th>포인트</th></tr></thead>
		<tbody></tbody>
	</table>
</body>
</html>