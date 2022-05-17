package com.contents.comments;

import java.sql.Date;

import lombok.Data;

@Data
public class Comments_answerVO {
	private int idx;
	private int contents_idx;
	private int comments_idx;
	private String user_id;
	private String comments;
	private Date date;
	private int count;
}
