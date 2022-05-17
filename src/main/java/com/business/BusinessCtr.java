package com.business;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.common.ImgVO;
import com.common.PagingVO;
import com.common.PagingVO_2;
import com.common.SHA256Util;
import com.common.ScriptUtils;
import com.common.loginVO;
import com.contents.ContentsVO;
import com.member.MemberVO;
import com.payment.PaymentVO;

@Controller
public class BusinessCtr {

	@Autowired
	BusinessSvc service;

	@Resource(name = "business_path")
	String uploadPath;

	@RequestMapping(value = "business_join", method = RequestMethod.GET)
	public String business_join() {
		return "view/join";
	}

	@RequestMapping(value = "business_join", method = RequestMethod.POST)
	public String business_insert(BusinessVO vo, MultipartFile file) throws IOException {
		
		String imgName = file.getOriginalFilename();
		File target = new File(uploadPath, imgName);
		FileCopyUtils.copy(file.getBytes(), target);
		
		vo.setImg_path(imgName);

		String password = vo.getPassword();
		String encryption = SHA256Util.SHA256(password);
		vo.setPassword(encryption);
		service.businessJoin(vo);
		return "view/login";
	}

	@RequestMapping(value = "business_login", method = RequestMethod.POST)
	public String business_login(HttpServletResponse response, HttpServletRequest request, loginVO vo) throws IOException {

		BusinessVO business = service.BusinessCheck(vo);
		if (business != null) {
			HttpSession session = request.getSession();
			session.setAttribute("business_id", business.getBusiness_num());
			session.setAttribute("authority", "business");
		} else {
			ScriptUtils.alertAndMovePage(response, "아이디 비밀번호를 다시 입력해주세요.", "login");
		}
		return "view/select";
	}
	
	@RequestMapping(value = "business_num_check", method = RequestMethod.POST)
	public @ResponseBody String business_num_check(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "business_num", defaultValue = "") String business_num) {

		int check = 1;
		
		BusinessVO vo = service.business_num_check(business_num);
		if(vo == null) {
			check = 0;
		}
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "duplicate_business_email", method = RequestMethod.POST)
	public @ResponseBody String duplicate_business_email(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "email", defaultValue = "") String email) {

		int check = 1;
		
		BusinessVO vo = service.duplicate_business_email(email);
		if(vo == null) {
			check = 0;
		}
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "business_pw_check", method = RequestMethod.POST)
	public @ResponseBody String business_pw_check(HttpSession session, HttpServletResponse response, BusinessVO mo,
			@RequestParam(value = "current_password", defaultValue = "") String current_password) throws IOException {
		
		int check = 1;
		
		String business_num = (String) session.getAttribute("business_id");
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "login");
		}
		
		mo.setBusiness_num(business_num);
		mo.setPassword(current_password);
		mo = service.business_password_check(mo);
		
		if (mo == null) {
			check = 0;
		}
		
		return String.valueOf(check);
	}
	
	/** 기업 마이 페이지 **/
	@RequestMapping(value = "business_password_check", method = RequestMethod.POST)
	public String business_password_check(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			HttpSession session, loginVO vo) throws IOException {

		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		vo.setId(business_num);
		BusinessVO bv = service.BusinessCheck(vo);

		if (bv == null) {
			ScriptUtils.alertAndMovePage(response, "패스워드가 틀렸습니다.", "login_check");
		} else {
			return "redirect:business_info";
		}
		return "view/business_info";
	}
	
	/** 기업정보 수정 **/
	@RequestMapping(value = "business_info", method = RequestMethod.GET)
	public String business_info(HttpServletRequest request, ModelMap modelMap, HttpSession session
			, HttpServletResponse response) throws IOException{
		
		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		BusinessVO vo = service.getBusiness_info(business_num);
		modelMap.addAttribute("vo", vo);
		
		return "view/business_page/business_info";
	}

	/** 기업정보 수정 **/
	@RequestMapping(value = "business_info_update", method = RequestMethod.POST)
	public String business_info_update(HttpServletRequest request, ModelMap modelMap, HttpSession session, BusinessVO vo
			, HttpServletResponse response, MultipartFile file) throws IOException {
		
		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		String sql = "update business set business_name = '" + vo.getBusiness_name() + "', tel = '" + vo.getTel() + "'";
		
		String saveName = file.getOriginalFilename();
		
		if(!saveName.equals("")) {
			File target = new File(uploadPath, saveName);
			FileCopyUtils.copy(file.getBytes(), target);
			
			sql = sql + ", img_path = '" + saveName + "'";
		}
		
		if(vo.getAddress() != null || !vo.getAddress().equals("")) {
			sql = sql + ", address = '" + vo.getAddress() + "'";
		}
		
		if(vo.getDetail_address() != null || !vo.getDetail_address().equals("")) {
			sql = sql + ", detail_address = '" + vo.getDetail_address() + "'";
		}
		
		if(vo.getEmail() != null || !vo.getEmail().equals("")) {
			sql = sql + ", email = '" + vo.getEmail() + "@" + request.getParameter("sel_email") + "'";
		}
	
		if(vo.getFax() != null || !vo.getFax().equals("")) {
			sql = sql + ", fax = '" + vo.getFax() + "'";
		}
		
		sql = sql + " where business_num ='" + business_num + "'";
		
		service.getBusiness_info_update(sql);
		
		return "redirect:business_info";
	}
	
	/** 기업 탈퇴 **/
	@RequestMapping(value = "business_secession", method = RequestMethod.GET)
	public String business_secession_password(HttpSession session, HttpServletResponse response) throws IOException {

		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		return "view/business_page/business_secession";
	}

	@RequestMapping(value = "business_secession", method = RequestMethod.POST)
	public String business_secession_password(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap,
			HttpSession session, BusinessVO mo, loginVO vo) throws IOException {

		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		vo.setId(business_num);
		mo = service.BusinessCheck(vo);

		if (mo == null) {
			ScriptUtils.alertAndMovePage(response, "패스워드가 틀렸습니다.", "password_check");
		} else {
			service.business_secession(business_num);
			session.removeAttribute("business_id");
			ScriptUtils.alertAndMovePage(response, "회원이 탈퇴 되었습니다.", "main");
		}
		return "view/business_page/business_password_check";
	}

	/** 기업 비밀번호 수정 
	 * @throws IOException **/
	@RequestMapping(value = "business_password_update", method = RequestMethod.GET)
	public String business_password_update(HttpSession session, HttpServletResponse response) throws IOException {
		
		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		return "view/business_page/business_password_update";
	}

	@RequestMapping(value = "business_password_update", method = RequestMethod.POST)
	public String business_password_update(HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap, HttpSession session, BusinessVO mo) {
		
		String business_num = (String) session.getAttribute("business_id");
		String password = mo.getPassword();
		String encryption = SHA256Util.SHA256(password);
		mo.setPassword(encryption);
		mo.setBusiness_num(business_num);
		service.setBusiness_password_update(mo);
		
		return "view/business_page/business_info";
	}
	
	/** 기업 결재 내역 
	 * @throws IOException **/
	@RequestMapping(value = "business_payment")
	public String business_payment(ModelMap modelMap, HttpSession session, PagingVO_2 vo, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "title", required = false) String title) throws IOException {
		
		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		int total = 0;
		String sql = "";
		String sql_2 = "";
		
		if(title != null) {
			vo.setBusiness_num(business_num);
			sql_2 = "'%" + title + "%'";
			vo.setSql_2(sql_2);
			total = service.business_payment_count(vo);
		} else {
			total = service.business_payment_count(business_num);
		}

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		vo = new PagingVO_2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		if(title != null) {
			sql = " and title like '%" + title + "%'";
			modelMap.addAttribute("title", title);
		}
		
		modelMap.addAttribute("paging", vo);

		if (total != 0) {
			
			vo.setBusiness_num(business_num);
			vo.setSql(sql);
			
			List<PaymentVO> payment_list = service.getBusiness_payment(vo);
			modelMap.addAttribute("payment_list", payment_list);
		}
		
		return "view/business_page/business_payment";
	}
	
	/** 기업 전시 리스트 **/
	@RequestMapping(value = "business_contents_list", method = RequestMethod.GET)
	public String business_contents_list(HttpServletRequest request, ModelMap modelMap, PagingVO vo, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "exhn_type", defaultValue = "전체") String exhn_type,
			@RequestParam(value = "day", required = false) String day,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "term", defaultValue = "0") String term, HttpSession session) throws IOException {
		
		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		if (day == null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			day = format.format(System.currentTimeMillis());
		}

		String sql = "";

		if (title != null) {
			sql = " and title like '%" + title + "%'";
		}

		modelMap.addAttribute("exhn_type", exhn_type);
		modelMap.addAttribute("day", day);
		modelMap.addAttribute("term", term);
		modelMap.addAttribute("title", title);

		if (!exhn_type.equals("전체")) {
			exhn_type = " and exhn_type = '" + exhn_type + "'";
			sql = exhn_type;
		}

		if (term.equals("1")) {
			sql = sql + " and date(end_day) >= date('" + day + "')";
		} else if (term.equals("2")) {
			sql = sql + " and date(end_day) <= date('" + day + "')";
		}

		vo.setSql(sql);
		vo.setBusiness_num(business_num);
		int total = service.count_business_contents(vo);

		if (total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "list");
		}

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "6";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSql(sql);
		vo.setBusiness_num(business_num);
		modelMap.addAttribute("paging", vo);
		List<ContentsVO> list = service.getBusiness_contents_list(vo);
		modelMap.addAttribute("list", list);

		return "view/business_page/business_contents_list";
	}

	@SuppressWarnings("null")
	@RequestMapping(value = "business_contents_list", method = RequestMethod.POST)
	public String business_contents_list_post(HttpServletRequest request, ModelMap modelMap, PagingVO vo, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "exhn_type", defaultValue = "전체") String exhn_type,
			@RequestParam(value = "day", required = false) String day,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "term", defaultValue = "0") String term, HttpSession session) throws IOException {

		String business_num = (String) session.getAttribute("business_id");
		
		if(business_num == null) {
			ScriptUtils.alertAndMovePage(response, "기업아이디로 로그인해주세요.", "main");
		}
		
		if (title == null) {
			ScriptUtils.alertAndMovePage(response, "검색어를 입력하여 주세요.", "list");
		}

		if (day == null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			day = format.format(System.currentTimeMillis());
		}

		modelMap.addAttribute("exhn_type", exhn_type);
		modelMap.addAttribute("day", day);
		modelMap.addAttribute("term", term);

		String sql = " and title like '%" + title + "%'";

		if (!exhn_type.equals("전체")) {
			exhn_type = " and exhn_type = '" + exhn_type + "'";
			sql = exhn_type;
		}

		if (term.equals("1")) {
			sql = sql + " and date(end_day) >= date('" + day + "')";
		} else if (term.equals("2")) {
			sql = sql + " and date(end_day) <= date('" + day + "')";
		}

		vo.setSql(sql);
		vo.setBusiness_num(business_num);
		int total = service.count_business_contents(vo);

		if (total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "list");
		}

		modelMap.addAttribute("title", title);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "6";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "6";
		}

		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setSql(sql);
		vo.setBusiness_num(business_num);
		modelMap.addAttribute("paging", vo);
		List<ContentsVO> list = service.getBusiness_contents_list(vo);
		modelMap.addAttribute("list", list);

		return "view/business_page/business_contents_list";
	}
	
	/** 기업 전시 리스트 
	 * @throws IOException **/
	@RequestMapping(value = "contents_update", method = RequestMethod.GET)
	public String contents_update(HttpServletRequest request, ModelMap modelMap, HttpSession session, HttpServletResponse response,
			@RequestParam(value = "contents_idx", required = false) String contents_idx) throws IOException{
		
		String business_num = (String) session.getAttribute("business_id");
		ContentsVO vo = service.getcontent(contents_idx);
		
		if(!vo.getBusiness_num().equals(business_num)) {
			ScriptUtils.alertAndMovePage(response, "권한이 없습니다.", "main");
		}
		
		return "view/business_page/contents_update";
	}
	
	/** 기업회원 아이디 비밀번호 찾기 **/
	@RequestMapping(value = "business_email_pw_find", method = RequestMethod.POST)
	public @ResponseBody String business_email_pw_find(@RequestParam(value = "business_num", defaultValue = "") String business_num,
			@RequestParam(value = "email", defaultValue = "") String email) {
		
		int check = 1;
		
		BusinessVO vo = new BusinessVO();
		vo.setBusiness_num(business_num);
		vo.setEmail(email);
		BusinessVO business = service.business_email_pw_find(vo);
		
		if(business == null) {
			check = 0;
		};
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "business_tel_pw_find", method = RequestMethod.POST)
	public @ResponseBody String business_tel_pw_find(@RequestParam(value = "business_num", defaultValue = "") String business_num,
			@RequestParam(value = "tel", defaultValue = "") String tel) {
		
		int check = 1;
		
		BusinessVO vo = new BusinessVO();
		vo.setBusiness_num(business_num);
		vo.setTel(tel);
		BusinessVO business = service.business_tel_pw_find(vo);
		
		if(business == null) {
			check = 0;
		};
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "business_pw_find", method = RequestMethod.GET)
	public String business_pw_find() {
		return "view/business_page/business_pw_find";
	}
	
	
	@RequestMapping(value = "business_pw_result", method = RequestMethod.GET)
	public String business_pw_result() {
		
		return "view/business_page/business_pw_result";
	}
	
	@RequestMapping(value = "business_pw_result", method = RequestMethod.POST)
	public @ResponseBody String business_pw_result(@RequestParam(value = "password", defaultValue = "") String password,
			HttpSession session, BusinessVO vo) {
		
		int check = 1;
		String business_num = (String) session.getAttribute("business_num");
		
		if(business_num == null) {
			check = 0;
		} else {
			String encryption = SHA256Util.SHA256(password);
			vo.setPassword(encryption);
			vo.setBusiness_num(business_num);
			service.business_password_update(vo);
		}
		return String.valueOf(check);
	}

	@RequestMapping(value = "select")
	public String select(HttpServletRequest request) {

		return "view/select";
	}
}