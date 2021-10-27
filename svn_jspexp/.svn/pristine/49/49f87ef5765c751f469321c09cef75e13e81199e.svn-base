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

<%-- 
/* 
# ajax(asynchronized javascript) 비동기 자바스크립트 통신 방식
1. 화면에 js의 이벤트를 통해서, XMLHttpRequest객체를 생성하고,
XMLHttpRequest객체가 화면 전환없이 요청값을 통해서 서버에 특정한 데이터를
받아서 다시 html 화면에 처리해주는 방식을 말한다.
	client <=========> server
	new XMLHttpRequest() 생성하여
			요청값(request) ==>
			<== 반응값(response)			

2. 궁극적으로 웹 프로그래밍에서 비동기의 기준은 요청값으로 통해서 서버에서 호출하는
화면이나 데이터를 가져올 때까지 다른 작업이나 화면을 처리할 수 있는지 여부에 따른 내용이다.
다른 작업이나 화면 처리를 할 수 있으면 비동기, 데이터를 가져올 때까지 기다리는 것을
동기라고 한다.
	xhr.open("get/post","서버의자원-html,text,jsp",true(비동기)/false동기);
	서버의자원 : 반응값으로 받는 자원 (xhr.responseText)
3. 일반적 효율적인 데이터 처리나 프로그래밍에서는 비동기가 필요하다. 그러나,
	때때로 XMLHttpRequest를 통해서 현재화면을 refresh하지 않고,
	특정 데이터를 받아오는 내용 안에서 전체 데이터를 받거나 파일을 받고
	처리해야 되는 경우에는 동기가 필요하다. 그래서 open()의 마지막 
	매기변수의 option을 동기/비동기로 나누고 있다.
	cf) 이벤트 핸들러 함수는 지금 일어나는 것이 아니고, 만약에 클릭한다면을 가정으로 처리하는 함수이듯이
	비동기를 옵션으로 했을 때만, 이벤트 핸들러 onreadystatechange = function(){} 가 필요로 하여 처리된다.
	
4. 동기작업은 send()메서드 후, 데이터가 오기까지 기다렸다가 responseText를
	통해서 서버에서 데이터를 받아서 처리한다.
   비동기작업은 onreadystatechange 이벤트 메서드를 통해서 다른 작업을 하는 도
   중에 이벤트를 설정해 놓고, 상태값으로 데이터가 전체 입력이 되었을 데, 처리할
   수 있도록 한다.  ex) xhr.send(); xhr.responseText;로 해당 내용을
   완료하기까지 기다린다.
5. 비동기작업은 전송 후, 다른 작업/프로세스를 진행하면서, 요청상태값을 기준으로 해서
   변경되는 메서드를 선언하고(onreadystatechange), 상대값에 해당하면 서버에서
   온 결과값을 처리한다.
   ex) xhr.onreadystatechange=function(){
	   	  xhr.readyState, xhr.status http 반응 코드값으로 상태값을 확인 처리.
  	   }
cf. 참고
1. XMLHttpRequest로 화면이 전체적으로 로딩된 상황에서, 현재 화면을 
특정한 자원에 의한 모두 다 변경하지 않고, 일부분을 변경할 수 있게 처리한다.
구체적으로 form객체의 submit 버튼으로 전체화면을 변경시키는 것과 구분하여야 한다.
서버에 있는 자원을 화면전체나 json데이터를 통해서 받아와서 처리할 수 있다.
2. 동기/비동기라는 내용은 XMLHttpRequest로 서버에 접속하여 처리할 때,
다른 요소객체를 선택하거나 다른 프로세스를 수행할 수 있는지 여부에 따라 구분된다.
3. 동기로 처리하면, 서버에서 특정한 데이터나 요소객체가 다 올 때까지는 다른 작업을
하지 못하게 처리할 때, 필요로 한다  	   
*/

--%>
<script type="text/javascript">
	$(document).ready(function(){
		$("h2").text("동기 XMLHttpRequest 활용").click(function(){
			// 1. 객체 생성
			var xhr = new XMLHttpRequest();
			//alert("객체생성:"+xhr);
			// 2. 비동기여부와 서버의 자원 요청.
			//		get방식으로 서버에 있는 z01_data.txt 호출, 비동기여부는 false로 동기처리
			//    동기처리는 이후 코드의 순서대로 처리한다.
			xhr.open("get","z01_data.txt", false);
			//
			// 3. 서버에 전송..
			xhr.send();
			// 4. 서버에 결과값 받기..
			var data = xhr.responseText;
			$("h3").text("받은 데이터:"+data);
		});
	});
	// a02_syncExp.jsp   z02_data.txt(물건정보)
	// h2를 클릭시, 물건정보를 가져와서 출력한다. 3조 전송, 전체(손들기);
</script>
</head>
<body>
	<h2 align="center"></h2>
	<h3 align="center"></h3>
	
</body>
</html>