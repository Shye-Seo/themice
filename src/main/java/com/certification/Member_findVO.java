package com.certification;

import java.util.Date;

import lombok.Data;

@Data
public class Member_findVO {
	public Member_findVO(String name, String certification_type) {
		this.name = name;
		this.certification_type = certification_type;
	}
	
	public Member_findVO() {

	}

	private String id;
	private String name;
	private String certification_type;
	private Date sign_date;
}
