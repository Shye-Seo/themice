package com.notice;

import java.util.Date;

import lombok.Data;

@Data
public class Notice_ImgVO {
	private int idx;
	private int notice_idx;
	private String name;
	private String img_path;
	private Date date;

	public Notice_ImgVO(int notice_idx, String name, String img_path) {
		this.notice_idx = notice_idx;
		this.name = name;
		this.img_path = img_path;
	}
}
