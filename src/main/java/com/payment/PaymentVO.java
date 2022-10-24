package com.payment;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int idx;
	private String contents_idx;
	private String business_num;
	private String id;
	private String name;
	private String tel;
	private String title;
	private String visit_date;
	private String ticket_amount;
	private String total;
	private Date payment_date;
	private String status;
	
	public PaymentVO(String contents_idx, String business_num, String id, String name, String tel,
			String title, String visit_date, String ticket_amount, String total, Date payment_date, String status) {
		this.contents_idx = contents_idx;
		this.business_num = business_num;
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.title = title;
		this.visit_date = visit_date;
		this.ticket_amount = ticket_amount;
		this.total = total;
		this.payment_date = payment_date;
		this.status = status;
	}

	public PaymentVO() {
		
	}
}
