package com.payment;

import lombok.Data;

@Data
public class PaymentVO {
	private int idx;
	private String business_num;
	private String contents_idx;
	private String product_id;
	private String title;
	private String time;
	private String amount;
	private String consumer;
	private String entry_date;
	private String status;
	
	public PaymentVO(String business_num, String contents_idx, String product_id, String title, String amount, String consumer, String time,
			String entry_date, String status) {
		this.business_num = business_num;
		this.contents_idx = contents_idx;
		this.product_id = product_id;
		this.title = title;
		this.amount = amount;
		this.consumer = consumer;
		this.time = time;
		this.entry_date = entry_date;
		this.status = status;
	}

	public PaymentVO() {
		
	}
}
