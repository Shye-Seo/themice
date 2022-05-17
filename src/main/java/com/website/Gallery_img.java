package com.website;

import lombok.Data;

@Data
public class Gallery_img {
	private int idx;
	private int contents_idx;
	private int gallery_idx;
	private String img_path;
	
	public Gallery_img(int contents_idx, int gallery_idx, String img_path) {
		this.contents_idx = contents_idx;
		this.gallery_idx = gallery_idx;
		this.img_path = img_path;
	}
}
