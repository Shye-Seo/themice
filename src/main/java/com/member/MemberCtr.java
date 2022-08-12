package com.member;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.common.PagingVO_2;
import com.common.SHA256Util;
import com.common.ScriptUtils;
import com.common.loginVO;
import com.payment.PaymentVO;

@Controller
public class MemberCtr {

	@Autowired
	MemberSvc memberservice;

	@RequestMapping(value = "join", method = RequestMethod.GET)
	public String join() {
		return "view/join";
	}

	/** 회원가입 **/
	@RequestMapping(value = "memeber_join", method = RequestMethod.POST)
	public String join(HttpServletRequest request, MemberVO vo) throws IOException {

		String password = vo.getPassword();
		String encryption = SHA256Util.SHA256(password);
		
		vo.setPassword(encryption);

		String email = vo.getEmail() + "@" + request.getParameter("email_add");
		vo.setEmail(email);
		memberservice.join(vo);
		return "redirect:login";
	}
	
	/** 모바일 회원 가입 **/
	@RequestMapping(value = "m_memeber_join", method = RequestMethod.POST)
	public String m_join(HttpServletRequest request, MemberVO vo) throws IOException {
	
		String password = vo.getPassword();
		String encryption = SHA256Util.SHA256(password);
		vo.setPassword(encryption);
		memberservice.join(vo);
		return "view/login";
	}

	/** 아이디 중복 체크 **/
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public @ResponseBody String idCheck(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "id", defaultValue = "") String id) {

		boolean regular = true;
		int check = 1;
		for (int i = 0; i < id.length(); i++) {
			String sub = id.substring(i, i + 1);
			char c = sub.charAt(0);
			if ((c >= 'a' && c <= 'z') || (c >= '0' && c <= '9')) {
			} else {
				regular = false;
			}
		}

		if (id.length() >= 4 && id.length() <= 16) {
		} else {
			regular = false;
		}
		if (regular == true) {
			check = memberservice.idCheck(id);
		} else {
			check = 1;
		}
		return String.valueOf(check);
	}

	@RequestMapping(value = "login")
	public String login(HttpServletRequest request) {
		return "view/login";
	}

	/** 일반 회원 로그인 **/
	@RequestMapping(value = "member_login", method = RequestMethod.POST)
	public String member_login(HttpServletRequest request, loginVO vo, HttpServletResponse response) throws IOException {

		MemberVO member = memberservice.loginCheck(vo);
		if (member != null) {
			HttpSession session = request.getSession();
			session.setAttribute("id", member.getId());
			session.setAttribute("authority", "member");
			return "redirect:main";
		} else {
			ScriptUtils.alertAndMovePage(response, "아이디 비밀번호를 다시 입력해주세요.", "login");
		}
		
		return "view/login";
	}
	
	/** 휴대폰 중복 방지 **/
	@RequestMapping(value = "duplicate_member_tel", method = RequestMethod.POST)
	public @ResponseBody String duplicate_member_tel(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "tel", defaultValue = "") String tel) {
		
		int check = 1;
		MemberVO mv = memberservice.duplicate_member_tel(tel);
		if(mv == null) {
			check = 0;
		}
		return String.valueOf(check);
	}
	
	/** E-mail 중복 방지 **/
	@RequestMapping(value = "duplicate_member_email", method = RequestMethod.POST)
	public @ResponseBody String duplicate_member_email(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "email", defaultValue = "") String email) {
		
		int check = 1;
		MemberVO mv = memberservice.duplicate_member_email(email);
		if(mv == null) {
			check = 0;
		}
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "m_password_check", method = RequestMethod.POST)
	public String m_member_password_check(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			HttpSession session, MemberVO mo) throws IOException {

		String id = (String) session.getAttribute("id");
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "login");
		}
		mo.setId(id);
		mo = memberservice.member_password_check(mo);

		if (mo == null) {
			ScriptUtils.alertAndMovePage(response, "패스워드가 틀렸습니다.", "login_check");
		} else {
			return "redirect:mobile_mypage";
		}
		return "view/login_check";
	}
	
	@RequestMapping(value = "mobile_mypage")
	public String mobile_my_page(HttpSession session, HttpServletResponse response) throws IOException {
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "main");
		}
		
		return "view/member_page/mobile_mypage";
	}
	
	@RequestMapping(value = "password_check", method = RequestMethod.POST)
	public String member_password_check(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			HttpSession session, MemberVO mo) throws IOException {

		String id = (String) session.getAttribute("id");
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "login");
		}
		mo.setId(id);
		mo = memberservice.member_password_check(mo);

		if (mo == null) {
			ScriptUtils.alertAndMovePage(response, "패스워드가 틀렸습니다.", "login_check");
		} else {
			return "redirect:member_info";
		}
		return "view/member_info";
	}
	
	@RequestMapping(value = "member_pw_check", method = RequestMethod.POST)
	public @ResponseBody String member_pw_check(HttpSession session, HttpServletResponse response, MemberVO mo,
			@RequestParam(value = "current_password", defaultValue = "") String current_password) throws IOException {
		
		int check = 1;
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "login");
		}
		mo.setId(id);
		mo.setPassword(current_password);
		mo = memberservice.member_password_check(mo);
		
		if (mo == null) {
			check = 0;
		}
		
		return String.valueOf(check);
	}
	
	/** 회원정보 수정 **/
	@RequestMapping(value = "member_info", method = RequestMethod.GET)
	public String member_info(HttpServletRequest request, ModelMap modelMap, HttpSession session, MemberVO vo,
			HttpServletResponse response) throws IOException {
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "main");
		}
		MemberVO mv = memberservice.getMember_info(id);
		String email = mv.getEmail();
		String email_id = email.split("@")[0];
		String email_domain = email.split("@")[1];
		
		modelMap.addAttribute("mv", mv);
		modelMap.addAttribute("email_id", email_id);
		modelMap.addAttribute("email_domain",email_domain);
		
		return "view/member_page/member_info";
	}

	/** 회원정보 수정 
	 * @throws IOException **/
	@SuppressWarnings("null")
	@RequestMapping(value = "member_info_update", method = RequestMethod.POST)
	public String member_info_update(HttpServletRequest request, ModelMap modelMap, HttpSession session, MemberVO vo,
			HttpServletResponse response) throws IOException {
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "main");
		}
		
		String sql = "update member set name = '" + vo.getName() + "', tel = '" + vo.getTel() + "'";
		
		if(vo.getAddress() != null || !vo.getAddress().equals("")) {
			sql = sql + ", address = '" + vo.getAddress() + "'";
		}
		if(vo.getDetail_address() != null || !vo.getDetail_address().equals("")) {
			sql = sql + ", detail_address = '" + vo.getDetail_address() + "'";
		}
		if(vo.getEmail() != null || !vo.getEmail().equals("")) {
			sql = sql + ", email = '" + vo.getEmail() + "@" + request.getParameter("sel_email") + "'";
		}
		
		sql = sql + " where id = '" + id + "'";
		memberservice.set_member_update(sql);
		
		return "redirect:member_info";
	}
	
	@RequestMapping(value = "m_member_info_update", method = RequestMethod.POST)
	public String m_member_info_update(HttpServletRequest request, ModelMap modelMap, HttpSession session, MemberVO vo,
			HttpServletResponse response) throws IOException {
		
		String id = (String) session.getAttribute("id");
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "main");
		}
		
		vo.setId(id);
		memberservice.set_m_member_update(vo);
		
		return "redirect:mobile_mypage";
	}

	/** 회원정보 탈퇴 **/
	@RequestMapping(value = "member_secession", method = RequestMethod.GET)
	public String secession_password() {

		return "view/member_page/member_secession";
	}

	@RequestMapping(value = "member_secession", method = RequestMethod.POST)
	public String secession_password(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			HttpSession session, MemberVO mo) throws IOException {

		String id = (String) session.getAttribute("id");
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "main");
		}
		mo.setId(id);
		mo = memberservice.member_password_check(mo);

		if (mo == null) {
			ScriptUtils.alertAndMovePage(response, "패스워드가 틀렸습니다.", "password_check");
		} else {
			memberservice.member_secession(id);
			session.removeAttribute("id");
			return "redirect:main";
		}
		return "view/member_page/password_check";
	}

	/** 회원정보 비밀번호 수정 **/
	@RequestMapping(value = "member_password_update", method = RequestMethod.GET)
	public String member_password_update(HttpServletResponse response, HttpSession session) throws IOException {
		
		String id = (String) session.getAttribute("id");
		
		if(id == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "main");
		}
		
		return "view/member_page/member_password_update";
	}

	@RequestMapping(value = "member_password_update", method = RequestMethod.POST)
	public String member_password_update(HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap, HttpSession session, MemberVO mo) {
		
		String id = (String) session.getAttribute("id");
		String password = mo.getPassword();
		String encryption = SHA256Util.SHA256(password);
		mo.setPassword(encryption);
		mo.setId(id);
		memberservice.member_password_update(mo);

		return "view/member_page/member_info";
	}
	
	/** 회원 결재 내역 
	 * @throws IOException **/
	@RequestMapping(value = "member_payment")
	public String member_payment(ModelMap modelMap, HttpSession session, PagingVO_2 vo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "title", required = false) String title, HttpServletResponse response) throws IOException {
		
		String consumer = (String) session.getAttribute("id");
		
		if(consumer == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "main");
		}
		
		int total = memberservice.member_payment_count(consumer);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		vo = new PagingVO_2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		String sql = "";
		
		if(title != null) {
			sql = " and title like '%" + title + "%' ";
			modelMap.addAttribute("title", title);
		}
		
		vo.setSql(sql);
		vo.setConsumer(consumer);
		
		modelMap.addAttribute("paging", vo);
	
		if (total != 0) {
			List<PaymentVO> payment_list = memberservice.getMember_payment(vo);
			List<PaymentVO> m_payment_list = memberservice.getm_Member_payment(vo);
			modelMap.addAttribute("payment_list", payment_list);
			modelMap.addAttribute("m_payment_list", m_payment_list);
		}
		
		return "view/member_page/member_payment";
	}
	
	/** 개인 회원 아이디 비밀번호 찾기 **/
	@RequestMapping(value = "member_id_find", method = RequestMethod.GET)
	public String member_id_find() {
		return "view/member_page/member_id_find";
	}
	
	@RequestMapping(value = "member_email_id_find", method = RequestMethod.POST)
	public @ResponseBody String member_email_id_find(@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "email", defaultValue = "") String email) {
		
		int check = 1;
		
		
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setEmail(email);
		MemberVO member = memberservice.member_email_id_find(vo);
		
		if(member == null) {
			check = 0;
		};
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "member_tel_id_find", method = RequestMethod.POST)
	public @ResponseBody String member_tel_id_find(@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "tel", defaultValue = "") String tel) {
		
		int check = 1;
		
		MemberVO vo = new MemberVO();
		vo.setName(name);
		vo.setTel(tel);
		MemberVO member = memberservice.member_tel_id_find(vo);
		
		if(member == null) {
			check = 0;
		};
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "member_email_pw_find", method = RequestMethod.POST)
	public @ResponseBody String member_email_pw_find(@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "email", defaultValue = "") String email) {
		
		int check = 1;
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setEmail(email);
		MemberVO member = memberservice.member_email_pw_find(vo);
		
		if(member == null) {
			check = 0;
		};
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "member_tel_pw_find", method = RequestMethod.POST)
	public @ResponseBody String member_tel_pw_find(@RequestParam(value = "id", defaultValue = "") String id,
			@RequestParam(value = "tel", defaultValue = "") String tel) {
		
		int check = 1;
		
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setTel(tel);
		MemberVO member = memberservice.member_tel_pw_find(vo);
		
		if(member == null) {
			check = 0;
		};
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "member_pw_find", method = RequestMethod.GET)
	public String member_pw_find() {
		return "view/member_page/member_pw_find";
	}
	
	@RequestMapping(value = "member_id_result")
	public String member_id_result(ModelMap modelMap, HttpSession session, HttpServletResponse response) throws Exception {
		
		String name = (String) session.getAttribute("name");
		String email = (String) session.getAttribute("email");
		String tel = (String) session.getAttribute("tel");
		String certification_category = (String) session.getAttribute("certification_category");
		
		if(certification_category == null) {
			ScriptUtils.alertAndMovePage(response, "잘못된 접근입니다.", "main");
		} else {
			if(certification_category.equals("email")) {
				MemberVO vo = new MemberVO();
				vo.setName(name);
				vo.setEmail(email);
				MemberVO mv = memberservice.member_email_id_find(vo);
				modelMap.addAttribute("list", mv);
			} else if(certification_category.equals("tel")) {
				MemberVO vo = new MemberVO();
				vo.setName(name);
				vo.setTel(tel);
				MemberVO mv = memberservice.member_tel_id_find(vo);
				modelMap.addAttribute("list", mv);
			}
		}

		return "view/member_page/member_result";
	}
	
	@RequestMapping(value = "m_member_id_result")
	public String m_member_id_result(MemberVO vo, ModelMap modelMap) {
		
		MemberVO mv = memberservice.mobile_id_result(vo);
		modelMap.addAttribute("mv", mv);
		
		return "view/member_page/mobile_member_id_result";
	}
	
	@RequestMapping(value = "m_member_pw_result", method = RequestMethod.GET)
	public String m_member_pw_result(MemberVO vo, ModelMap modelMap) {
		
		modelMap.addAttribute("vo", vo);
		return "view/member_page/mobile_member_pw_result";
	}
	
	@RequestMapping(value = "m_member_pw_result", method = RequestMethod.POST)
	public String m_member_pw_result(MemberVO vo) {
		
		String password = vo.getPassword();
		
		String encryption = SHA256Util.SHA256(password);
		
		vo.setPassword(encryption);
		
		memberservice.member_password_update(vo);
		
		return "redirect:main";
	}
	
	@RequestMapping(value = "member_pw_result", method = RequestMethod.GET)
	public String member_pw_result() {
		return "view/member_page/member_pw_result";
	}
	
	@RequestMapping(value = "member_pw_result", method = RequestMethod.POST)
	public @ResponseBody String member_pw_result(@RequestParam(value = "password", defaultValue = "") String password,
			HttpSession session, MemberVO vo) {
		
		int check = 1;
		String id = (String) session.getAttribute("id");
		
		if(id == null) {
			check = 0;
		} else {
			String encryption = SHA256Util.SHA256(password);
			vo.setPassword(encryption);
			vo.setId(id);
			memberservice.member_password_update(vo);
		}
		return String.valueOf(check);
	}

	/** 로그아웃 **/
	@RequestMapping(value = "logout")
	public String Logout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		session.removeAttribute("id");
		session.removeAttribute("business_id");

		return "redirect:main";
	}
}