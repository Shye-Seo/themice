package com.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Message {

	@RequestMapping(value = "message")
	public String login_check() {

		return "message/message";
	}
}
