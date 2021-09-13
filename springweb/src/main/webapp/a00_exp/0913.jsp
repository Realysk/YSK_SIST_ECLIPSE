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


 --%>
<html>
<head>
<meta charset="UTF-8">
<title> REALYSK </title>
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
		1. [하:개념정리] 스프링 개발 환경에 사용하는 lib 설정 형식 3가지를 기술하세요.
		
			1) web.xml
				<servlet>
					<servlet-name>dispatcher</servlet-name>
					<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
					<async-supported>true</async-supported>
				</servlet>
				<servlet-mapping>
					<servlet-name>dispatcher</servlet-name>
					<url-pattern>*.do</url-pattern>
				</servlet-mapping>

		<!-- 

	 	-->	
	 			<filter>
	 				<filter-name>encodingFilter</filter-name>
					 <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
					 <init-param>
					 		<param-name>encoding</param-name>
					 		<param-value>utf-8</param-value>
					 </init-param>
				</filter>
				<filter-mapping>
	 				<filter-name>encodingFilter</filter-name>
	 				<url-pattern>/*</url-pattern>
	 			</filter-mapping>
	 
	 		2) dispatcher-servlet.xml
				<?xml version="1.0" encoding="UTF-8"?>
				<beans xmlns="http://www.springframework.org/schema/beans"
				    xmlns:aop="http://www.springframework.org/schema/aop" 
					xmlns:context="http://www.springframework.org/schema/context"
						xmlns:mvc="http://www.springframework.org/schema/mvc"
					xmlns:p="http://www.springframework.org/schema/p"
					xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
					 xmlns:util="http://www.springframework.org/schema/util"
					 xmlns:websocket="http://www.springframework.org/schema/websocket"
					xsi:schemaLocation="http://www.springframework.org/schema/beans
				       http://www.springframework.org/schema/beans/spring-beans.xsd
				        http://www.springframework.org/schema/aop
				       http://www.springframework.org/schema/aop/spring-aop.xsd
				       http://www.springframework.org/schema/context
				       http://www.springframework.org/schema/context/spring-context.xsd
				  		http://www.springframework.org/schema/mvc
						http://www.springframework.org/schema/mvc/spring-mvc.xsd     
				        http://www.springframework.org/schema/util
				       http://www.springframework.org/schema/util/spring-util.xsd
				   		http://www.springframework.org/schema/websocket
						http://www.springframework.org/schema/websocket/spring-websocket.xsd" >
					<!-- 컨테이너에 사용할 객체 등록 -->
					<bean class="springweb.a01_basic.A01_StartCtrl"/>
					<bean class="springweb.a01_basic.A02_SecondCtrl"/>
					<bean class="springweb.a01_basic.A03_RequestController"/>
				</beans>	 			
	 	
		2. [하:개념정리] 스프링에서 aop란 무엇인가? 개념을 찾아보고 기술하세요.
		
			AOP는 Aspect Oriented Programming의 약자로 관점 지향 프로그래밍이라고 불린다.
			관점 지향은 쉽게 말해 어떤 로직을 기준으로 핵심적인 관점, 부가적인 관점으로 나누어서 보고 그 관점을 기준으로 각각 모듈화하겠다는 것이다.
		
		3. [히:개념정리] 스프링 컨테이너의 구조체 선언 3가지 방식에 대하여 예제를 통해서 기숧하세요.
		
			
		
		4. [하:응용] Bus 클래스에서 Set<String>버스 번호 Properties를 통해 시작/종점을 처리하게 하고, container에 설정하여 처리하세요.
			main/java/diexp/Con10.java(자바형컨테이너)를 설정해서 처리되게 하세요.
		
		    <bean id="bus" class="diexp.vo.Bus">
		    <!-- setNumbers(Set<String> numbers> -->
		    	<property name="numbers">
		    		<set>
		    			<value>3003</value>
		    			<value>7700</value>
		    			<value>7650</value>
		    		</set>
		    	</property>
		    	<!-- setSection(Properties section) -->
		    	<property name="section">
		    		<props>
		    			<prop key="3003">서울~수원</prop>
		    			<prop key="7700">서울~인천</prop>
		    			<prop key="7650">부평~강남</prop>
		    		</props>
		    	</property>
		    </bean>
		
		5. [하:개념정리] 컨테이너의 namespace 선언방식을 생성자와 property를 나누어 설명하고 물건 정보를 기본 예제로 처리하세요.
		
			
		
		6. [중:응용] OnSchool 클래스 학교명, Map<Integer, Student> stus로 <번호, 학생정보>를 설정하여 컨테이너에 의해 데이터를 할당하여 해당 학교, 번호, 핵생정보를 출력하세요.
		
		
		
		7. [하:개념 및 확인예제] autowire랑 무엇인가? 개념을 정리하고 Note와 Pencil을 기준으로 처리해보세요.
		
			# Autowire
	 			1) 컨테이너 내부에 객체가 메모리 로딩될 때, 연관되는 메서드가 있으면 자동으로 객체가 할당되게 처리 하는 것을 말한다.
	 			2) public void setProd(Product prod)가 되어 있어서, 객체를 할당할 수 있으면 설정옵션 autowire에 의해 객체가 자동으로 할당 된다.
	 			3) autowire="byType" 객체가 자동 할당된다.
		
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