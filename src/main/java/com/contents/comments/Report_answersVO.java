package com.contents.comments;

import java.util.Date;

import lombok.Data;

@Data
public class Report_answersVO {
	private int idx;
	private int answers_idx;
	private String reporter;
	private String report_target;
	private String report_content;
	private Date report_date;
}