<%@page import="homework.MembershipDAO"%>
<%@page import="homework.MembershipDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	MembershipDAO dao = new MembershipDAO(application);
	MembershipDTO dto = dao.memberview(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="70%">
	<tr>
		<td>아이디</td>
		<td><%=dto.getId() %></td>
		<td>이름</td>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=dto.getPw() %></td>
		<td>생년월일</td>
		<td><%=dto.getBirthday() %></td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td><%=dto.getZipcode() %></td>
		<td>전체주소</td>
		<td><%=dto.getAddress() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=dto.getEmail() %></td>
		<td>휴대폰번호</td>
		<td><%=dto.getPhone() %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=dto.getTell() %></td>
		<td>회원가입일</td>
		<td><%=dto.getJoindaDate() %></td>
	</tr>
	
	<tr>
		<button type="button" onclick="location.href='memberList.jsp';">
			리스트바로가기	
		</button>
	</tr>
	
	</table>
	</form>
	
</body>
</html>