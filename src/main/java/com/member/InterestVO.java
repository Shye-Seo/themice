package com.member;

import lombok.Data;

@Data
public class InterestVO {
	private String member_id;
	private int contents_idx;
	
	public InterestVO(String member_id, int contents_idx) {
		this.member_id = member_id;
		this.contents_idx = contents_idx;
	}
}