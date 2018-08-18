<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<div class="container">
	<form action="<%=rPath%>/views/test/testInsertOK.jsp" onsubmit="return checkVal()">
	<fieldset>
		<legend>유저 등록</legend>
		<table class="table table-bordered">
			<tr>
				<th>ID</th>
				<td><input type="text" name="tId"></td>
			</tr>
			<tr>
				<th>PASSWORD</th>
				<td><input type="password" name="tPwd"></td>
			</tr>
			<tr>
				<th>BIRTH</th>
				<td><input type="text" name="tBirth"></td>
			</tr>
			<tr>
				<th>CONTENT</th>
				<td><textarea name="tContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><button>유저등록</button></td>
			</tr>
		</table>
	</fieldset>
	</form>
</div>
<script>
function checkVal(){
	var objs = document.querySelectorAll('input');
		for(var i=0;i<objs.length;i++){
			if(objs[i].name!="tContent"){
				if(objs[i].value.length<1 || objs[i].value.length>=100){
					alert(objs[i].name + "의 값을 확인해주세요.");
					objs[i].focus();
					if(objs[i].name="tBirth"){
						if(objs[i].value.legnth<8){
							alert(objs[i].name+"의 값을 확인해주세요.");
							objs[i].focus();
							return false;
					}
					return false;
				}
			}
		}
	}
	return true;
}
</script>
</body>
</html>