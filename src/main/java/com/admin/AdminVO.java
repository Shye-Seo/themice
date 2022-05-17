package com.admin;

import lombok.Data;

@Data
public class AdminVO {
	private int idx;
	private int authority;
	private String id;
	private String password;
	private String create_day;
	private String update_day;
}
