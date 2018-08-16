<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/common.jsp"%>
<body>
<form>
	이름  : <input type="text" name="name"><br>
	나이  : <input type="text" name="age"><br>
	취미  : 영화<input type="checkbox" name="hobby" value="영화">
	음악감상<input type="checkbox" name="hobby" value="음악감상">
	게임<input type="checkbox" name="hobby" value="게임"><br>
	<button>전송</button>
</form>
<%
String age = request.getParameter("age");
String name = request.getParameter("name");
Map<String,String[]> hobby = new HashMap<String,String[]>();
hobby = request.getParameterMap();

if(age!=null){
	out.print(name +"의 나이는 " + age +"세, ");
	int ageInt = Integer.parseInt(age);
	if(0<ageInt&&ageInt<10){
		out.print("유아입니다.");
	}else if(1<=ageInt&&ageInt<20){
		out.print("10대입니다.");
	}else if(1<=ageInt&&ageInt<30){
		out.print("20대입니다.");
	}else if(1<=ageInt&&ageInt<40){
		out.print("30대입니다.");
	}else if(1<=ageInt&&ageInt<50){
		out.print("40대입니다.");
	}else if(1<=ageInt&&ageInt<60){
		out.print("50대입니다.");
	}else{
		out.print("노년입니다");
	}
	out.print("<br>");
}
Iterator<String> it = hobby.keySet().iterator();
if(hobby!=null){
	String[] val = null;
	while(it.hasNext()){
		String key = it.next();
		 val = hobby.get(key);
		out.print(key + "는 ");
		String s = "";
		for(String str: val){
			s += str +",";
		}
		s = s.substring(0,s.length()-1);
		out.print(s+"이시군요<br>");
	}
}
%>
</body>
</html>