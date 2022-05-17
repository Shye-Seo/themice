package com.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.business.BusinessVO;
import com.common.ScriptUtils;
import com.contents.AdvertisementVO;
import com.contents.ContentsVO;
import com.member.MemberVO;
import com.notice.NoticeVO;
import com.notice.Notice_ImgVO;
import com.payment.PaymentVO;

@Controller
public class AdminCtr {

	@Autowired
	AdminSvc service;

	@Resource(name = "notice_path")
	private String uploadPath;

	@Resource(name = "advertisement_path")
	private String advertisement_path;

	@RequestMapping(value = "admin_login")
	public String admin_login() {

		return "admin/admin_login";

	}

	@RequestMapping(value = "admin_login_check")
	public String login_check(AdminVO vo, HttpServletResponse response, HttpSession session) throws IOException {

		AdminVO adminVo = service.login_check(vo);

		if (adminVo != null) {
			session.setAttribute("adminID", adminVo.getId());
			session.setAttribute("authority", adminVo.getAuthority());
		} else {
			ScriptUtils.alertAndMovePage(response, "아이디 비밀번호를 다시 입력해주세요.", "admin_login");
		}

		SimpleDateFormat t = new SimpleDateFormat("HH:mm", Locale.KOREAN);
		String time = t.format(System.currentTimeMillis());
		session.setAttribute("time", time);

		return "redirect:admin_list";
	}

	@RequestMapping(value = "admin_logout")
	public String admin_logout(HttpSession session) {

		session.removeAttribute("adminID");
		session.removeAttribute("authority");

		return "admin/admin_login";
	}

	@RequestMapping(value = "admin_list")
	public String admin_list(HttpServletRequest request, ModelMap modelMap, HttpSession session,
			@RequestParam(value = "authority", defaultValue = "1") int authority) {

		String time = (String) session.getAttribute("time");
		modelMap.addAttribute("time", time);

		List<MemberVO> member_new_list = service.getMemberNewList();
		List<BusinessVO> besiness_new_list = service.getBesinessNewList();
		List<NoticeVO> notice_new_list = service.getNoticeNewList();

		modelMap.addAttribute("member_new_list", member_new_list);
		modelMap.addAttribute("besiness_new_list", besiness_new_list);
		modelMap.addAttribute("notice_new_list", notice_new_list);
		return "admin/admin_list";
	}

	/* 유저, 기업 리스트 */
	@RequestMapping(value = "admin_user", method = RequestMethod.GET)
	public String admin_user(ModelMap modelMap, Admin_Paging_VO paging, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "select", defaultValue = "") String select,
			@RequestParam(value = "value", defaultValue = "") String value) throws IOException {

		modelMap.addAttribute("value", value);
		modelMap.addAttribute("select", select);

		String sql = "";

		if (value != null) {
			if (select.equals("아이디")) {
				sql = " where id like '%" + value + "%' ";
			} else if (select.equals("이름")) {
				sql = " where name like '%" + value + "%' ";
			}
		}

		paging.setSql(sql);
		int member_total = service.count_member_total(paging);
		if (member_total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_user");
		}

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		paging = new Admin_Paging_VO(member_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.setSql(sql);
		List<MemberVO> member_list = service.getMemberList(paging);
		modelMap.addAttribute("member_list", member_list);
		modelMap.addAttribute("paging", paging);
		return "admin/admin_user";
	}

	@RequestMapping(value = "admin_user", method = RequestMethod.POST)
	public String admin_user_post(ModelMap modelMap, Admin_Paging_VO paging, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "select", defaultValue = "아이디") String select,
			@RequestParam(value = "value", defaultValue = "") String value) throws IOException {

		modelMap.addAttribute("value", value);
		modelMap.addAttribute("select", select);
		
		String sql = "";
		
		if (value != null) {
			if (select.equals("아이디")) {
				sql = " where id like '%" + value + "%' ";
			} else if (select.equals("이름")) {
				sql = " where name like '%" + value + "%' ";
			}
		}
		
		paging.setSql(sql);
		int member_total = service.count_member_total(paging);
		if (member_total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_user");
		}
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		paging = new Admin_Paging_VO(member_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.setSql(sql);
		List<MemberVO> member_list = service.getMemberList(paging);
		modelMap.addAttribute("member_list", member_list);
		modelMap.addAttribute("paging", paging);
		return "admin/admin_user";
	}
	
	@RequestMapping(value = "admin_business", method = RequestMethod.GET)
	public String admin_business(ModelMap modelMap, Admin_Paging_VO paging, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "select", defaultValue = "") String select,
			@RequestParam(value = "value", defaultValue = "") String value) throws IOException {

		modelMap.addAttribute("value", value);
		modelMap.addAttribute("select", select);

		String sql = "";

		if (value != null) {
			if (select.equals("사업자 번호")) {
				sql = " where business_num like '%" + value + "%' ";
			} else if (select.equals("기업명")) {
				sql = " where name business_name '%" + value + "%' ";
			}
		}
		
		paging.setSql(sql);
		int member_total = service.count_business_total(paging);
		if (member_total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_user");
		}
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		paging = new Admin_Paging_VO(member_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.setSql(sql);
		List<BusinessVO> business_list = service.getBusinessList(paging);
		modelMap.addAttribute("business_list", business_list);
		modelMap.addAttribute("paging", paging);
		return "admin/admin_business";
	}

	@RequestMapping(value = "admin_business", method = RequestMethod.POST)
	public String admin_business_post(ModelMap modelMap, Admin_Paging_VO paging, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "select", defaultValue = "아이디") String select,
			@RequestParam(value = "value", defaultValue = "") String value) throws IOException {

		modelMap.addAttribute("value", value);
		modelMap.addAttribute("select", select);

		String sql = "";

		if (value != null) {
			if (select.equals("사업자등록번호")) {
				sql = " where business_num like '%" + value + "%' ";
			} else if (select.equals("기업명")) {
				sql = " where name business_name '%" + value + "%' ";
			}
		}

		paging.setSql(sql);
		int member_total = service.count_business_total(paging);
		if (member_total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_user");
		}

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		paging = new Admin_Paging_VO(member_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.setSql(sql);
		List<BusinessVO> business_list = service.getBusinessList(paging);
		modelMap.addAttribute("business_list", business_list);
		modelMap.addAttribute("paging", paging);
		return "admin/admin_business";
	}

	@ResponseBody
	@RequestMapping(value = "member_release", method = RequestMethod.POST)
	public String member_release(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.member_release(c);
		}

		for (String c : check) {
			cnt = service.member_release_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	@ResponseBody
	@RequestMapping(value = "member_stop", method = RequestMethod.POST)
	public String member_stop(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;
		for (String c : check) {
			service.member_stop(c);
		}
		for (String c : check) {
			cnt = service.member_stop_cnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}

	@ResponseBody
	@RequestMapping(value = "business_release", method = RequestMethod.POST)
	public String business_release(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for (String c : check) {
			service.business_release(c);
		}
		for (String c : check) {
			cnt = service.business_release_cnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}

	@ResponseBody
	@RequestMapping(value = "business_stop", method = RequestMethod.POST)
	public String business_stop(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		int cnt = 0;
		for (String c : check) {
			service.business_stop(c);
		}
		for (String c : check) {
			cnt = service.business_stop_cnt(c);
			cnt = cnt + cnt;
		}
		return String.valueOf(cnt);
	}

	/* 게시글 리스트 */
	@RequestMapping(value = "admin_contents")
	public String admin_contents(ModelMap modelMap, Admin_Paging_VO paging, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "category", defaultValue = "1") String category,
			@RequestParam(value = "title", defaultValue = "") String title) throws IOException {

		String sql = "";

		modelMap.addAttribute("category", category);

		if (title != "") {
			if (category.equals("1")) {
				sql = " where title like '%" + title + "%' ";
			} else if (category.equals("2")) {
				sql = " where business like '%" + title + "%' ";
			}
			modelMap.addAttribute("title", title);
		}

		paging.setSql(sql);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		int total = service.countContents(paging);

		if (total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_contents");
		}

		paging = new Admin_Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", paging);
		paging.setSql(sql);
		List<ContentsVO> Contents_list = service.getContentsList(paging);
		modelMap.addAttribute("Contents_list", Contents_list);
		return "admin/admin_contents";
	}

	@ResponseBody
	@RequestMapping(value = "contents_release", method = RequestMethod.POST)
	public String contents_release(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.contents_release(c);
		}

		for (String c : check) {
			cnt = service.content_release_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	@ResponseBody
	@RequestMapping(value = "contents_stop", method = RequestMethod.POST)
	public String contents_stop(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.contents_stop(c);
		}

		for (String c : check) {
			cnt = service.content_stop_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	/* 공지사항 리스트 */
	@RequestMapping(value = "admin_notice")
	public String admin_notice(ModelMap modelMap, Admin_Paging_VO paging,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "category", defaultValue = "1") String category,
			@RequestParam(value = "title", required = false) String title, HttpServletResponse response)
			throws IOException {

		String sql = "";

		if (title != null) {
			if (category.equals("1")) {
				sql = " where title like '%" + title + "%' ";
			} else if (category.equals("2")) {
				sql = " where writer like '%" + title + "%' ";
			}
			modelMap.addAttribute("title", title);
		}

		paging.setSql(sql);

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		int total = service.count_admin_otice(paging);

		if (total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_contents");
		}

		paging = new Admin_Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		paging.setSql(sql);
		List<NoticeVO> notice_list = service.getNotice(paging);

		modelMap.addAttribute("category", category);
		modelMap.addAttribute("paging", paging);
		modelMap.addAttribute("notice_list", notice_list);

		return "admin/admin_notice";
	}

	@ResponseBody
	@RequestMapping(value = "notice_release", method = RequestMethod.POST)
	public String notice_release(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.notice_release(c);
		}

		for (String c : check) {
			cnt = service.notice_release_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	@ResponseBody
	@RequestMapping(value = "notice_stop", method = RequestMethod.POST)
	public String notice_stop(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.notice_stop(c);
		}

		for (String c : check) {
			cnt = service.notice_stop_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	@RequestMapping(value = "admin_notice_update", method = RequestMethod.GET)
	public String admin_notice_update(ModelMap modelMap, @RequestParam(value = "idx", defaultValue = "") int idx) {

		NoticeVO vo = service.getNotice_update(idx);

		modelMap.addAttribute("vo", vo);
		return "admin/admin_notice_update";
	}

	@RequestMapping(value = "admin_notice_write", method = RequestMethod.GET)
	public String admin_notice_write(ModelMap modelMap) {
		return "admin/admin_notice_write";
	}
	
	@RequestMapping(value = "admin_notice_write", method = RequestMethod.POST)
	public String admin_notice_write(ModelMap modelMap, NoticeVO vo, MultipartFile file, HttpSession session) throws IOException {
		
		String saveName = file.getOriginalFilename();
		File target = new File(uploadPath, saveName);
		FileCopyUtils.copy(file.getBytes(), target);
		
		String writer = (String) session.getAttribute("adminID");
		vo.setWriter(writer);
		vo.setFile_path(saveName);
		service.insert_notice(vo);
		
		return "redirect:admin_notice";
	}

	@RequestMapping(value = "fileUpload", method = RequestMethod.POST)
	public @ResponseBody String upload(MultipartHttpServletRequest multipartRequest, NoticeVO vo) { // Multipart로 받는다.
		
		Iterator<String> itr = multipartRequest.getFileNames();
		
		String filePath = uploadPath; // 설정파일로 뺀다.
		String check = "";

		service.insert_notice(vo);
		int notice_idx = service.getnotice_idx();

		while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.

			MultipartFile mpf = multipartRequest.getFile(itr.next());

			String originalFilename = mpf.getOriginalFilename(); // 파일명
			String fileFullPath = filePath + "/" + originalFilename; // 파일 전체 경로

			Notice_ImgVO notice_img = new Notice_ImgVO(notice_idx, originalFilename, fileFullPath);
			service.insert_img(notice_img);
			try {
				// 파일 저장
				mpf.transferTo(new File(fileFullPath)); // 파일저장 실제로는 service에서 처리

				System.out.println("originalFilename => " + originalFilename);
				System.out.println("fileFullPath => " + fileFullPath);

				check = "1";
			} catch (Exception e) {
				System.out.println("postTempFile_ERROR======>" + fileFullPath);
				e.printStackTrace();
			}
		}

		return String.valueOf(check);
	}

	/* 결제 리스트 */
	@RequestMapping(value = "admin_payment")
	public String admin_payment(ModelMap modelMap, Admin_Paging_VO paging, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "select", defaultValue = "") String select,
			@RequestParam(value = "value", defaultValue = "") String value) throws IOException {

		modelMap.addAttribute("value", value);
		modelMap.addAttribute("select", select);

		String sql = "";

		if (value != null) {
			if (select.equals("상품명")) {
				sql = " where title like '%" + value + "%' ";
			} else if (select.equals("구매자")) {
				sql = " where consumer like '%" + value + "%' ";
			}
		}

		paging.setSql(sql);

		int payments_total = service.count_payments_total(paging);

		if (payments_total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_payment");
		}

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		paging = new Admin_Paging_VO(payments_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.setSql(sql);
		List<PaymentVO> payment_list = service.getpayment(paging);
		modelMap.addAttribute("payment_list", payment_list);
		modelMap.addAttribute("paging", paging);

		return "admin/admin_payment";
	}

	/* 기업 승인대기 리스트 */
	@RequestMapping(value = "admin_business_waite")
	public String admin_business_waite(ModelMap modelMap, Admin_Paging_VO paging, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "category", defaultValue = "") String category,
			@RequestParam(value = "title", defaultValue = "") String title) throws IOException {

		modelMap.addAttribute("category", category);
		modelMap.addAttribute("title", title);

		String sql = "";

		if (title != null) {
			if (category.equals("1")) {
				sql = " and business_name like '%" + title + "%' ";
			} else if (category.equals("2")) {
				sql = " and business_num like '%" + title + "%' ";
			}
		}

		paging.setSql(sql);

		int business_waite_total = service.count_business_watie_total(paging);

		if (business_waite_total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_business_waite");
		}

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		paging = new Admin_Paging_VO(business_waite_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.setSql(sql);
		List<BusinessVO> business_list = service.getBusiness(paging);
		modelMap.addAttribute("business_list", business_list);
		modelMap.addAttribute("paging", paging);

		return "admin/admin_business_waite";
	}

	@ResponseBody
	@RequestMapping(value = "business_Approval", method = RequestMethod.POST)
	public String business_Approval(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.business_Approval(c);
		}

		for (String c : check) {
			cnt = service.business_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	@ResponseBody
	@RequestMapping(value = "business_Refusal", method = RequestMethod.POST)
	public String business_Refusal(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.business_Refusal(c);
		}

		for (String c : check) {
			cnt = service.business_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	/** 메인 페이지 상단 배너 **/
	@RequestMapping(value = "admin_advertisement_list")
	public String admin_advertisement_list(ModelMap modelMap, Admin_Paging_VO paging, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "select", defaultValue = "") String select,
			@RequestParam(value = "value", defaultValue = "") String value) throws IOException {

		modelMap.addAttribute("value", value);
		modelMap.addAttribute("select", select);

		String sql = "";

		if (value != null) {
			if (select.equals("제목")) {
				sql = " where title like '%" + value + "%' ";
			} else if (select.equals("기업명")) {
				sql = " where business_name like '%" + value + "%' ";
			}
		}

		paging.setSql(sql);

		int advertisement_total = service.count_advertisement_total(paging);

		if (advertisement_total == 0) {
			ScriptUtils.alertAndMovePage(response, "검색 결과가 없습니다.", "admin_advertisement_list");
		}

		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		paging = new Admin_Paging_VO(advertisement_total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		paging.setSql(sql);
		List<AdvertisementVO> list = service.getAdvertisement_list(paging);
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("paging", paging);

		return "admin/admin_advertisement_list";
	}

	@ResponseBody
	@RequestMapping(value = "advertisement_release", method = RequestMethod.POST)
	public String advertisement_Approval(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.advertisement_release(c);
		}

		for (String c : check) {
			cnt = service.advertisement_release_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	@ResponseBody
	@RequestMapping(value = "advertisement_stop", method = RequestMethod.POST)
	public String advertisement_Refusal(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			service.advertisement_stop(c);
		}

		for (String c : check) {
			cnt = service.advertisement_stop_cnt(c);
			cnt = cnt + cnt;
		}

		return String.valueOf(cnt);
	}

	/** 메인 페이지 상단 작성 **/
	@RequestMapping(value = "admin_advertisement_write", method = RequestMethod.GET)
	public String admin_advertisement_write(ModelMap modelMap) {

		return "admin/admin_advertisement_write";
	}

	@RequestMapping(value = "admin_advertisement_write", method = RequestMethod.POST)
	public String admin_advertisement_write(ModelMap modelMap, AdvertisementVO vo, MultipartFile img)
			throws IOException {

		String saveName = img.getOriginalFilename();
		System.out.println("saveName : " + saveName);
		File target = new File(advertisement_path, saveName);
		FileCopyUtils.copy(img.getBytes(), target);

		vo.setImg_path(saveName);
		service.insert_advertisement(vo);

		return "admin/admin_advertisement_list";
	}
}
