package com.notice;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int idx;
	private String title;
	private String contents;
	private String writer;
	private String views;
	private String start_day;
	private String end_day;
	private String file_path;
	private Date create_day;
	private String update_day;
	private String flag;
}