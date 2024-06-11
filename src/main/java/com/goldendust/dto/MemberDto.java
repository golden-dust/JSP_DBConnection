package com.goldendust.dto;

public class MemberDto {
	
	private int member_num;  // 기본 
	private String member_name;
	private String member_email;
	private String member_signuptime;
	
	public MemberDto() {
		super();
	}

	public MemberDto(int member_num, String member_name, String member_email, String member_signuptime) {
		super();
		this.member_num = member_num;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_signuptime = member_signuptime;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_signuptime() {
		return member_signuptime;
	}

	public void setMember_signuptime(String member_signuptime) {
		this.member_signuptime = member_signuptime;
	}
	
}
