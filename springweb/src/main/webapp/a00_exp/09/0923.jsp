<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="EUC-KR">
<title>REALYSK</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<%-- 
		# 정리문제
			1. [하:개념] DAO와 Mapper.xml의 연동 규칙을 설명해보세요.
			
				[mybatis.Spring.xml]
				
				<!-- VO alias -->
				<typeAliases>
					<typeAlias alias="별칭" type="VO 패키지 경로"/>
				</typeAliases>
				<!-- XXXMapper.xml -->
				<mappers>
					<mapper resource="java 하위 경로 /xxxMapper.xml"/>
				</mappers>
				
				[XXXMapper.xml]
				
				<mapper namespace="DAO 경로">
					<select id="dao메서드명" resultType="별칭">
						SQL
					</select>
					<insert, <update, <delete
				</mapper>
				
				[XXXDao.xml]
				
				public interface DAO이름 {
					
				}
			
			2. [하:응용] 부서정보의 조회/등록/삭제 DAO/Mapper.xml을 만드세요.
			
				public interface A03_DeptDao {
					// SELECT * FROM dept02
					public ArrayList<Dept> dlist(Dept sch);
					public void insertDept(Dept ins);
					public void updateDept(Dept upt);
					public void deleteDept(int deptno);
				}	
			
				<select id="dlist" parameterType="dept" resultType="dept">
					SELECT * FROM dept02
				</select>
				<insert id="insertDept" parameterType="dept">
					INSERT INTO dept02 VALUES (#{deptno}, #{dname}, #{loc})
				</insert>
				<update id="updateDept" parameterType="dept">
					UPDATE dept02
						SET dname = #{dname},
							loc = #{loc},
						WHERE deptno = #{deptno}
				</update>
				<delete id="deleteDept" parameterType="int">
					DELETE FROM dept02 WHERE deptno = #{deptno}
				</delete>			
			
			3. [중:응용] 부서정보의 조회/등록/삭제를 MVC패턴으로 화면단과 함께 구현하세요.
			
				Dao
				Service
				Controller
					1) 기능메서드 초기화면 호출
					2) Service단 호출 Model 데이터 처리
					3) 화면단에서 el, jstl을 통한 데이터 처리
			
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