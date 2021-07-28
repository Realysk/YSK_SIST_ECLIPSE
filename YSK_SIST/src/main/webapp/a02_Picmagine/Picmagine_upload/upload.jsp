<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="Project_SIST.Java.A05_Picmagine.upload.*"
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> PICMAGINE : UPLOAD </title>
<!-- <link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css"> -->
<style type="text/css">
	
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
            
			.main-wrap {
			    width: 70%;
			    height: 100%;
			    background: var(--main-background-color);
			    margin-top: 40px;
			    margin-bottom: 60px;
			    margin-left: 300px;
			    margin-right: 500px;
			    padding: 35px 40px 40px 40px;
			    padding-top: 20px; 
			    padding-right: 20px;
			    padding-left: 20px;
			    padding-bottom: 20px;
			    box-shadow: 0px 1px 10px rgb(160 160 160 / 30%);
			}
	
			element.style {
			    text-align: center;
			    padding-top: 60px;
			}
			
			.input-file-button{
			  padding: 6px 25px;
			  background-color:skyblue;
			  border-radius: 4px;
			  color: white;
			  cursor: pointer;
			}	
	
</style>
</head>
<body>

	<%
		UPLDAO dao = new UPLDAO();
		ArrayList<UPLDTO> u = dao.uploadList();

		String artcategory = request.getParameter("artcategory");
		String arttitle = request.getParameter("arttitle");
		String artcontent = request.getParameter("artcontent");
		String artimgtitle = request.getParameter("artimgtitle");
		String tag = request.getParameter("tag");
			
		if(artcategory == null) artcategory = "";
		if(arttitle == null) arttitle = "";
		if(artcontent == null) artcontent = "";
		if(artimgtitle == null) artimgtitle = "";
		if(tag == null) tag = "";
		
		List<String> categorys = Arrays.asList("추상", "자연", "가상", "배경", "사계", "일러스트", "팬아트", "여행", "세계", "국내");
			
		// 등록
		// dao.Uploaded(new UPLDTO(artcategory, artimgtitle, arttitle, artcontent, tag));
	%>
	 
	<div class="main-wrap">
	<img onclick="main(this)" src="https://img.icons8.com/small/32/000000/delete-sign.png"/>
		<form name="uploadForm" action="uploaded.jsp" enctype="multipart/form-data">
		<!-- <form name="uploadForm" action="../uploaded.jsp" method="post" enctype="multipart/form-data"> -->
			<div class="input-box" align="center">
				<select name="artcategory" onchange="category(this)">
					<option> 카테고리 선택 </option>
					<%for(String cat : categorys){ %>
					<option ><%=cat %></option>
					<% } %>
				</select>
			</div>
			<div class="input-box">
				<!-- <h2 name="artcategory" style="text-align:center;"> 카테고리 선택 </h2> -->
			</div>
			<div class="input-box">
				<input type="text" name="arttitle" onkeyup="checkCapsLock(event)" placeholder="제목">
				<label for="arttitle"> 제목 </label>
			</div>
			<div class="input-box">
				<textarea type="text" name="artcontent" onkeyup="checkCapsLock(event)" style="resize:none; margin: 0px; width: 1305px; height: 467px;"></textarea>
			    <input type='file' id='artimgtitle' name='artimgtitle' accept='image/*, video/*' multiple/>
			</div>
			<div id="message"></div>
			<div class="input-box">
				<input type="text" name="tag" placeholder="태그"/>
				<label for="tag"> 태그 </label>
			</div>
				<input type="button" onclick="formChk(this)" value="등록" style="margin-top: 30px;">
				<input type="button" value="취소" id="cancel" onclick="main(this)" style="margin-top: 3px;">
		</form>
	</div>	 
	 
</body>
<script type="text/javascript">
	
	var arttitle = document.querySelector("[name=arttitle]");
	var artcontent = document.querySelector("[name=artcontent]");
	var artimgtitle = document.querySelector("[name=artimgtitle]");
	var tag = document.querySelector("[name=tag]");

	// 페이지 이동
	function main(obj) {
//		this.location.href = '../logout_main.html'; // (로그인 상태) 메인 페이지 이동 (상대 경로)
		this.location.href = 'logout_main.html'; // (로그인 상태) 메인 페이지 이동
	}
	
	// 카테고리 선택시 표시
/* 	var artcategory = document.querySelector("[name=artcategory]");

	function category(obj) {
		artcategory.innerText = obj.value;
	} */
	
	// CapsLock 여부
	function checkCapsLock(event) {
	  if (event.getModifierState("CapsLock")) {
	    document.getElementById("message").innerText = "! Caps Lock이 켜져 있습니다.";
	    document.getElementById("message").style.color = "blue";
	  } else {
	    document.getElementById("message").innerText = "";
	  	}
	}

	// 게시물 등록 여부
	function formChk(obj) {
		
		if(arttitle.value=="") {
			// 제목 미 입력시
			alert("제목을 입력하세요.");
			arttitle.focus();
			
			return false;
		} else if(artcontent.value=="") {
			// 내용 미 입력시
			alert("내용을 입력하세요.");
			artcontent.focus();
			
			return false;
		} else {
			alert("게시물 등록이 완료되었습니다!");
			document.uploadForm.submit();
//			location.href='logout_main.html';
	   		submit.location.href='uploaded.jsp'; // [관리자] 화면으로 임시 설정 (실제 사용자 화면에서는 logout_main.html로 이동)
		}
	}	
	
</script>
</html>