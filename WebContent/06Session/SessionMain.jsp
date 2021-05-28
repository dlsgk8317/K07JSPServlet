<%@page import="com.sun.source.tree.LabeledStatementTree"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 유지시간 확인하기</h2>
	<p>
		<%=session.getMaxInactiveInterval() %>
		<%-- getMaxInactiveInterval() :
		세션을 유지할 시간을 초단위로 설정한다.  --%>
		<%-- 기본유지시간은 설정하지않으면 30분으로 설정된다 --%>
	</p>
	
	<h2>세션 유지시간 session내장객체로 설정하기</h2>
	<%
	session.setMaxInactiveInterval(1000);
	%>
	
	<h2>세션 아이디 확인하기</h2>
	<p>
		<%=session.getId() %>
	</p>
	
	<h2>세션의 최초 / 마지막 요청시간</h2>
	<%
	long createTime = session.getCreationTime(); //getCreationTime 세션의 최초요청시간
	SimpleDateFormat s = new SimpleDateFormat("HH:mm:ss");
	String creationTimeString = s.format(new Date(createTime));
	
	long lastTime = session.getLastAccessedTime(); // getLastAccessedTime 세션의 마지막 요청시간
	String lastTimeString = s.format(new Date(lastTime));
	%>
	<ul>
		<li>최초요청시간 : <%=creationTimeString %></li>
		<li>마지막요청시간 : <%=lastTimeString %></li>
	</ul>
</body>
</html>