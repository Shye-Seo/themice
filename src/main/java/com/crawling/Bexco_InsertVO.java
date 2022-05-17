package com.crawling;

import lombok.Data;

@Data
public class Bexco_InsertVO {
	private String title;
	private String business;
	private String start_day;
	private String end_day;
	private String time;
	private String address;
	private String tel;
	private String fax;
	private String web_address;
	private String price;
	private String content;
	private String img_path;

	public Bexco_InsertVO() {
	}

	public Bexco_InsertVO(String title, String business, String start_day, String end_day, String time, String address,
			String tel, String fax, String web_address, String price, String content, String img_path) {
		this.title = title;
		this.business = business;
		this.start_day = start_day;
		this.end_day = end_day;
		this.time = time;
		this.address = address;
		this.tel = tel;
		this.fax = fax;
		this.web_address = web_address;
		this.price = price;
		this.content = content;
		this.img_path = img_path;
	}
}
