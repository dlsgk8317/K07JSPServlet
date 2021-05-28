<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC패턴으로 회원인증하기</h2>
	<p>
		<strong>${authMessage }</strong>
		<br />
		<a href="./MemberAuth.mvc?id=ina&pass=1234">회원인증</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=kosmo&pass=1234">회원인증</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=inha&pass=1234">회원인증</a>
	</p>
</body>
</html>