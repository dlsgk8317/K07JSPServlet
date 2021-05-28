<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>전송방식(Post, Get테스트)</h2>
	<a href="RequestInfo1.jsp?paramNum=123&paramEng=Hello&paramHan=메롱메롱">
		Get방식</a>
		
	<h3>Post방식</h3> 
	<form action="RequestInfo" method="post">
		문자열입력 : <input type="text" name="paramHan" />
		<input type="submit" value="post방식" />
	</form>
	
	<h2>파라미터 및 값전달</h2>
<% 
 	String encodeName = URLEncoder.encode("홍길동", "UTF-8");
%>
	<a href="RequestParameter.jsp?name=<%=encodeName%>
		&id=hong&sexman&favorite=&self_intor=">Get방식</a>
	<br />
	<br />
	
	<script>
		function checkForm(f) {
			if(f.id.value=="") {
				alert("아이디를 입력해주세요.");
				f.id.focus();
				return false;
			}
		}
	</script>
	
	<form action="post" name="regFrm" action="RequestParameter.jsp"
		onsubmit="return checkForm(this);">
		이름 : <input type="text" name="name" value="홍길동" />
		<br />
		아이디 : <input type="text" name="id" value="" />
		<br />
		관심사항 :
			<input type="checkbox" name="favorite" 
				value="sport" checked="checked"/>스포츠
			<input type="checkbox" name="favorite"
				value="ecomomic"/>경제
			<input type="checkbox" name="favorite" />
	</form>
</body>
</html>