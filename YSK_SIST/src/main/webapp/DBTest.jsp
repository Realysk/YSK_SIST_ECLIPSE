<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="Project_SIST.Java.A05_Picmagine.upload.UPLDTO"
%>
<%
//  [jspexp] 프로젝트에 사용
//		import="jspexp.z02_vo.*" : VO import
//		import="jspexp.z01_database.*" : DAO import 

//  [YSK_SIST] 프로젝트에 사용
//  	import="Project_SIST.Java.*" : VO, DAO import

//  공통 사용
//		import="java.util.*" : 내장 객체 import
//		import="java.sql.*" : DB 연동 객체 import

	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> DB 테스트 </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="";
	};

</script>
</head>
<body>

	<h3></h3>
	<table>
		<tr>
			<td>				
				<%
				
				// # JSP DB 연동 방법 [최초 0 ~ 3 순 진행 / 이후 1 ~ 3 순 진행]
				
				// 0) web.xml에 '</web-app>' 위에 해당 코드를 추가 (최초 1회 설정인 듯 함)

				/*
					<resource-ref>
						<description>Connection</description>
						<res-ref-name>jdbc/OracleDB</res-ref-name>
						<res-type>javax.sql.DataSource</res-type>
						<res-auth>Container</res-auth>
					</resource-ref>
				*/
				
				// 1) DAO 호출을 위한 작업을 진행 (DB -> VO -> DAO 생성)
				
				// 2) 'DB 연동이 된' DAO 호출을 위해 JSP에도 DB를 연동. ( import="java.sql.*" <- 템플릿으로 설정해두면 좋을 듯 )					
					
				Connection con=null;
				String driver = "oracle.jdbc.driver.OracleDriver";
				String info = "jdbc:oracle:thin:@localhost:1521:XE"; // 개인 DB
			//	String info = "jdbc:oracle:thin:@110:93:182.83:1521:XE"; // 학원 DB
					
				Boolean connect = false;
					
				try{
				    Class.forName(driver);
				    con=DriverManager.getConnection(info,"scott","tiger"); // 자신의 아이디와 비밀번호
				    connect = true;
				    con.close();
				} catch(Exception e) {
			    connect = false;
				    e.printStackTrace();
				}
				%>
				<%
				if(connect==true) {%>
				    <!-- ===== DATABASE에 연결되었습니다. ===== -->
				    ===== DATABASE에 연결되었습니다. =====
				<% } else { %>
				    <!-- ===== DATABASE 연결에 실패했습니다. ===== -->
				    ===== DATABASE 연결에 실패했습니다. =====
				<% } %>
			</td>
		</tr>
	</table>
		
	<table>
	<h3></h3>
		<tr><th></th></tr>
		<tr><td></td></tr>
	</table>	
</body>
</html>