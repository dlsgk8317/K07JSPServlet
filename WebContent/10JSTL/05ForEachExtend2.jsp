<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>확장 for문 형태의 forEach태그</h2>
	<%
	String[] colors = {"red", "green", "blue", "#573838"};
	%>
	
	<h3>JSP코드로 배열출력</h3>
	<%
		for(String c : colors) { %>
		<h4 style="color:<%=c %>;">JSP코드로 출력</h4>
	<% } %>
	
	<h3>JSTL 및 EL로 배열출력</h3>
	<c:set var="colors" value="<%=colors %>" />
	<c:forEach items="${colors }" var="c">
		<h4 style="color:${c};">
			JSTL로 출력
		</h4>
	</c:forEach>
	
	<h3>varStatus속성 알아보기</h3>
	<c:forEach items="${colors }" var="c" varStatus="loopStatus">
	<h4>${loopStatus.count }번째 반복</h4>
	<ul>
		<li>index : ${loopStatus.index }</li>
		<li>first : ${loopStatus.first }</li>
		<li>last : ${loopStatus.last }</li>
		<li>current : ${loopStatus.current }</li>
	</ul>
	</c:forEach>
	
	<h3>리스트 계열의 컬렉션</h3>
	<%
	List<MemberDTO> lists = new Vector<MemberDTO>();
	lists.add(new MemberDTO("Hong", "1111", "홍씨", null));
	lists.add(new MemberDTO("Park", "2222", "박씨", null));
	lists.add(new MemberDTO("Sung", "3333", "성씨", null));
	%>
	
	<c:set var="lists" value="<%=lists %>"/>
	
	<h3>일반 for문 형태의 JSTL의 forEach태그</h3>
	<ul>
		<c:forEach begin="0" end="${lists.size()-1 }" var="i">
		<li>
			아이디 : ${lists[i].id },
			패스워드 : ${lists[i].pass },
			이름 : ${lists[i].name }
		</li>
		</c:forEach>
	</ul>
	<h3>확장 for문 형태의 JSTL의 forEach태그</h3>
	<ul>
		<c:forEach items="${lists }" var="list">
			<li>
			아이디 : ${list.id },
			비번 : ${list.pass },
			이름 : %{list.name}
			</li>
		</c:forEach>
	</ul>
	
	<h3>맵 계열 컬렉션 사용</h3>
	<%
	Map<String, MemberDTO> maps = new HashMap<String, MemberDTO>();
	
	maps.put("first", lists.get(0));
	maps.put("second", lists.get(1));
	maps.put("third", lists.get(1));
	%>
	<c:set var="maps" value="<%=maps %>"/>
	
	<h4>키값을 알고 있을때 : EL변수, 키값 혹은 EL변수["키값"]</h4>
	<ul>
		<li>
			아이디:${maps.first.id },
			비번:${maps.first.pass },
			이름:${maps.first.name },
			
		</li>
		
		<li>
			아이디:${maps.second.id },
			비번:${maps.second.pass },
			이름:${maps.second.name },
		</li>
		
		<li>
			아이디:${maps.third.id },
			비번:${maps.third.pass },
			이름:${maps.third.name },		
		</li>
	</ul>
</body>
</html>