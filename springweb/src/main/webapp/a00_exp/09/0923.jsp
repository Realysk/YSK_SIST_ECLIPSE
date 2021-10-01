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
		# ��������
			1. [��:����] DAO�� Mapper.xml�� ���� ��Ģ�� �����غ�����.
			
				[mybatis.Spring.xml]
				
				<!-- VO alias -->
				<typeAliases>
					<typeAlias alias="��Ī" type="VO ��Ű�� ���"/>
				</typeAliases>
				<!-- XXXMapper.xml -->
				<mappers>
					<mapper resource="java ���� ��� /xxxMapper.xml"/>
				</mappers>
				
				[XXXMapper.xml]
				
				<mapper namespace="DAO ���">
					<select id="dao�޼����" resultType="��Ī">
						SQL
					</select>
					<insert, <update, <delete
				</mapper>
				
				[XXXDao.xml]
				
				public interface DAO�̸� {
					
				}
			
			2. [��:����] �μ������� ��ȸ/���/���� DAO/Mapper.xml�� ���弼��.
			
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
			
			3. [��:����] �μ������� ��ȸ/���/������ MVC�������� ȭ��ܰ� �Բ� �����ϼ���.
			
				Dao
				Service
				Controller
					1) ��ɸ޼��� �ʱ�ȭ�� ȣ��
					2) Service�� ȣ�� Model ������ ó��
					3) ȭ��ܿ��� el, jstl�� ���� ������ ó��
			
		--%>	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2 data-toggle="modal" data-target="#exampleModalCenter">Ÿ��Ʋ</h2>

</div>
<div class="container">
    <h2 align='center'></h2>
	<form id="frm01" class="form-inline"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input class="form-control mr-sm-2" placeholder="����" />
	    <input class="form-control mr-sm-2" placeholder="����" />
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
        <th>��ȣ</th>
        <th>����</th>
        <th>�ۼ���</th>
        <th>�ۼ���</th>
        <th>��ȸ</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Ÿ��Ʋ</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="����� �Է�" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="��å�� �Է�" name="job">
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