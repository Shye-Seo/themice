package com.admin;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PhotoVo {
	// photo_uploader.html�������� form�±׳��� �����ϴ� file �±��� name��� ��ġ������
	private MultipartFile Filedata;
	// callback URL
	private String callback;
	// �ݹ��Լ�??
	private String callback_func;
}