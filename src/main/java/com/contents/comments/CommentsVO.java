package com.contents.comments;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentsVO {
	private int idx;
	private String user_id;
	private int contents_idx;
	private String comment;
	private String score;
	private Date date;
	private int count;
}
