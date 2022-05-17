package com.contents.comments;

import java.util.Date;

import lombok.Data;

@Data
public class Report_commentsVO {
	private int idx;
	private int comments_idx;
	private String reporter;
	private String report_target;
	private String report_content;
	private Date report_date;
}
