<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<%
String menu = request.getParameter("menu");
String rightUrl = rPath + "/views";
String smenu = request.getParameter("smenu");

if(menu==null || menu.equals("home")){
	rightUrl += "/main.jsp";
} else {
	if(menu.equals("list")){
		if(smenu.equals("userList")){
			rightUrl += "/userinfo/userList.jsp";
		} else if(smenu.equals("testList")){
			rightUrl += "/test/testList.jsp";
		} else if(smenu.equals("userInsert")){
			rightUrl += "/userinfo/userInsert.jsp";
		} else if(smenu.equals("userView")){
			rightUrl += "/userinfo/userViews.jsp?uiNo=";
		}
	}
}
%>
<body>
	<div class="wrapper">
		<!-- Sidebar -->
		<jsp:include page="/views/menu/leftMenu.jsp">
			<jsp:param value="menu" name="test" />
		</jsp:include>
		 <!-- Page Content  -->
		<div class="content">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">
					<button type="button" id="sidebarCollapse" class="btn btn-info">
						<i class="fas fa-align-left"></i> <span>메뉴</span>
					</button>
				</div>
			</nav>
			<div class="container">
				<jsp:include page="<%=rightUrl%>"></jsp:include>
			</div>
		</div>
	</div>
<script type=text/javascript">
&(document).ready(function(){
	&('#sidebarCollapse').on('click', funtion() {
		&('sidebar').toggleClass('active');
	});
	var menu = '<%=menu%>';
	if(menu=='null'){
		menu='home';
	}
	var menuObj=document.querySelector('#'+menu);
	menuObj.classList.add('active');
	var smenu = '<%=smenu%>';
	if(menu!='null'){
		document.querySelector('#'+menu+'>a').setAttribute('aria-expanded',true);
		document.querySelector('#'+menu+'>ul').setAttribute('aria-expanded',true);
		document.querySelector('#'+menu+'>ul').classList.add('in');
	}
})
</script>
</body>
</html>