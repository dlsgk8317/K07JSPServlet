<%@page import="utils.CookieManager"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//전송된 폼값을 받아온다.
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
//아이디저장 체크박스를 체크한 경우 전송되는 폼값
String save_check = request.getParameter("save_check");

//문자열을 통해 인증처리 한다.
if("must".equals(user_id) && "1234".equals(user_pw)) {
	//로그인에 성공하는경우 
	if(save_check!=null && save_check.equals("Y")){
		//아이디 저장 체크박스에 체크한 경우 쿠키를 생성한다.
		//쿠키명 : loginId, 쿠키값 : 입력한아이디, 유효시간 1일(86400)
		CookieManager.makeCookie(response, "loginId", user_id, 86400);
	}
	else {
		//체크박스에 체크를 하지않은경우 쿠키를 삭제한다.
		CookieManager.deleteCookie(response, "loginId");
	}
	//환영 메시지를 경고창으로 띄우고 로그인 페이지로 이동한다.
	JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
}
else {
	//로그인에 실패하는경우
	JSFunction.alertBack("로그인에 실패했습니다.", out);
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