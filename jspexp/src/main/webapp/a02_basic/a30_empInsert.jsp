<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="java.util.*"
	import="java.sql.*"
	import="jspexp.z02_vo.*"
	import="jspexp.z01_database.*"
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
<title> REALYSK's PAGE </title>
<link rel="stylesheet" href="<%=path%>/a00_com/a00_com.css">
<style>
	.input{width:80%;}
	.input:focus{background-color:yellow;}
</style>
<script type="text/javascript">
	window.onload=function(){
		document.querySelector("h3").innerText="사원정보 등록";
	}
</script>
</head>
<%-- 
 # 등록 화면 처리
 	1. 기본 화면 구성
 	2. form 객체의 요소값 지정
 	3. form 객체의 공통 combobox 데이터 설정 및 처리
 	4. 요청 페이지 구현 

--%>
<%
	//요청값에 대한 처리
	String ename = request.getParameter("ename");
	String job = request.getParameter("job"); if(job==null)job="";
	String mgrS = request.getParameter("mgr"); if(mgrS==null)mgrS="0";
	String hiredate = request.getParameter("hiredate"); 
		if(hiredate==null)hiredate="1970-01-01";
	String salS = request.getParameter("sal"); if(salS==null)salS="0";
	String commS = request.getParameter("comm"); if(commS==null)commS="0";
	String deptnoS = request.getParameter("deptno"); if(deptnoS==null)deptnoS="0";
	//DB 입력을 위한 VO객체 처리.
	boolean isInsert=false;
	if(ename!=null){ // 초기화면이 아니, 등록 버튼을 클릭시..
		Emp ins = new Emp(0,ename, job, 
				Integer.parseInt(mgrS),
				hiredate,
				Double.parseDouble(salS),
				Double.parseDouble(commS),
				Integer.parseInt(deptnoS)
				);
		A05_PreparedDao dao = new A05_PreparedDao();
		dao.insertEmp2(ins);
		System.out.println("입력할사원객체:"+ins);
		isInsert =true;
	}


	List<String> jobs = Arrays.asList("CLERK","SALESMAN",
			"PRESIDENT","MANAGER","ANALYST");
	List<Code> mgrs = Arrays.asList(
			new Code("7566","JONES"),
			new Code("7782","CLARK"),
			new Code("7839","KING"),
			new Code("7698","BLAKE"),
			new Code("7902","FORD"));
	List<Code> depts = Arrays.asList(
			new Code("10","ACCOUNTING"),
			new Code("20","RESEARCH"),
			new Code("30","SALES"),
			new Code("40","OPERATIONS"));
	%>
	<script>
		var isInsert = <%=isInsert%>;
		if(isInsert){
			if(confirm("등록이 되었습니다.\n메인화면으로 이동하시겠습니까?")){
				location.href="a29_empList.jsp";
			}
		}
</script>
<body>
	<h3 align="center"></h3>
	<form id="frm01" method="post">
	<table>
		<tr><th>사원명</th><td><input class="input" type="text" name="ename" value=""/></td></tr>
		<tr><th>직책명</th><td>
				<select class="input"  name="job">
					<option value="">직책선택</option>
					<%for(String jo : jobs){ %>
					<option ><%=jo %></option>
					<%} %>
				</select></td></tr>
		<tr><th>관리자명</th><td>
				<select class="input"  name="mgr">
					<option value="">관리자선택</option>
					<%for(Code mgr : mgrs){ %>
						<option value="<%=mgr.getKey()%>">
							<%=mgr.getValue() %></option>
					<%} %>
				</select>		
				
				</td></tr>
		<tr><th>입사일</th><td><input class="input"  type="date" name="hiredate" value=""/></td></tr>
		<tr><th>급여</th><td><input class="input"  type="number" name="sal" value="0"/></td></tr>
		<tr><th>보너스</th><td><input class="input"  type="number" name="comm" value="0"/></td></tr>
		<tr><th>부서명</th><td>
				<select class="input"  name="deptno">
					<option value="">부서선택</option>
					<%for(Code dept : depts){ %>
						<option value="<%=dept.getKey()%>">
							<%=dept.getValue() %></option>
					<%} %>
				</select>				
				</td></tr>
		<tr><td colspan="2">
				<input type="submit" value="등록"/>
				<input type="button" value="메인화면이동"/>
		
		</td></tr>
	</table>	
	</form>
</body>
</html>