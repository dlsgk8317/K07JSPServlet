package homework;

import java.sql.Date;

public class MembershipDTO {

	private String id;
	private String pw;
	private String gender; //성별
	private String email;
	private String tell; // 전화번호 
	private String name;
	private String birthday; 
	private String address;
	private String zipcode;
	private String phone; //핸드폰번호 
	private java.sql.Date joindaDate; //가입일
	
	public MembershipDTO() {
		
	}

	public MembershipDTO(String id, String pw, String gender, String email, String tell, String name, String birthday,
			String address, String phone, Date joindaDate) {
		super();
		this.id = id;
		this.pw = pw;
		this.gender = gender;
		this.email = email;
		this.tell = tell;
		this.name = name;
		this.birthday = birthday;
		this.address = address;
		this.phone = phone;
		this.joindaDate = joindaDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTell() {
		return tell;
	}

	public void setTell(String tell) {
		this.tell = tell;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public java.sql.Date getJoindaDate() {
		return joindaDate;
	}

	public void setJoindaDate(java.sql.Date joindaDate) {
		this.joindaDate = joindaDate;
	}
	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	
	
	
}
