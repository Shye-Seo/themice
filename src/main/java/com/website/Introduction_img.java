package com.website;

import lombok.Data;

@Data
public class Introduction_img {
	private int idx;
	private int contents_idx;
	private String img_path;
	
	public Introduction_img(int contents_idx, String img_path) {
		this.contents_idx = contents_idx;
		this.img_path = img_path;
	}
}
