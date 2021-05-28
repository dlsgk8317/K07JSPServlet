<%@page import="common.Myclass" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
	선언부 : 스크립트릿이나 표현식에서 사용할 메소드를 선언할떄 사용한다.
	함수는 중복해서 사용하는 경우가 많으므로 주로 scr를 사용한다.
 --%>    
<%!
public int add(int a, int b) {
	int result = a + b;
	return result;
}

public int subtract(int a, int b) {
	int result = a-b;
	return result;
}

public void showPrint(String str, JspWriter out) {
	try {
		out.println("받은문자열 : " + str);
	}
	catch(Exception e) {
		e.printStackTrace();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JSP의 스크립트 요소(Scripting Elements)</h2>
	
	<%@include file="../01Directive/IncludePage.jsp" %>
	
	<h4>src에 작성한 JAVA클래스 사용</h4>
	<%
	out.println("1~100까지의 합="  + Myclass.myFunc(1, 100));
	%>
	
	<%
	int value1= 3;
	int value2= 9;
	
	int addResult = add(value1, value2);
	int subResult = subtract(value1, value2);	
	%>
	
	<h3>표현식으로 변수를 화면에 출력하기</h3>
	<%= value1 %> + <%= value2 %> = <%= addResult %>
	<br />
	<%= value1 %> - <%= value2 %> = <%= subResult %>
	<br />
	
	<%
		showPrint("우리는KOSMO", out);
	%>
	<br />
	오늘 날짜는 : <%=todayStr %> [인클루드된 파일에서 가져옴]
	<%
	out.println("오늘날씨는 : " + todayStr);
	 %>
</body>
</html>