package com.common;

import lombok.Data;

@Data
public class ImgVO {
	private int contents_idx;
	private int img_seq;
	private String img_path;
	
	public ImgVO(int contents_idx, int img_seq, String img_path) {
		this.contents_idx = contents_idx;
		this.img_seq = img_seq;
		this.img_path = img_path;
	}
}
