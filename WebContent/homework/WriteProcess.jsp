<%@page import="utils.JSFunction"%>
<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	글쓰기 페이지에서 오랫동안 머물러 세션이 소멸되는 경우가 
	발생할 수 있으므로, 쓰기 처리를 할때도 반드시 세션을
	확인해야 한다.
 -->
<%
request.setCharacterEncoding("UTF-8");
//폼값 받기
MembershipDAO dao = new MembershipDAO(application); 

String user_id = request.getParameter("user_id");//아이디
String pass1 = request.getParameter("pass1"); //패스워드 
String name = request.getParameter("name"); ///이름
String gender = request.getParameter("gender"); //성별
String birthday = request.getParameter("birthday");//생년월일
String zipcode = request.getParameter("zipcode"); //우편번호
String address1 = request.getParameter("address1"); // 상세주소1
String address2 = request.getParameter("address2"); //상세주소2
String email1 = request.getParameter("email1");//이메일
String email2 = request.getParameter("email2");//이메일
String mobile1 = request.getParameter("mobile1");//휴대폰번호
String mobile2 = request.getParameter("mobile2");//휴대폰번호
String mobile3 = request.getParameter("mobile3");//휴대폰번호
String tel1 = request.getParameter("tel1"); //전화번호
String tel2 = request.getParameter("tel2"); //전화번호
String tel3 = request.getParameter("tel3"); //전화번호

MembershipDTO param = new MembershipDTO();
param.setId(user_id); //아아디
param.setPw(pass1); //패스워드
param.setGender(gender);
param.setName(name);
param.setBirthday(birthday);
param.setZipcode(zipcode);
param.setAddress(address1 + " " + address2);
param.setEmail(email1 + "@" + email2);
param.setPhone(mobile1 +"-"+ mobile2 +"-"+ mobile3);
param.setTell(tel1 +"-"+ tel2 +"-"+ tel3);

/* 여러개의 게시물을 한꺼번에 입력할 때 사용하세요.
int iResult = 0;
for(int i=1; i<=100; i++) {
	dto.setTitle(i+"번째 "+title);
	iResult = dao.insertWrite(dto);
}
*/

int iResult = dao.insertWrite(param);
dao.close();
if(iResult==1) {
	response.sendRedirect("RegiFormValidate.jsp");
}
else {
	JSFunction.alertBack("회원가입에 실패하였습니다.", out);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>