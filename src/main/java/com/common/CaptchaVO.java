package com.common;

import lombok.Data;

@Data
public class CaptchaVO {
	private String captcha;
	
	public CaptchaVO(String captcha) {
		this.captcha = captcha;
	}

	public CaptchaVO() {
		
	}
}
