package com.business;

import java.sql.Date;

import lombok.Data;

@Data
public class BusinessVO {
	private int idx;
	private String business_num;
	private String password;
	private String business_name;
	private String address;
	private String detail_address;
	private String email;
	private String tel;
	private String fax;
	private String img_path;
	private Date sign_date;
	private String flag;
}