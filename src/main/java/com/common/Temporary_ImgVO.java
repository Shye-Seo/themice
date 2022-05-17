package com.common;

import lombok.Data;

@Data
public class Temporary_ImgVO {
	private String business_num;
	private String img_path;
	
	public Temporary_ImgVO(String business_num, String img_path) {
		this.business_num = business_num;
		this.img_path = img_path;
	}
}
