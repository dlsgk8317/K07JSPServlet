<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/MyTagLib.tld" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>choose~when~otherwise 태그</h2>
	
	<c:set var="numVar" value="101"/>
	<c:set var="strVar">자바</c:set>
	
	<h3>choose 태그로 홀짝 판단하기</h3>
	<c:choose>
		<c:when test="${numVar mod 2 eq 0 }">
			${numVar }는 짝수입니다.
		</c:when>
		<c:otherwise>
			${numVar }는 홀수입니다.
		</c:otherwise>
	</c:choose>
	
	<h3>국영수 점수를 입력받아 평균점수로 학점출력</h3>
	<h4>점수를 입력하세요.</h4>
	<form>
		국어 : <input type="text" name="kor" /><br />
		영여 : <input type="text" name="eng" /><br />
		수학 : <input type="text" name="math" /><br />
		<input type="submit" value="학점구하기" />		
	</form>
	
	<c:if test="${not empty param.kor }">
		
		<c:set var="avg" value="${(param.kor+param.eng+param.math)/3 }"/>
		귀하의 평균점수는 ${avg }입니다.
		<br />
		<c:choose>
			<c:when test="${avg >=90 }">A학점</c:when>
			<c:when test="${avg ge 80 }">B학점</c:when>
			<c:when test="${avg ge 70 }">C학점</c:when>
			<c:when test="${avg ge 60 }">D학점</c:when>
		<c:otherwise>F학점</c:otherwise>
		</c:choose>		
	</c:if>
	
	<h3>로그인 구현(JDBC사용)</h3>
	<form>
		아이디:<input type="text" name="userid" />
		<br />
		패스워드:<input type="password" name="userpw" />
		<br />
		<input type="submit" value="로그인" />
	</form>
	
	<h3>EL에서 메소드 호출1</h3>
	<c:if test="${not empty param.userid }">
		<c:choose>
			<c:when test="${my:memberLogin(param.userid,param.userpw,initParam.JDBCDriver, initParam.ConnectionURL) }">
				${param.userid }회원님, 반갑습니다.
			</c:when>
			<c:otherwise>
				넌 회원이 아니군요!;
			</c:otherwise>
		</c:choose>
	</c:if>
</body>
</html>