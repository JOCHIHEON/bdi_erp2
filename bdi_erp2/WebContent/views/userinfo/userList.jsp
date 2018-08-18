<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.bdi.erp.common.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<style>
	h4,th,tr{text-align:center;}
</style>
<body>
<div class="container">
	<div style="margin:10px;">
	<h4>사원리스트</h4>
		<table class = "table table-bordered table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>사원설명</th>
					<th>나이</th>
					<th>부서번호</th>
				</tr>
			</thead>
			<tbody>
<%
Connection con = DBConnection.getCon();
String sql = "select uiNo,uiName,uiId,uiDesc,uiAge,diNo from user_info";
PreparedStatement ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
while(rs.next()){
%>
				<tr>
					<td><a href="<%=rPath%>/views/userinfo/userViews.jsp?uiNo=<%=rs.getInt("uiNo") %>"><%=rs.getInt("uiNo") %></td>
					<td><%=rs.getString("uiName") %></td>
					<td><%=rs.getString("uiId") %></td>
					<td><%=rs.getString("uiDesc") %></td>
					<td><%=rs.getInt("uiAge") %></td>
					<td><%=rs.getInt("diNo") %></td>
				</tr>
<%
}
rs.close();
ps.close();
DBConnection.close();
%>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>