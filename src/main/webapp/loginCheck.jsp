<%@page import="java.util.Enumeration"%> //Enumeration 자동 완성시 자동 생성
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 체크</title>
</head>
<body>
	<%
		String sessionId = (String) session.getAttribute("sessionid");
		String name = "";	
	
		if(sessionId == null) {//참이면 비로기인 상태, 거짓이면 로그인을 한 상태
			out.println("로그인 페이지로 이동하세요!!");
	%>
		<br><a href="login.jsp">로그인 페이지로 이동</a>
	<%
		} else {
			out.println(sessionId + "님 로그인 중<br>");
			Enumeration session = session.getAttributeNames();
			
			while(session.hasMoreElements()) {
				name = session.nextElement().toString();//세션안에 들어있는 속성들의 이름을 가져옴
				out.println("세션내 속성 이름:"+name);
				String sessionValue = (String) session.getAttribute(name);
				out.println("세션내 속성 값:"+sessionValue+"<br>");
			}
		}
	%>
	<hr>
	<a href="sessionTest.jsp">세션 테스트로 가기</a>
</body>
</html>