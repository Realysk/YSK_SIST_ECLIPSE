<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="Project_SIST.Java.A05_Picmagine.join.JOINDAO"
	import="Project_SIST.Java.A05_Picmagine.join.JOINDTO"
%>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> PICMAGINE : LOGIN </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
			@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
		
			html, body {
				font-family: 'Nanum Gothic', sans-serif;
				margin:0px; padding:0px;
				height:100%;
			}

           header{
                display:flex;
                justify-content: center;
            }
            
            form{
                padding:10px;
            }
            
            .input-box{
                position:relative;
                margin:10px 0;
            }
            
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:100%;
            }
            
            input::placeholder{
                color:transparent;
            }
            
            input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;

            }
            
            input:focus + label, label{
                color:#8aa1a1;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:0px;
                top:0px;
                transition: all 0.2s ease ;
                -webkit-transition: all 0.2s ease;
                -moz-transition: all 0.2s ease;
                -o-transition: all 0.2s ease;
            }

            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            
           input[type=button]{
                background-color: #8aa1a1;
                border:none;
                color:white;
                border-radius: 5px;
                width:100%;
                height:35px;
                font-size: 14pt;
                margin-top:100px;
            }
            
            input[type=submit]{
                background-color: #8aa1a1;
                border:none;
                color:white;
                border-radius: 5px;
                width:100%;
                height:35px;
                font-size: 14pt;
                margin-top:100px;
            }
            
            #forgot{
                text-align: right;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            
			.main-wrap {
			    width: 330px;
			    height: 90%;
			    background: var(--main-background-color);
			    margin-left: 37%;
			    padding: 35px 40px 40px 40px;
			    box-shadow: 0px 1px 10px rgb(160 160 160 / 30%);
			}
	
			element.style {
			    text-align: center;
			    padding-top: 60px;
			}
			
			#idForgot:hover {
				color: skyblue;
			}
			
			#pwForgot:hover {
				color: skyblue;
			}
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="시작!!";
	};

</script>
</head>
<body>

	<!-- 로그인 / 회원가입 폼 -->
	<div class="main-wrap" style="margin-top: 60px;">
	<img onclick="main(this)" src="https://img.icons8.com/small/32/000000/delete-sign.png"/>
		<header>
			<div style="text-align : center; padding-top: 60px;">
				<img style="width:100%" src="image/logo.png" alt="picmagine">
			</div>
		</header>
			
		<div align="center">
			<h5> 상상하는 모든 것들이 한 곳에! </h5>
			<h4> PicMagine에 오신 것을 환영합니다! </h4>
		</div>
			
		<form name="loginForm" action="logined.jsp" method="post"> <!-- 경로 : 로그인이 된 상태로 메인 이동 -->
			<div class="input-box">
				<input id="memid" type="text" name="memid" onkeyup="checkCapsLock(event)" placeholder="아이디">
				<label for="memid"> ID </label>
			</div>
			
			<div class="input-box">
				<input id="mempw" type="password" name="mempw" onkeyup="checkCapsLock(event)" placeholder="패스워드">
				<label for="mempw"> PW </label>
			</div>
			<div id="message"></div>
			<span align="right">
				<div id="Forgot">
					<a id="idForgot" href="forgotID.html"> ID </a> / <a id="pwForgot" href="forgotPW.html"> PW </a> 찾기
				</div>
			</span>
				<input type="checkbox" id="saveLogin"> 아이디 저장
				<input type="checkbox" id="autoLogin"> 자동 로그인
				<input type="submit" onclick="formChk(this)" value="로그인" style="margin-top: 30px;">
		</form>
				<input type="submit" value="회원가입" id="join" onclick="join(this)" style="margin-top: 3px;">
	</div>	
	
</body>
<script type="text/javascript">

	// 로그인 전 메인 페이지 이동
	function main(obj) {
		this.location.href = '../main.html';
	}

	// 회원가입 페이지 이동
	function join(obj) {
		this.location.href = 'join.jsp';
	}
	
	// 쿠키를 활용하여 체크박스로 ID 저장 (소스를 그대로 가져와서 변수만 변경)
    $(document).ready(function() {
        var userInputId = getCookie("userInputId"); // 저장 된 쿠기값 가져오기
        $("input[name='memid']").val(userInputId); 
         
        if($("input[name='memid']").val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
                                               		// 아이디 저장하기 체크되어 있을 시,
            $("#saveLogin").attr("checked", true); // '아이디 저장'을 체크 상태로 두기.
        }
         
        $("#saveLogin").change(function() { // 체크박스에 변화가 발생시
            if($("#saveLogin").is(":checked")) { // '아이디 저장' 체크했을 때,
                var userInputId = $("input[name='memid']").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            } else { // ID 저장하기 체크 해제 시,
                deleteCookie("userInputId");
            }
        });
         
        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("input[name='memid']").keyup(function() { // ID 입력 칸에 ID를 입력할 때,
            if($("#saveLogin").is(":checked")) { // ID 저장하기를 체크한 상태라면,
                var userInputId = $("input[name='memid']").val();
                setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
            }
        });
    });
     
	// 쿠키 기간 설정..?
    function setCookie(cookieName, value, exdays) {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
    
	// 쿠키 만료일 설정..?
    function deleteCookie(cookieName) {
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
    
	// 쿠키 불러오기..?
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }
	
	// 자동 로그인은 JSP를 활용해야 해서 현재로써는 구현이 안될 듯 합니다.
	
	/*
	// 로그인 승인 시 '로그인 상태'의 메인 페이지 이동
	function goMain(obj) {
		this.location.href = 'logined_AUT_main.html';
	}
	*/
	
	// CapsLock 여부
	function checkCapsLock(event) {
	  if (event.getModifierState("CapsLock")) {
	    document.getElementById("message").innerText = "! Caps Lock이 켜져 있습니다.";
	    document.getElementById("message").style.color = "blue";
	  } else {
	    document.getElementById("message").innerText = "";
	  	}
	}
	
	var id = document.querySelector("[name=memid]");
	var pw = document.querySelector("[name=mempw]");
	
	// 로그인 여부
	function formChk(obj) {
		
		
		if(memid.value=="") {
			
			// ID 미 입력시
			alert("아이디를 입력하세요.");
			id.focus();
			
			return false;
			
		} else if(mempw.value=="") {
			
			// PW 미 입력시
			alert("비밀번호를 입력하세요.");
			pw.focus();
			
			return false;
			
		} else {
			
			document.loginForm.submit();
    		location.href='../logined.jsp';
    		//location.href='../logout_main.html';
		}
	}

</script>
</html>