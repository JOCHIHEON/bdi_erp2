<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
String tId = request.getParameter("tId");
String tPwd = request.getParameter("tPwd");
String tBirth = request.getParameter("tBirth");
String tContent = request.getParameter("tContent");
String tNo = request.getParameter("tNo");
Connection con = DBConnection.getCon();
String sql = "update Test set tId=?,tPwd=?,tBirth=?,tContent=? where tNo=?;";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1,tId);
ps.setString(2,tPwd);
ps.setString(3,tBirth);
ps.setString(4,tContent);
ps.setString(5,tNo);
int cnt = ps.executeUpdate();
DBConnection.close();
if(cnt==1){
%>
<script>
	alert("테스트정보수정이 정상적으로 이루어졌습니다.");
	location.href="<%=rPath%>/views/test/testList.jsp";
</script>
<%
}
%>