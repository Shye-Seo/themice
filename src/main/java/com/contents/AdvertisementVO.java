package com.contents;

import java.util.Date;

import lombok.Data;

@Data
public class AdvertisementVO {
	private int idx;
	private String business_name;
	private String title;
	private String sub_title;
	private String link_address;
	private String start_day;
	private String end_day;
	private String price;
	private String img_path;
	private Date carea_day;
	private String flag;
}
