<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
include 지시어 : 공통으로 사용할 JSP파일을 생성한 후 
	현재문서에 포함시킬때 사용한다. 각각의 JSP파일 상단에는
	반드시 page 지시어가 삽입되어야 한다.
	단, 하나의 JSP파일에서 page지시어가 중복선언되면 안된다.
--%>
<%@ include file = "IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS코드는 양이 많으므로 외부파일로 선언하여 현재문서에 링크시킨다. -->
<link rel="stylesheet" href="./css/div_layout.css" />

</head>
<body>

<div class="AllWrap">
	<div class="header">
	<!-- GNB영역 -->
	<%@ include file="../common/Top.jsp" %>
	</div>
	<div class="body">
		<div class="left_menu">
		<!-- LNB영역(Local Navigation Bar) -->
		<%@ include file="../common/Left.jsp" %>
		</div>
		<div class="contents">
			<!-- Contents 영역 -->
			
			<h2>오늘의 날짜 : <%=todayStr %></h2>
			<br /><br />
			
			(서울=뉴스1) 정혜민 기자 = 11일 화요일은 전국 대부분 지역의 낮 기온이 20도 이상으로 오르겠다. 특히 수도권과 강원내륙, 충남권은 25도 이상까지 오를 전망이다. 남부지방에서는 오전까지 비가 이어지겠다.
			<br /><br />
			기상청은 이날 동해상에 위치한 고기압의 가장자리에 들지만 제주도는 중국 상하이 부근에서 북동진하는 저기압의 영향을 차차 받는다고 10일 예보했다.
			<br /><br />
			충청권북부와 경북북부는 이날 새벽 비가 그치겠지만 충청권남부와 전북, 경북권남부, 경남권북부는 아침에야 그칠 전망이다. 제주도는 오후까지 비가 이어지겠다.
			<br /><br />
			아침 최저기온은 8~15도, 낮 최고기온은 17~27도로 예상된다. 중부내륙과 경북내륙을 중심으로 낮과 밤의 기온차가 15도 이상으로 크겠으니 건강관리에 주의해야 한다.
			<br /><br />
			지역별 예상 최저기온은 Δ서울 11도 Δ인천 12도 Δ춘천 8도 Δ강릉 12도 Δ대전 12도 Δ대구 12도 Δ부산 14도 Δ전주 14도 Δ광주 15도 Δ제주 18도다.
			<br /><br />
			낮 예상 최고기온은 Δ서울 26도 Δ인천 24도 Δ춘천 27도 Δ강릉 21도 Δ대전 23도 Δ대구 21도 Δ부산 18도 Δ전주 23도 Δ광주 23도 Δ제주 22도다.
			<br /><br />
			미세먼지와 초미세먼지 농도는 전국이 '좋음'으로 예상된다.
			<br /><br />
			건조특보가 발효된 강원영동과 경남권해안은 대기가 매우 건조하겠으며 이밖의 지역도 건조할 전망이다.
			<br /><br />
			바다의 물결은 서해와 동해 앞바다 0.5~2m, 남해 앞바다 0.5~2.5m로 일겠다. 서해와 남해 먼바다 파고는 최고 4m, 남해 먼바다는 최고 3m로 전망된다.
			<br /><br />
		</div>
	</div>
	<div class="copyright">
	<!-- Copyright -->
		<%@ include file="../common/Copyright.jsp" %>
	</div>
</div>

</body>
</html>