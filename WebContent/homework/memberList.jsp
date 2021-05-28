<%@page import="utils.BoardPage"%>
<%@page import="java.util.List"%>
<%@page import="common.BoardConfig"%>
<%@page import="homework.MembershipDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="homework.MembershipDAO2"%>
<%@page import="homework.MembershipDTO"%>
    
<%
    MembershipDAO dao = new MembershipDAO(application); 
	
    Map<String, Object> insert = new HashMap<String, Object>();
    
    String searchField = request.getParameter("searchField");//검색할 필드명
    String searchWord = request.getParameter("searchWord");//검색어
    
    if(searchWord!=null) {
    	//검색필드와 검색어를 Map에 추가한다.
    	insert.put("searchField", searchField);
    	insert.put("searchWord", searchWord);	
    }

  //게시물의 전체 갯수를 카운트하기 위한 메소드 호출
    int totalCount = dao.selectCount(insert);

    /**** 페이지처리 start ****/
    int pageSize = BoardConfig.PAGE_PER_SIZE; //한페이지에 출력할 게시물의 수
    int blockPage = BoardConfig.PAGE_PER_BLOCK; // 한 블럭당 출력할 페이지번호의 수 
    int totalPage = (int)Math.ceil((double)totalCount/pageSize); //전체 페이지 수 계산
    int pageNum = 1; //목록 첫 진입시에는 무조건 1페이지로 지정
    //만약 파라미터로 전달된 페이지번호가 있다면
    String pageTemp = request.getParameter("pageNum"); 
    if(pageTemp!=null && !pageTemp.equals(""))
    	pageNum = Integer.parseInt(pageTemp); //해당 번호로 페이지번호를 지정한다.
    //목록을 페이지별로 구분하기 위해 between에 사용할 값 계산
    int start = (pageNum-1) * pageSize + 1;
    int end = pageNum * pageSize;
    //계산된 값은 Map컬렉션에 저장
    insert.put("start", start);
    insert.put("end", end);
    System.out.println(start+"="+end);
    /***페이지처리 end***/

    //목록에 실제 출력할 레코드를 얻어오기 위한 메소드 호출
    List<MembershipDTO> boardLists = dao.memberListPage(insert);
    //자원해제
    dao.close();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="get">
	<table border="1" width="100%">
	<h2>회원리스트</h2>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>이름</td>
		<td>핸드폰번호</td>
		<td>이메일</td>
		<td>가입날짜</td>
	</tr>
	</form>
	
<%
if(boardLists.isEmpty()) {
	//컬렉션에 저장된 데이터가 없다면
%>
	<tr>
		<td colspan="5" align="center">
			등록된 게시물이 없습니다^^*
		</td>
	</tr>
<%
}
else {
	//컬렉션에 저장된 데이터가 있다면 해당 내용을 반복하여 출력한다.
	int vNum = 0; //목록의 가상번호로 사용
	int countNum = 0;
	//List컬력션에 저장된 갯수만큼 반복하기 위해 확장for문 사용
	for(MembershipDTO dto : boardLists)
	{
		//현재 페이지 번호를 적용해서 가산번호 계산
		vNum = totalCount -(((pageNum-1) * pageSize) + countNum++);

		//getter()를 통해 출력한다.
%>
	<tr align="center">
		<td><%=vNum%></td> <!--  vNum-가상번호 -->
 		<td align="left"> 
			<a href="memberView.jsp?id=<%=dto.getId()%>"><%=dto.getId() %></a>
		</td>
		<td align="center"><%=dto.getName() %></td>
		<td align="center"><%=dto.getPhone() %></td>
		<td align="center"><%=dto.getEmail() %></td>
		<td align="center"><%=dto.getJoindaDate() %></td>
	</tr>
<%
	}
}
%>
	</table>
	<table border="1" width="100%">
		<!-- <tr align="right">
			<td><button type="button" onclick="location.href='Write.jsp';">
				글쓰기</button></td>
		</tr> -->
		<tr align="center">
		<td>			  
		<%=BoardPage.pagingStr(totalCount, pageSize,
 			blockPage, pageNum, request.getRequestURI())%>		
 		</td>
 		
 		<td>
 		<button type="button" onclick="location.href='RegiFormValidate.jsp';">
			회원가입바로가기	
		</button>	
		</td>
		
		</tr>
	</table>
</body>
</html>