package com.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int idx;
	private String id;
	private String password;
	private String name;
	private String address;
	private String detail_address;
	private String email;
	private String tel;
	private Date sign_date;
	private String flag;
	
	public MemberVO(String id, String password) {
		this.id = id;
		this.password = password;
	}
	
	public MemberVO() {
		
	}
}
