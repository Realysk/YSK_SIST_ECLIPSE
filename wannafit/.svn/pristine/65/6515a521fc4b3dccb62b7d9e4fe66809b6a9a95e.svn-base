<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import = "java.util.*"
    import = "WANNAFIT.Database.*"
    import = "WANNAFIT.vo.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="path" value="${pageContext.request.contextPath}"/>
<fmt:requestEncoding value ="utf-8"/>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Wanna-Fit, 나만의 핏을 찾아서 </title>
<style type="text/css">

.section {
	width:100%;
	height:100%;
	margin:0 auto;
}

.main-container {
	position:relative;
	width:350px;
	height:300px;
	padding:20px 20px 20px 50px;
	margin:0 auto;
	border:1px solid #D8D9D7;
	border-radius:5px 5px 5px 5px;
}

#phone-table td {
	height:40px;
}

#phone-table tr>td{
	width:100px;
}

#phone-footer {
	text-align:center;
	margin:0 auto;
}

</style>
</head>
<script src="${path}/content/A_settings/jquery-3.6.0.js" type="text/javascript"></script>
<script src="cookies.js" type="text/javascript"></script> 
<script type="text/javascript">


// 휴대폰 인증번호
function makeCode(){
	var randomCode = "";
	var possibleText = "0123456789";
	for( var i=0; i < 6; i++ ){
		randomCode += possibleText.charAt(Math.floor(Math.random() * possibleText.length));
	};
		
	return randomCode;
}

	$(document).ready(function(){
		
		var procC = $("[name=proc]").val();
		console.log("[휴대폰인증] proc : " + procC);

		var number = "";
		$("#btnMit").click(function(){
			var comCkVal = $("[name=telecom]>option:selected").val();
			var telInVal = $("[name=phone]").val();
			
			// 통신사 선택 및 전화번호 입력 확인
			if(comCkVal != "" && telInVal != ""){
				
				// 전화번호 입력형식에 맞는지 확인
				if(isNaN(telInVal)) {
					alert("휴대폰번호는 숫자로만 입력하세요");
				} else if (telInVal.length > 11 || telInVal.length < 10) {
					alert("휴대폰번호는 11자리입니다");
				} else {
					number = makeCode();
					alert("전송되었습니다 : " + number);
				}
				
			} else if(comCkVal == ""){
				alert("통신사를 선택하세요");
			} else {
				alert("휴대폰번호를 입력하세요");
			}
		});
		
		$("#btnOk").click(function(){
			var numInVal = $("[name=conNum]").val();
			var telInVal = $("[name=phone]").val();
			
			if(numInVal == number){
				alert("일치합니다");
				
				setCookie("isCon",1,1); // 휴대폰 인증 완료 쿠키 설정
				setCookie("tel", telInVal, 1);

				window.opener.parent.location.reload(); // 현재 팝업창을 연 부모창의 새로고침
				window.close(); // 현재 팝업창 종료
			} else if(numInVal.length > 6 || numInVal.length < 5) {
				alert("인증번호는 6자리입니다");
			} else {
				alert("일치하지않습니다");
				
			}
			
		});

	});
</script>
<body>
<section class="section">
	<div class="main-container">
		<h3>휴대폰 번호 인증</h3>
		<form>
			<input type="hidden" name="proc"/>
			<table id="phone-table">
				<tr>
					<td>통신사</td>
					<td colspan="2"><select name="telecom">
							<option value="">통신사 선택</option>
							<option value="SK">SK</option>
							<option value="KT">KT</option>
							<option value="LG">LG</option>
					</select></td>
				</tr>
				<tr>
					<td>휴대폰번호</td>
					<td><input type="text" name="phone" value=""/></td>
					<td><input type="button" id="btnMit" value="전송"/></td>
				</tr>
				<tr>
					<td>인증번호</td>
					<td colspan="2"><input type="text" name="conNum" value=""/></td>
				</tr>
				<tr><td colspan="3" id="phone-footer">
					<input type="button" id="btnOk" value="완료"/>
				</td></tr>
			</table>
		</form>	
		
	</div>	
</section>
</body>
</html>