package com.contents;

import java.sql.Date;

import lombok.Data;

@Data
public class ContentsVO {
	private int idx;
	private String business_num;
	private String business;
	private String title;
	private String start_day;
	private String end_day;
	private String start_time;
	private String end_time;
	private String time;
	private String tel;
	private String address;
	private String detail_address;
	private String price;
	private String age;
	private String exhn_type;
	private String font_type;
	private int layout_type; // 뭔가 이상..
	private int pattern;
	private String background_color;
	private String key_word;
	private int views;
	private String grade;
	private String sub_title;
	private String content;
	private String img_path;
	private String web_address;
	private Date create_day;
	private String update_day;
	private String flag;
	private int crawling_num;
	private String website_type;
	private String web_main_name;
	private String logo_name;
	private String banner_name;
	private String menu_item;

	public ContentsVO() {
		
	}
}
