<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="tag" uri="/WEB-INF/tlds/ConnectionTag.tld" %>
<h1>��ũ��Ʈ ���� �����ϱ�</h1>
<tag:db id="db"/>
<%
   Connection conn = db.getConnection();
   PreparedStatement pstmt=conn.prepareStatement("select * from tblMember");
   ResultSet rs = pstmt.executeQuery();
   if(rs.next()){
%>
����� �̸���?  : <%=rs.getString("name")%><br/>
����� ���̵��? :  <%=rs.getString("id")%>
<%}
   rs.close();
   pstmt.close();
   conn.close();
%>
