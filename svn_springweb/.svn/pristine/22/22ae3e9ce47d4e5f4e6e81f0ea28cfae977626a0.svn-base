<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
# 일일정리문제
[하:개념]1. dao와 mapper.xml의 연동 규칙을 정의해보세요
			dao.java		mappper.xml
		패키지명.인터페이스명		namespace="패키지명.인터페이스명"
			메서드명			<select/update/delete
								id="메서드명"
			리턴유형			resultType="리턴유형"
			매개변수유형		parameterType="매개변수유형"									

[하:응용]2. 부서정보의 조회/등록/수정/삭제 dao/mapper.xml을 만드세요.
	public interface A03_DeptDao {
		public ArrayList<Dept> dlist(Dept sch);
		public void insertDept(Dept ins);
		public void updateDept(Dept upt);
		public void deleteDept(int deptno);
		
<mapper namespace="springweb.a05_mvc.a03_dao.A03_DeptDao">			
	<select id="dlist" parameterType="dept" resultType="dept" >
		select * from dept02
	</select>
	<insert id="insertDept" parameterType="dept">
		INSERT INTO dept02 values(
			#{deptno},#{dname},#{loc})	
	</insert>
	<update id="updateDept" parameterType="dept">
		UPDATE dept02
			SET dname = #{dname},
				loc = #{loc}
			WHERE deptno = #{detpno}		
	</update>
	<delete id="deleteDept" parameterType="int">
		DELETE FROM dept02
		WHERE deptno = #{deptno}	
	</delete>	
		
[중:응용]3. 부서정보의 조회/등록/수정/삭제 MVC 패턴으로 화면단과 함께 구현하세요.
	dao
	service
	controller
		1) 기능메서드 초기화면 호출
		2) service단 호출 model 데이터 처리
		3) 화면단에서 el, jstl을 통한 데이터 처리..
	jsp
		form 요소객체  처리
		출력처리..	
		js 처리..
		
# 오늘의 목표
1. 스프링에서 사용하는 view을 처리하는 Viewresolver를 알고, 여러가지 형태의 view 처리를 할 수 있다.
2. 스프링에서 json데이터를 활용하여 ajax처리를 할 수 있다.
3. 스프링에서 session 처리를 할 수 있다.
4. 여러가지 환경 설정값을 컨테이너로 할 수 있다.
# 핵심키워드
1. view Resolver, InternalResourceViewResolver, prefix, suffix, order
2. MappingJackson2JsonView
3. context:property-placeholder

 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">타이틀</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="제목" />
	    <input class="form-control mr-sm-2" placeholder="내용" />
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>