package com.crawling;

import java.sql.Date;
import lombok.Data;

@Data
public class BexcoVO {
	private String title;
	private String besiness;
	private String start_day;
	private String end_day;
	private String time;
	private String address;
	private String tel;
	private String fax;
	private String web_address;
	private String price;
	private String contents;
	private String img_path;
	private Date create_day;
}
