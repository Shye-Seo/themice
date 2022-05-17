package com.certification;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.contents.ContentsSvc;
import com.member.MemberSvc;
import com.member.MemberVO;

@Controller
public class Email_certification {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	ContentsSvc service;
	
	@Autowired
	MemberSvc memberservice;
	
	CertificationVO sms = new CertificationVO();

	@RequestMapping(value = "member_id_email_certification", method = RequestMethod.GET)
	public String emailCertify(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "certification_type", required = false) String email) throws Exception {
		int certification = Send_Email(email);
		session.setMaxInactiveInterval(60 * 10);
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		session.setAttribute("certification", certification);
		session.setAttribute("certification_category", "email");
		return "view/certification/member_id_certification";
	}

	@RequestMapping(value = "member_id_email_certification", method = RequestMethod.POST)
	public String emailCertify(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "num", required = false) int num) throws Exception {
		
		int certification = (Integer) session.getAttribute("certification");
		int check = 1;
		if(certification == num) {
			check = 0;
		}
		
		modelMap.addAttribute("check", check);
		return "view/certification/member_id_certification";
	}
	
	@RequestMapping(value = "member_pw_email_certification", method = RequestMethod.GET)
	public String member_pw_email_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "certification_type", required = false) String email) throws Exception {
		int certification = Send_Email(email);
		session.setMaxInactiveInterval(60 * 10);
		session.setAttribute("id", id);
		session.setAttribute("email", email);
		session.setAttribute("certification", certification);
		session.setAttribute("certification_category", "email");
		return "view/certification/member_pw_certification";
	}

	@RequestMapping(value = "member_pw_email_certification", method = RequestMethod.POST)
	public String member_pw_email_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "num", required = false) int num) throws Exception {
		
		int certification = (Integer) session.getAttribute("certification");
		int check = 1;
		if(certification == num) {
			check = 0;
		}
		
		modelMap.addAttribute("check", check);
		return "view/certification/member_pw_certification";
	}
	
	@RequestMapping(value = "business_pw_email_certification", method = RequestMethod.GET)
	public String business_pw_email_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "business_num", required = false) String business_num,
			@RequestParam(value = "certification_type", required = false) String email) throws Exception {
		int certification = Send_Email(email);
		session.setMaxInactiveInterval(60 * 10);
		session.setAttribute("business_num", business_num);
		session.setAttribute("email", email);
		session.setAttribute("certification", certification);
		session.setAttribute("certification_category", "email");
		return "view/certification/business_pw_certification";
	}

	@RequestMapping(value = "business_pw_email_certification", method = RequestMethod.POST)
	public String business_pw_email_certification(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "num", required = false) int num) throws Exception {
		
		int certification = (Integer) session.getAttribute("certification");
		int check = 1;
		if(certification == num) {
			check = 0;
		}
		
		modelMap.addAttribute("check", check);
		return "view/certification/business_pw_certification";
	}
	
	@RequestMapping(value = "send_m_email", method = RequestMethod.POST)
	public @ResponseBody String send_m_email(HttpServletRequest request, ModelMap modelMap, MemberVO vo,
			@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "email", defaultValue = "") String email) throws Exception {
		
		int check = 0;
		
		vo.setName(name);
		vo.setEmail(email);
		MemberVO mv = memberservice.member_email_id_find(vo);
		
		if(mv != null) {
			check = 1;
			Send_Email(email);
		}

		return String.valueOf(check);
	}
	
	@RequestMapping(value = "send_m_email_pw", method = RequestMethod.POST)
	public @ResponseBody String send_m_email_pw(HttpServletRequest request, ModelMap modelMap, MemberVO vo,
			@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "email", defaultValue = "") String email) throws Exception {
		
		int check = 0;
		
		vo.setName(id);
		vo.setEmail(email);
		MemberVO mv = memberservice.member_email_pw_find(vo);
		
		if(mv != null) {
			check = 1;
			Send_Email(email);
		}

		return String.valueOf(check);
	}
	
	@RequestMapping(value = "send_m_email_check", method = RequestMethod.POST)
	public @ResponseBody String send_m_email_check(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "certification", defaultValue = "") int certification) throws Exception {
		
		int check = 0;
		int checking = sms.getRandom_Number();
		if(certification == checking) {
			check = 1;
		}

		return String.valueOf(check);
	}
	
	public int Send_Email(String email) throws Exception {
		
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
		
		int certification = (int) (Math.random() * 899999) + 100000;
		
		sms.setRandom_Number(certification);
		
		messageHelper.setFrom("d.yuseok@gmail.com"); // 보내는사람 생략하거나 하면 정상작동을 안함
		messageHelper.setTo(email); // 받는사람 이메일
		messageHelper.setSubject("THE MICE 인증번호"); // 메일제목은 생략이 가능하다
		messageHelper.setText("안녕하세요. THE MICE 인증번호는 : " + certification + " 입니다."); // 메일 내용
		
		mailSender.send(message);
		
		return certification;
	}
}
