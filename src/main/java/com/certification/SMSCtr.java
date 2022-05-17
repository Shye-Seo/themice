package com.certification;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.contents.ContentsSvc;
import com.member.MemberSvc;
import com.member.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class SMSCtr {
	
	@Autowired
	ContentsSvc service;
	
	@Autowired
	MemberSvc memberservice;
	
	CertificationVO sms = new CertificationVO();

	@RequestMapping(value = "sendSMS", method = RequestMethod.GET)
	public String getsms(HttpServletRequest request, ModelMap modelmap) {

		String tel = request.getParameter("tel");
		Send_SMS(tel);
		modelmap.addAttribute("tel", tel);
		return "view/certification/smsCheck";
	}

	@RequestMapping(value = "sendSMS", method = RequestMethod.POST)
	public String sendSms(HttpServletRequest request, ModelMap modelMap) {

		int certification = Integer.parseInt(request.getParameter("certification"));

		int checking = sms.getRandom_Number();

		int check = 1;

		if (certification == checking) {
			check = 0;
		}

		modelMap.addAttribute("check", check);
		return "view/certification/smsCheck";
	}
	
	@RequestMapping(value = "business_sendSMS", method = RequestMethod.GET)
	public String business_getsms(HttpServletRequest request, ModelMap modelmap) {

		String tel = request.getParameter("tel");
		Send_SMS(tel);
		modelmap.addAttribute("tel", tel);
		return "view/certification/business_smsCheck";
	}

	@RequestMapping(value = "business_sendSMS", method = RequestMethod.POST)
	public String busienss_sendSms(HttpServletRequest request, ModelMap modelMap) {

		int certification = Integer.parseInt(request.getParameter("certification"));

		int checking = sms.getRandom_Number();

		int check = 1;

		if (certification == checking) {
			check = 0;
		}

		modelMap.addAttribute("check", check);
		return "view/certification/business_smsCheck";
	}
	
	@RequestMapping(value = "member_id_tel_certification", method = RequestMethod.GET)
	public String member_id_tel_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "certification_type", required = false) String tel) throws Exception {
		
		session.setAttribute("name", name);
		session.setAttribute("tel", tel);
		session.setAttribute("certification_category", "tel");
		Send_SMS(tel);
		
		return "view/certification/member_id_certification";
	}
	
	@RequestMapping(value = "member_id_tel_certification", method = RequestMethod.POST)
	public String member_id_tel_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "num", required = false) int num) throws Exception {
		
		int checking = sms.getRandom_Number();
		
		int check = 1;

		if (num == checking) {
			check = 0;
		}
		
		modelMap.addAttribute("check", check);
		
		return "view/certification/member_id_certification";
	}
	
	@RequestMapping(value = "member_pw_tel_certification", method = RequestMethod.GET)
	public String member_pw_tel_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "certification_type", required = false) String tel) throws Exception {
		
		session.setAttribute("id", id);
		session.setAttribute("tel", tel);
		session.setAttribute("certification_category", "tel");
		Send_SMS(tel);
		
		return "view/certification/member_pw_certification";
	}
	
	@RequestMapping(value = "member_pw_tel_certification", method = RequestMethod.POST)
	public String member_pw_tel_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "num", required = false) int num) throws Exception {
		
		int checking = sms.getRandom_Number();
		
		int check = 1;
		
		if (num == checking) {
			check = 0;
		}
		
		modelMap.addAttribute("check", check);
		
		return "view/certification/member_pw_certification";
	}
	
	@RequestMapping(value = "business_pw_tel_certification", method = RequestMethod.GET)
	public String business_pw_tel_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "business", required = false) String business,
			@RequestParam(value = "certification_type", required = false) String tel) throws Exception {
		
		session.setAttribute("business", business);
		session.setAttribute("tel", tel);
		session.setAttribute("certification_category", "tel");
		Send_SMS(tel);
		
		return "view/certification/business_pw_certification";
	}
	
	@RequestMapping(value = "business_pw_tel_certification", method = RequestMethod.POST)
	public String business_pw_tel_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "num", required = false) int num) throws Exception {
		
		int checking = sms.getRandom_Number();
		
		int check = 1;
		
		if (num == checking) {
			check = 0;
		}
		
		modelMap.addAttribute("check", check);
		
		return "view/certification/business_pw_certification";
	}
	
	@RequestMapping(value = "send_m_sms", method = RequestMethod.POST)
	public @ResponseBody String send_m_sms(HttpServletRequest request, ModelMap modelMap, MemberVO vo,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "tel", defaultValue = "") String tel) {
		
		vo.setName(name);
		vo.setTel(tel);
		int check = 0;
		
		MemberVO mv = memberservice.member_tel_id_find(vo);
		if(mv == null) {
			check = 1;
			Send_SMS(tel);
		}
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "send_m_sms_check", method = RequestMethod.POST)
	public @ResponseBody String send_m_sms_check(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "certification", defaultValue = "") int certification) {
		
		int check = 0;
		int checking = sms.getRandom_Number();
		if(certification == checking) {
			check = 1;
		}

		return String.valueOf(check);
	}
	
	public void Send_SMS(String tel) {
		
		String api_key = "NCS9HI923SUSM5VF";
		String api_secret = "XLQEOJRXNGAIUHIFRGX5VUTCHEJV7D8N";
		
		Message coolsms = new Message(api_key, api_secret);
		HashMap<String, String> params = new HashMap<String, String>();

		int random = (int) (Math.random() * 899999) + 100000;
		
		sms.setRandom_Number(random);
		
		params.put("to", tel);
		params.put("from", "070-8722-6321");
		params.put("type", "SMS");
		params.put("text", "안녕하세요. 인증번호는 " + random + "입니다.");
		params.put("app_version", "test app 1.2");

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}
