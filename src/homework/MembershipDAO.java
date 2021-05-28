package homework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import model1.board.BoardDTO;


public class MembershipDAO {

	
	//멤버변수
	Connection con; // 커넥션 객체를 멤버변수로 선언하여 DAO내에서 공유
	PreparedStatement psmt; //정적 쿼리전송 및 실행
	Statement stmt;
	ResultSet rs;
	
	//기본생성자를 통해 오라클 연결		
	public MembershipDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			String ur1 = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "kosmo";
			String pass = "1234";
			
			con = DriverManager.getConnection(ur1, id, pass);
			System.out.println("Oracle 연결성공");
		} 
		catch (Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
	}
	/*
		JSP에 컨텍스트 초기화 파라미터를 읽어서 매개변수로
		전달하여 DB연결을 하기위한 인자생성
	*/
	public MembershipDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pass = "1234";
			
			con = DriverManager.getConnection(url, id, pass);
			System.out.println("Oracle 연결성공");
		} 
		catch (Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
	}
	
	//그룹함수 count()를 통해 회원의 존재유무만 판단하는 메소드
	public boolean isMember(String id, String pass) {
		
		//쿼리문 작성
		String sql = "SELECT COUNT(*) FROM member "
					+ " WHERE id=? AND pass=?";
		
		int isMember = 0;
		boolean isFlag = false;
		
		try {
			// 쿼리문을 인수로 prepare객체를 생성한다. DM의 인덱스는 1부터 시작함.
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			//select쿼리문의 실행결과는 ResultSet객체를 통해 반환받는다.
			rs = psmt.executeQuery();
			//실행결과를 얻어오기 위해 next()를 호출하여 커서를 이동시킨다.
			rs.next();
			//실행결과중  첫번째 값을 얻어오기 위해 getInt()를 사용한다.
			isMember = rs.getInt(1);
			System.out.println("affected:" + isMember);
			if(isMember==0) // 회원이 아닌경우(아이디 패스워드로 회원을 찾을수 없음)
				isFlag = false;
			else //회원인 경우(아이디, 패스워드 일치함)
				isFlag = true;
		}
		catch (Exception e) {
			//예외가 발생한다면 확인이 불가하므로 무조건 false를 반환한다.
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
	
	/*
	로그인 방법2 : 쿼리문을 통해 회원인증 후 MemberDTO객체에 회원정보를
		저장한 후 JSP쪽으로 반환해준다.
	*/
	public MembershipDTO getMemberDTO(String uid, String upass) {
		
		//회원정보 저장을 위해 DTO객체 생성
		MembershipDTO dto = new MembershipDTO();
		
		//회원정보 조회를 위한 쿼리문 작성
		String query = "SELECT id, pass, name FROM "
				+ " member WHERE id=? AND pass=?";
		try {
			//prepared객체 생성
			psmt = con.prepareStatement(query);
			//인파라미터 설정
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			//쿼리문 실행
			rs = psmt.executeQuery();
			
			//오라클이 반환해준 ResultSet객체를 통해 결과값이 있는지 확인
			if(rs.next()) {
				//결과가 있다면 DTO객체에 회원정보 저장
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString(3));
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		
		return dto;
	}
	public Map<String, String> getMemberMap(String uid, String upass){
		
		//회원정보를 저장할 Map컬렉션 생성
		Map<String, String> maps = new HashMap<String, String>();
		
		String query = "SELECT id, pass, name FROM "
				+ " member WHERE id=? AND pass=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				maps.put("id", rs.getString(1)); // 아이디
				maps.put("pw", rs.getString(2)); //패스워드
				maps.put("name", rs.getString("name")); //이름
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberMap오류");
			e.printStackTrace();
		}
		//Map컬렉션에 저장된 회원정보 반환
		return maps;
	}
	/*
 	인자생성자2: JSP에서 인수로 인달했든 초기화 파라미터를 
 		생성자내에서 가져오기 위해 JSP에서는 application내장객체를
 		매개변수로 전달한다. 그러면 메소드 내에서 web.xml을
 		접근할 수 있다.
 	 */
 	public MembershipDAO(ServletContext application) {
		try {
			String drv = application.getInitParameter("JDBCDriver");
			String url = application.getInitParameter("ConnectionURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
						
			Class.forName(drv);
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("JDBC 연결성공");
		} 
		catch (Exception e) {
			System.out.println("JDBC 연결시 예외발생");
			e.printStackTrace();
		}
 	}
 	/*
 	데이터베이스 연결을 해제할때 사용하는 메소드.
 	한정된 자원을 사용하므로 사용을 마쳤다면 반드시 
 	연결을 해제해야 한다. 
 	*/
 	public void close() {
 		try {
 			if(rs!=null) rs.close();
 			if(psmt!=null) psmt.close();
 			if(con!=null) con.close();
 		}
 		catch (Exception e) {
 			System.out.println("Oracle 자원반납시 예외발생");
		}
 	}
 	
 	public int insertWrite(MembershipDTO dto) {
 		
 		//현재날짜 받아오기(오늘날짜로 jsp에서 처리하기)
// 		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
// 		String dateNow = date.format(new java.util.Date());
 	
 		
 		int result = 0;
 		try {
 			//인파라미터가 있는 insert 쿼리문 작성
 			String query = " INSERT INTO MEMBERSHIP ( "
 					+ " ID, PW, GENDER, EMAIL, TELL, NAME, BIRTHDAY, ADDRESS, ZIPCODE, PHONE) "
 					+ " VALUES ( "
 					+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
// 			prepare객체 생성후 인파라미터 설정
 			psmt = con.prepareStatement(query);
 			psmt.setString(1, dto.getId());
 			psmt.setString(2, dto.getPw());
 			psmt.setString(3, dto.getGender());
 			psmt.setString(4, dto.getEmail());
 			psmt.setString(5, dto.getTell());
 			psmt.setString(6, dto.getName());
 			psmt.setString(7, dto.getBirthday());
 			psmt.setString(8, dto.getAddress());
 			psmt.setString(9, dto.getZipcode()); 			
 			psmt.setString(10, dto.getPhone());
// 			psmt.setDate(11, dto.getJoindaDate());
// 			psmt.setString(1, "inaaaaaa");
// 			psmt.setString(2, "12aaa");
// 			psmt.setInt(3,  1234);
// 			psmt.setString(4, "dkdkdk");
// 			psmt.setString(5, "02-123-4567");
// 			psmt.setString(6, "이나");
// 			psmt.setString(7, "0203");
// 			psmt.setString(8, "서울시");
// 			psmt.setString(9, "010-1234-1234");
// 			psmt.setDate(10, (java.sql.Date.valueOf()));
 			//쿼리문 실행
 			result = psmt.executeUpdate();
 		}
 		catch (Exception e) {
 			System.out.println("회원가입 입력중 예외발생");
 			e.printStackTrace();
		}
 		return result;
 	}
 	public List<MembershipDTO> memberListPage(Map<String, Object> map) {
 		List<MembershipDTO> bbs = new Vector<MembershipDTO>();
 		/*
 		목록의 페이지 처리를 위해 레코드의 구간을 between으로 정해 
 		조회함
 		1번 : board테이블의 게시물을 일련번호의 내림차순으로 정렬
 		2번 : 1번의 조회결과에 rownum(순차적인 가상번호)를 부여함
 		3번 : 2번의 결과를 between으로 구간을 정해 조회함
 		※ 만약 게시판이 아닌 다른 테이블을 조회하고 싶다면 1번 쿼리문에서
 		테이블명만 변경하면 된다.
 		 */
 		String query = " "
 				+ " SELECT * FROM ( " 
 				+ "		SELECT Tb.*, ROWNUM rNum FROM ( "
 				+ "			SELECT * FROM membership ";
 		if(map.get("searchWord")!=null)
 		{
 			query += " WHERE " + map.get("searchField") + " "
 						+" LIKE '%"+map.get("searchWord")+"%' ";
 		}
 		query += " "
 				+"	ORDER BY joindate DESC "
 				+"	) tb "
 				+" ) "
 				+" WHERE rNum BETWEEN ? AND ?";
 		System.out.println("페이지쿼리:" + query);
 	 	
 		try {
 	 		psmt = con.prepareStatement(query);
 	 		//between절의 start와 end값을 인파라미터로 설정
 	 		psmt.setString(1, map.get("start").toString());
 	 		psmt.setString(2, map.get("end").toString());
 	 		rs = psmt.executeQuery();
 	 		while(rs.next()) {
 	 			MembershipDTO dto = new MembershipDTO();
 	 			
 	 				dto.setId(rs.getString("id"));
 	 				dto.setName(rs.getString("name"));
 	 				dto.setPhone(rs.getString("phone"));
 	 				dto.setEmail(rs.getString("email"));
 	 				dto.setJoindaDate(rs.getDate("joindate"));
 	 				
 	 				bbs.add(dto);
 	 		}
 	 	}
 	 	catch(Exception e) {
 	 		System.out.println("리스트출력중 예외발생");
 	 		e.printStackTrace();
 	 	}
 	 	return bbs;
 	}
 	public int selectCount(Map<String, Object> map) {
 		int totalCount = 0;
 		
 		//count() 그룹함수를 통해 쿼리문 작성
 		String query = "SELECT COUNT(*) FROM membership ";
 		
 		//검색 파라미터가 있는 경우라면 where절을 추가한다.
 		if(map.get("searchWord")!=null) {
 			query += " WHERE " + map.get("searchField") + " "
 					+ " LIKE '%" + map.get("searchWord") + "%' ";
 		}
// 		System.out.println(query);
 		try {
 			//Statement객체를 생성 (where다음에 ?가 아니기때문에)
 			stmt = con.createStatement();
 			//쿼리문 실행 및 결과반환
 			rs = stmt.executeQuery(query);
 			//결과를 읽기위해 커서 이동
 			rs.next();
 			//count(*)를 통한 쿼리의 결과는 무조건 정수이므로 getInt()로 읽어옴
 			totalCount = rs.getInt(1);
 		}
 		catch (Exception e) {
 			System.out.println("예외발생");
 			e.printStackTrace();
		}
 		
 		return totalCount;
 	}
 	
 	public MembershipDTO memberview(String id) {
 		//조회한 하나의 레코드를 저장할 DTO객체 생성
 		MembershipDTO dto = new MembershipDTO();
 		
 		//회원테이블과 게시판 테이블을 조인하여 조회함. 회원의 이름을
 		//가져오기 위함
 		String query = " SELECT * FROM MEMBERSHIP " +
 				" WHERE id=? ";
 		try {
 			psmt = con.prepareStatement(query);
 			psmt.setString(1, id);
 			rs = psmt.executeQuery();
 			/*
 			매개변수로 전달된 일려번호를 통해 조회하므로
 			결과는 무조건 1개만 나오게 된다. 따라서 if문으로
 			반환된 결과가 있는지만 확인하면 된다. 
 			*/
 			if(rs.next()) {
 				dto.setId(rs.getString("id"));
 				dto.setPw(rs.getString("pw"));
 				dto.setZipcode(rs.getString("zipcode"));
 				dto.setEmail(rs.getString("email"));
 				dto.setTell(rs.getString("tell"));
 				dto.setName(rs.getString("name"));
 				dto.setBirthday(rs.getString("birthday"));
 				dto.setAddress(rs.getString("address"));
 				dto.setPhone(rs.getString("phone"));
 				dto.setJoindaDate(rs.getDate("joindate"));
 			}
 		}
 		catch (Exception e) {
 			System.out.println("게시물 상세보기중 예외발생");
 			e.printStackTrace();
 		}
 		return dto;
 	}
 	
 }