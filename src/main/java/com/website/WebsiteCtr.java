package com.website;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder.In;
import javax.servlet.http.Cookie;
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

import com.business.BusinessVO;
import com.common.PagingVO_2;
import com.common.PagingVO_3;
import com.contents.ContentsSvc;
import com.contents.ContentsVO;
import com.contents.comments.CommentsVO;
import com.contents.comments.Comments_answerVO;
import com.contents.comments.Report_answersVO;
import com.contents.comments.Report_commentsVO;
import com.member.MemberVO;
import com.notice.Web_notice;

@Controller
public class WebsiteCtr {
	
	@Autowired
	WebsiteSvc website_service;
	
	@Autowired
	ContentsSvc contents_service;
	
	@Resource(name = "web_main_path")
	String web_main_path;
	
	@Resource(name = "banner_path")
	String banner_path;
	
	@Resource(name = "gallery_path")
	String gallery_path;
	
	@Resource(name = "introduction_path")
	String introduction_path;
	
	@Resource(name = "thumbnail_path")
	String thumbnail_path;
	
	@Resource(name = "pop_up_path")
	String pop_up_path;
	
	@Resource(name = "notice_path")
	String notice_path;
	
	@RequestMapping(value = "website")
	public String website(HttpServletRequest request, ModelMap modelMap, PagingVO_2 vo,
			HttpServletResponse response, HttpSession session, PagingVO_3 galleryvo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "nowPage_2", required = false) String nowPage_2,
			@RequestParam(value = "cntPerPage_2", required = false) String cntPerPage_2,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "title", required = false) String title) throws ParseException {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		int introduction_cnt = website_service.get_introduction_cnt(contents_idx);
		if(introduction_cnt != 0) {
			List<Introduction_img> introduction_list = website_service.get_Introduction_list(contents_idx);
			modelMap.addAttribute("introduction_list", introduction_list);
		}
		
		int pop_up_cnt = website_service.get_pop_up_cnt(contents_idx);
		if(pop_up_cnt != 0) {
			Pop_upVO pop_up = website_service.get_pop_up(contents_idx);
			
			for(int i = 1; i < 4; i++) {
				Cookie[] cookies = request.getCookies(); // 모든 쿠키 가져오기
				String cookies_id = String.valueOf(contents_idx) + "_" + String.valueOf(i);
				
			    if(cookies!=null){
			        for (Cookie c : cookies) {
			            String name = c.getName(); // 쿠키 이름 가져오기
			            String value = c.getValue(); // 쿠키 값 가져오기
			            if (name.equals(cookies_id)) {
			                if(value.equals("false")) {
			                	if(i == 1) {
			                		pop_up.setStart_day_1("");
			                	} else if(i == 2) {
			                		pop_up.setStart_day_2("");
			                	} else {
			                		pop_up.setStart_day_3("");
			                	}
			                }
			            }
			        }
			    }
			}
		    
			if(pop_up != null) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date currentTime = new Date();
				String date = format.format(currentTime);
				Date todate = format.parse(date);
				
				if(!pop_up.getStart_day_1().equals("") && !pop_up.getEnd_day_1().equals("")) {
					String start_dt = pop_up.getStart_day_1();
					String end_dt = pop_up.getEnd_day_1();
					Date startDate = format.parse(start_dt);
					Date endDate = format.parse(end_dt);
					int start = startDate.compareTo(todate);
					int end = endDate.compareTo(todate);
					if(start <= 0 && end >= 0 && !pop_up.getImg_1().equals("")) {
						modelMap.addAttribute("pop_up_1", "check");
					}
				}
				
				if(!pop_up.getStart_day_2().equals("") && !pop_up.getEnd_day_2().equals("")) {
					String start_dt = pop_up.getStart_day_2();
					String end_dt = pop_up.getEnd_day_2();
					Date startDate = format.parse(start_dt);
					Date endDate = format.parse(end_dt);
					int start = startDate.compareTo(todate);
					int end = endDate.compareTo(todate);
					if(start <= 0 && end >= 0 && !pop_up.getImg_2().equals("")) {
						modelMap.addAttribute("pop_up_2", "check");
					}		
				}
				
				if(!pop_up.getStart_day_3().equals("") && !pop_up.getEnd_day_3().equals("")) {
					String start_dt = pop_up.getStart_day_3();
					String end_dt = pop_up.getEnd_day_3();
					Date startDate = format.parse(start_dt);
					Date endDate = format.parse(end_dt);
					int start = startDate.compareTo(todate);
					int end = endDate.compareTo(todate);
					if(start <= 0 && end >= 0 && !pop_up.getImg_3().equals("")) {
						modelMap.addAttribute("pop_up_3", "check");
					}
				}
				modelMap.addAttribute("pop_up", pop_up);
			}
		}
		
		String id = (String) session.getAttribute("id");
		MemberVO mv = contents_service.selectMemeber(id);
		modelMap.addAttribute("mv", mv);
		
		int notice_cnt = website_service.get_web_notice_cnt(contents_idx);
		if(notice_cnt != 0) {
			List<Web_notice> notice_list = website_service.get_main_notice(contents_idx);
			modelMap.addAttribute("notice_list", notice_list);
		}
		
		if(content_list.getCrawling_num() == 0) {
			String[] m_price = content_list.getPrice().split(",");
			modelMap.addAttribute("m_price", m_price);
			
			SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHmmss");
			Calendar calendar = Calendar.getInstance();
			String today = date.format(calendar.getTime());
			String num = "";
			for (int i = 0; i < 7; i++) {
				Random random = new Random();
				int r = random.nextInt(10);
				num = num + Integer.toString(r);
			}
			
			String merchant_uid = contents_idx + today + "-" + num;
			modelMap.addAttribute("merchant_uid", merchant_uid);
		}
		
		Web_menuVO web_menu = website_service.get_web_menu(contents_idx);
		modelMap.addAttribute("web_menu", web_menu);
		
		String business_num = website_service.get_business_num(contents_idx);
		
		BusinessVO business = website_service.get_business(business_num);
		modelMap.addAttribute("business", business);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(1))) {
				
				modelMap.addAttribute("content_list", content_list);
				String sql = "";
				if(title != null) {
					modelMap.addAttribute("title", title);
					sql = " and title like '%" + title + "%'";
				}
				
				galleryvo.setSql(sql);
				galleryvo.setContents_idx(contents_idx);
				int gallery_cnt = website_service.get_gallery_cnt(galleryvo);
				
				if (nowPage_2 == null && cntPerPage_2 == null) {
					nowPage_2 = "1";
					cntPerPage_2 = "10";
				} else if (nowPage_2 == null) {
					nowPage_2 = "1";
				} else if (cntPerPage_2 == null) {
					cntPerPage_2 = "10";
				}
				
				galleryvo = new PagingVO_3(gallery_cnt, Integer.parseInt(nowPage_2), Integer.parseInt(cntPerPage_2));
				
				if (gallery_cnt != 0) {
					galleryvo.setSql(sql);
					galleryvo.setContents_idx(contents_idx);
					List<GalleryVO> gallery_list = website_service.get_Gallery_list(galleryvo);
					modelMap.addAttribute("gallery_list", gallery_list);
				}
				
				int total = contents_service.comments_count(contents_idx);
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "10";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) {
					cntPerPage = "10";
				}
				
				vo = new PagingVO_2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
				
				if (total != 0) {
					vo.setContents_idx(contents_idx);
					List<CommentsVO> comment_list = contents_service.selectComment(vo);
					List<Comments_answerVO> answer_list = contents_service.selectAnswer(contents_idx);
					
					modelMap.addAttribute("comment_list", comment_list);
					modelMap.addAttribute("answer_list", answer_list);
				}
				
				modelMap.addAttribute("paging", vo);
				modelMap.addAttribute("paging_2", galleryvo);
				
				return "view/page_type_1/main";
			} else if(content_list.getWebsite_type().equals(String.valueOf(2))) {
				
				Random random = new Random();
				int background = random.nextInt(2);
				modelMap.addAttribute("background", background);
				
				String[] web_menu_list = new String[7];
				
				if(!web_menu.getIntroduction_seq().equals("0")) {
					web_menu_list[Integer.parseInt(web_menu.getIntroduction_seq())] = "introduction";
				}

				if(!web_menu.getGallery_seq().equals("0")) {
					web_menu_list[Integer.parseInt(web_menu.getGallery_seq())] = "gallery";
				}
				
				if(!web_menu.getNotice_seq().equals("0")) {
					web_menu_list[Integer.parseInt(web_menu.getNotice_seq())] = "notice";
				}
				
				if(!web_menu.getLocation_seq().equals("0")) {
					web_menu_list[Integer.parseInt(web_menu.getLocation_seq())] = "location";
				}
				
				if(!web_menu.getRefund_seq().equals("0")) {
					web_menu_list[Integer.parseInt(web_menu.getRefund_seq())] = "refund";
				}
				
				if(!web_menu.getMedia_seq().equals("0")) {
					web_menu_list[Integer.parseInt(web_menu.getMedia_seq())] = "video";
				}
				
				int web_menu_list_length = web_menu_list.length - 1;
				
				modelMap.addAttribute("web_menu_list", web_menu_list);
				modelMap.addAttribute("web_menu_list_length", web_menu_list_length);
				
				modelMap.addAttribute("content_list", content_list);
				
				GalleryVO gallery_list = website_service.get_gallery(contents_idx);
				if(gallery_list != null) {
					modelMap.addAttribute("gallery_list", gallery_list);
				} else {
					website_service.create_gallery(content_list);
				}
				
				int gallery_cnt = website_service.get_gallery_cnt_2(contents_idx);
				if(gallery_cnt != 0) {
					List<Gallery_img> gallery_img_list = website_service.get_gallery_img_list(contents_idx);
					modelMap.addAttribute("gallery_img_list", gallery_img_list);
				}
				
				return "view/page_type_2/main";
			}
		}
		return "view/page_type_1/detail";
	}
	
	@RequestMapping(value = "pop_up_open", method = RequestMethod.POST)
	public @ResponseBody String pop_up_open(HttpServletResponse response,
			@RequestParam(value = "val", required = false) String id){
		
		String value = "false";
		Cookie cookie = new Cookie(id, value); // 쿠키 이름 지정하여 생성( key, value 개념)
	    cookie.setMaxAge(60*60*24); //쿠키 유효 기간: 하루로 설정(60초 * 60분 * 24시간)
	    cookie.setPath("/"); //모든 경로에서 접근 가능하도록 설정
	    response.addCookie(cookie); //response에 Cookie 추가
		
		return String.valueOf("0");
	}
	
	@RequestMapping(value = "gallery_detail", method = RequestMethod.GET)
	public String gallery_detail(PagingVO_2 galleryvo, ModelMap modelMap,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "gallery_idx", required = false) int gallery_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		modelMap.addAttribute("gallery_idx", gallery_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		List<Gallery_img> gallery_list = website_service.get_gallery_img(gallery_idx);
		modelMap.addAttribute("gallery_list", gallery_list);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/gallery_detail";
			}
		}
		return "";
	}
	
	@RequestMapping(value = "gallery_insert", method = RequestMethod.GET)
	public String gallery_insert(PagingVO_2 galleryvo, ModelMap modelMap,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/gallery_insert";
			}
		}
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "gallery_insert", method = RequestMethod.POST)
	public String gallery_insert(PagingVO_2 galleryvo, ModelMap modelMap, GalleryVO gallery,
			MultipartFile thumbnail_file, List<MultipartFile> files,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) throws IOException {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		String thumbnail_name = thumbnail_file.getOriginalFilename();
		File target = new File(thumbnail_path, thumbnail_name);
		FileCopyUtils.copy(thumbnail_file.getBytes(), target);
		
		gallery.setContents_idx(contents_idx);
		gallery.setThumbnail(thumbnail_name);
		
		website_service.set_gallery(gallery);
		int gallery_idx = website_service.get_gallery_idx(contents_idx);
		
		List<Gallery_img> gallery_list = new ArrayList<Gallery_img>();
		
		for (MultipartFile imgs : files) {
			String imgName = imgs.getOriginalFilename();
			
			if (imgName != null && !imgName.equals("")) {
				File target_1 = new File(gallery_path, imgName);
				FileCopyUtils.copy(imgs.getBytes(), target_1);
				System.out.println("file==============================>"+target_1);
				
				Gallery_img gallery_img = new Gallery_img(contents_idx, gallery_idx, imgName);
				System.out.println("gallery_img===============>"+gallery_img);
				gallery_list.add(gallery_img);
			}
		}
		System.out.println("gallery_list==========================>"+gallery_list);
		website_service.set_gallery_img(gallery_list);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/main";
			}
		}
		
		return "";
	}
	
	@RequestMapping(value = "gallery_update", method = RequestMethod.GET)
	public String gallery_update(ModelMap modelMap,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "gallery_idx", required = false) int gallery_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		modelMap.addAttribute("gallery_idx", gallery_idx);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/gallery_update";
			}
		}
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "gallery_update", method = RequestMethod.POST)
	public String gallery_update(PagingVO_2 galleryvo, ModelMap modelMap, GalleryVO gallery,
			MultipartFile thumbnail_file, List<MultipartFile> files,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "gallery_idx", required = false) int gallery_idx) throws IOException {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		String thumbnail_name = thumbnail_file.getOriginalFilename();
		File target = new File(thumbnail_path, thumbnail_name);
		FileCopyUtils.copy(thumbnail_file.getBytes(), target);
		
		gallery.setIdx(gallery_idx);
		gallery.setThumbnail(thumbnail_name);
		
		website_service.update_gallery(gallery);
		
		Gallery_img gallery_item = new Gallery_img(contents_idx, gallery_idx, "null");
		website_service.delete_gallery(gallery_item);
		
		List<Gallery_img> gallery_list = new ArrayList<Gallery_img>();
		
		for (MultipartFile imgs : files) {
			String imgName = imgs.getOriginalFilename();
			if (imgName != null && !imgName.equals("")) {
				File target_1 = new File(gallery_path, imgName);
				FileCopyUtils.copy(imgs.getBytes(), target_1);
				
				Gallery_img gallery_img = new Gallery_img(contents_idx, gallery_idx, imgName);
				gallery_list.add(gallery_img);
			}
		}
		website_service.set_gallery_img(gallery_list);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/main";
			}
		}
		
		return "";
	}
	
	@RequestMapping(value = "web_notice_list", method = RequestMethod.GET)
	public String web_notice_list(HttpServletRequest request, ModelMap modelMap, PagingVO_2 vo,
			HttpServletResponse response, HttpSession session, Web_notice notice,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "title", required = false) String title) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		String business_num = website_service.get_business_num(contents_idx);
		modelMap.addAttribute("business_num", business_num);
		
		String sql = "";
		
		if(title != null) {
			modelMap.addAttribute("title", title);
			sql = " and title like '%" + title + "%'";
		}
		
		vo.setSql(sql);
		vo.setContents_idx(contents_idx);
		
		int total = website_service.web_notice_count(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}

		vo = new PagingVO_2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", vo);
		
		if (total != 0) {
			vo.setSql(sql);
			vo.setContents_idx(contents_idx);
			List<Web_notice> notice_list = website_service.select_web_NoticeList(vo);
			modelMap.addAttribute("notice_list", notice_list);
		}
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/notice_list";
			}
		}
		return "";
	}
	
	@RequestMapping(value = "web_notice_detail")
	public String web_notice_detail(ModelMap modelMap,  HttpSession session,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "idx", required = false) int idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		String business_num = website_service.get_business_num(contents_idx);
		modelMap.addAttribute("business_num", business_num);
		Web_notice notice = website_service.get_web_notice(idx);
		modelMap.addAttribute("notice_list", notice);
		
		String view = (String) session.getAttribute("notice_view");
		
		if(view == null) {
			session.setAttribute("notice_view", String.valueOf(idx));
			website_service.add_web_notice_view(idx);
		} else {
			if(!view.equals(String.valueOf(idx))) {
				session.setAttribute("notice_view", String.valueOf(idx));
				website_service.add_web_notice_view(idx);
			}
		}
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/notice_detail";
			}
		}
		
		return "";
	}
	
	@RequestMapping(value = "main_management", method = RequestMethod.GET)
	public String main_management(ModelMap modelMap, @RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/main_management";
			}
		}
		
		return "";
	}
	
	@RequestMapping(value = "main_management", method = RequestMethod.POST)
	public String main_management(ModelMap modelMap, MultipartFile main_img,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) throws IOException {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		String main = main_img.getOriginalFilename();
		File target = new File(web_main_path, main);
		FileCopyUtils.copy(main_img.getBytes(), target);
		
		content_list.setWeb_main_name(main);
		
		website_service.update_main_img(content_list);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/main_management";
			}
		}
		return "";
	}
	
	@RequestMapping(value = "introduction_management", method = RequestMethod.GET)
	public String introduction_management(ModelMap modelMap, @RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/introduction_management";
			}
		}
		return "";
	}
	
	@RequestMapping(value = "introduction_management", method = RequestMethod.POST)
	public String introduction_management(ModelMap modelMap, MultipartFile img,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) throws IOException {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		String introduction_img = img.getOriginalFilename();
		File target = new File(introduction_path, introduction_img);
		FileCopyUtils.copy(img.getBytes(), target);
		
		int introduction_cnt = website_service.get_introduction_cnt(contents_idx);
		
		Introduction_img introduction = new Introduction_img(contents_idx, introduction_img);
		
		if(introduction_cnt == 0) {
			website_service.introduction_insert(introduction);
		} else {
			website_service.introduction_update(introduction);
		}
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/introduction_management";
			}
		}
		return "";
	}
	
	@RequestMapping(value = "notice_management", method = RequestMethod.GET)
	public String notice_management(HttpServletRequest request, ModelMap modelMap, PagingVO_2 vo,
			HttpServletResponse response, HttpSession session, Web_notice notice,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "title", required = false) String title) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		String sql = "";
		
		if(title != null) {
			modelMap.addAttribute("title", title);
			sql = " and title like '%" + title + "%'";
		}
		
		vo.setSql(sql);
		vo.setContents_idx(contents_idx);
		
		int total = website_service.web_notice_count(vo);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		vo = new PagingVO_2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		modelMap.addAttribute("paging", vo);
		
		if (total != 0) {
			vo.setSql(sql);
			vo.setContents_idx(contents_idx);
			List<Web_notice> notice_list = website_service.select_web_NoticeList(vo);
			modelMap.addAttribute("notice_list", notice_list);
		}
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/notice_management";
			}
		}
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "notice_delete_management", method = RequestMethod.POST)
	public String notice_delete_management(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {

		int cnt = 0;

		for (String c : check) {
			website_service.notice_delete_management(c);
		}

		return String.valueOf(cnt);
	}
	
	@RequestMapping(value = "notice_management_insert", method = RequestMethod.GET)
	public String notice_management_insert(ModelMap modelMap,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/notice_management_insert";
			}
		}
		
		return "";
	}
	
	@RequestMapping(value = "notice_management_insert", method = RequestMethod.POST)
	public String notice_management_insert(HttpServletRequest request, ModelMap modelMap, MultipartFile img,
			HttpServletResponse response, HttpSession session, Web_notice notice,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) throws IOException {
		
//		String content = notice.getContents();
//		content = content.replace("\n", "<br>");
//		notice.setContents(content);
		
//		String img_name = img.getOriginalFilename();
//		if(!img_name.equals("")) {
//			File target_1 = new File(notice_path, img_name);
//			FileCopyUtils.copy(img.getBytes(), target_1);
//			notice.setFile_path(img_name);
//		}
		
		modelMap.addAttribute("contents_idx", contents_idx);
		notice.setContents_idx(contents_idx);
		website_service.notice_management_insert(notice);
		
//		return "redirect:notice_management?contents_idx=" + contents_idx;
		return "view/page_type_1/notice_list?contents_idx="+contents_idx;
	}
	
	@RequestMapping(value = "notice_management_update", method = RequestMethod.GET)
	public String notice_management_update(ModelMap modelMap,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "idx", required = false) int idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		String business_num = website_service.get_business_num(contents_idx);
		modelMap.addAttribute("business_num", business_num);
		Web_notice notice = website_service.get_web_notice(idx);
		modelMap.addAttribute("notice_list", notice);
		modelMap.addAttribute("idx", idx);
		
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/notice_management_update";
			}
		}
		
		return "";
	}
	
	 /** 공지사항 수정
	 * @throws IOException
	 * @SuppressWarnings("null")
	 */
	@RequestMapping(value = "notice_management_update", method = RequestMethod.POST)
	public String notice_management_update_post(HttpServletRequest request, Web_notice notice, ModelMap modelMap,
			MultipartFile file, HttpSession session, HttpServletResponse response) throws IOException, InterruptedException {
		
		int contents_idx = notice.getContents_idx();
		System.out.println("contents_idx=======>"+contents_idx);
		int idx = notice.getIdx();
		System.out.println("idx=======>"+idx);
		notice.setIdx(idx);
		modelMap.addAttribute("notice_list", notice);
		
		website_service.notice_management_update(notice);
		
		return "redirect:notice_management?contents_idx=" + contents_idx;
	}
	
	@RequestMapping(value = "comment_management", method = RequestMethod.GET)
	public String comments_management(HttpServletRequest request, ModelMap modelMap, PagingVO_2 vo,
			HttpServletResponse response, HttpSession session, Report_commentsVO report_commentsVO,
			Report_answersVO report_answersvo,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "category", defaultValue = "1") int category,
			@RequestParam(value = "user_id", required = false) String user_id,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		modelMap.addAttribute("category", category);
		
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		String sql = "";
		
		if(user_id != null) {
			modelMap.addAttribute("user_id", user_id);
			sql = "and user_id like '%" + user_id + "%'";
		}
		
		vo.setSql(sql);
		vo.setContents_idx(contents_idx);
		
		if(category == 1) {
			int total = website_service.report_comments_cnt(vo);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "10";
			}
			
			vo = new PagingVO_2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			modelMap.addAttribute("paging", vo);
			
			if (total != 0) {
				vo.setSql(sql);
				vo.setContents_idx(contents_idx);
				List<CommentsVO> comments_list = website_service.select_report_comments(vo);
				modelMap.addAttribute("comments_list", comments_list);
			}
			
			for(int i = 1; i < 3; i++) {
				if(content_list.getWebsite_type().equals(String.valueOf(i))) {
					modelMap.addAttribute("content_list", content_list);
					return "view/page_type_" + i + "/comments_management";
				}
			}
		} else {
			int total = website_service.report_answers_cnt(vo);
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "10";
			}
			
			vo = new PagingVO_2(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			modelMap.addAttribute("paging", vo);
			
			if (total != 0) {
				vo.setSql(sql);
				vo.setContents_idx(contents_idx);
				List<Comments_answerVO> answers_list = website_service.select_report_answers(vo);
				modelMap.addAttribute("answers_list", answers_list);
			}
			
			for(int i = 1; i < 3; i++) {
				if(content_list.getWebsite_type().equals(String.valueOf(i))) {
					modelMap.addAttribute("content_list", content_list);
					return "view/page_type_" + i + "/comments_management";
				}
			}
		}
		return "";
	}
	
	@RequestMapping(value = "pop_up_management", method = RequestMethod.GET)
	public String pop_up_management(ModelMap modelMap,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		Pop_upVO pop_up = website_service.get_pop_up(contents_idx);
		modelMap.addAttribute("pop_up", pop_up);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/pop_up_management";
			}
		}
		
		return "view/page_type_2/main";
	}
	
	@RequestMapping(value = "pop_up_management", method = RequestMethod.POST)
	public String pop_up_management(Pop_upVO pop_up, ModelMap modelMap, MultipartFile img_file_1, MultipartFile img_file_2, MultipartFile img_file_3,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "title_1", required = false) String title_1,
			@RequestParam(value = "title_2", required = false) String title_2,
			@RequestParam(value = "title_3", required = false) String title_3) throws IOException {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		String img_1_name = img_file_1.getOriginalFilename();
		String img_2_name = img_file_2.getOriginalFilename();
		String img_3_name = img_file_3.getOriginalFilename();
		
		if(!title_1.equals("")) {
			pop_up.setImg_1(title_1);
		}
		
		if(!title_2.equals("")) {
			pop_up.setImg_1(title_2);
		}
		
		if(!title_3.equals("")) {
			pop_up.setImg_1(title_3);
		}
		
		if(!img_1_name.equals("")) {
			File target_1 = new File(pop_up_path, img_1_name);
			FileCopyUtils.copy(img_file_1.getBytes(), target_1);
			pop_up.setImg_1(img_1_name);
		}
		
		if(!img_2_name.equals("")) {
			File target_2 = new File(pop_up_path, img_2_name);
			FileCopyUtils.copy(img_file_2.getBytes(), target_2);
			pop_up.setImg_2(img_2_name);
		}
		
		if(!img_3_name.equals("")) {
			File target_3 = new File(pop_up_path, img_3_name);
			FileCopyUtils.copy(img_file_3.getBytes(), target_3);
			pop_up.setImg_3(img_3_name);
		}
		
		int pop_up_cnt = website_service.get_pop_up_cnt(contents_idx);
		pop_up.setContents_idx(contents_idx);
		if(pop_up_cnt == 0) {
			website_service.set_pop_up(pop_up);
		} else {
			website_service.update_pop_up(pop_up);
		}
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "redirect:pop_up_management?contents_idx=" + contents_idx;
			}
		}
		
		return "view/page_type_2/main";
	}

	@ResponseBody
	@RequestMapping(value = "user_delete_management", method = RequestMethod.POST)
	public String member_stop(HttpServletRequest request, ModelMap modelMap,
			@RequestParam(value = "check[]", defaultValue = "") List<String> check) {
		
		int cnt = 0;
		
		for (String c : check) {
			website_service.user_delete_comments(c);
			website_service.user_delete_answer(c);
			
			String writer = website_service.comments_write(c);
			website_service.user_delete_management(writer);
		}
		
		return String.valueOf(cnt);
	}
	
	@RequestMapping(value = "gallery_management", method = RequestMethod.GET)
	public String gallery_management(ModelMap modelMap,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) throws IOException {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		int gallery_cnt = website_service.get_gallery_list_cnt(contents_idx);
		modelMap.addAttribute("gallery_cnt", gallery_cnt);
		if(gallery_cnt != 0) {
			List<Gallery_img> img_list = website_service.get_gallery_img_list(contents_idx);
			modelMap.addAttribute("img_list", img_list);
		}
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/gallery_management";
			}
		}
		
		return "view/page_type_2/main";
	}
	
	@RequestMapping(value = "gallery_management", method = RequestMethod.POST)
	public String gallery_management(ModelMap modelMap, List<MultipartFile> img,
			@RequestParam(value = "contents_idx", required = false) int contents_idx,
			@RequestParam(value = "existing", required = false) List<String> existing_list) throws IOException {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		if(existing_list != null) {
			List<Gallery_img> img_list = website_service.get_existing_list(contents_idx);
			for(int i = 0; i < img_list.size(); i++) {
				for(int y = 0; y < existing_list.size(); y++) {
					if(img_list.get(i).getImg_path().equals(existing_list.get(y))) {
						img_list.remove(i);
					}
				}
			}
			website_service.remove_gallery(img_list);
		}
		
		List<Gallery_img> gallery_list = new ArrayList<Gallery_img>();
		
		int img_upload = 0;
		
		for (MultipartFile imgs : img) {
			String imgName = imgs.getOriginalFilename();
			if (imgName != null && !imgName.equals("")) {
				
				int img_cnt = website_service.get_img_cnt(imgName);
				
				if(img_cnt != 1) {
					File target = new File(gallery_path, imgName);
					FileCopyUtils.copy(imgs.getBytes(), target);
					
					Gallery_img gallery_img = new Gallery_img(contents_idx, 0, imgName);
					gallery_list.add(gallery_img);
					
					img_upload = 1;
				}
			}
		}
		
		if(img_upload == 1) {
			website_service.set_gallery_img_list(gallery_list);	
		}
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "redirect:gallery_management?contents_idx=" + contents_idx;
			}
		}
		
		return "view/page_type_2/main";
	}
	
	@RequestMapping(value = "media_management", method = RequestMethod.GET)
	public String media_management(ModelMap modelMap,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/media_management";
			}
		}
		
		return "view/page_type_2/main";
	}
	
	@RequestMapping(value = "media_management", method = RequestMethod.POST)
	public String media_management(ModelMap modelMap, GalleryVO galleryvo,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);
		ContentsVO content_list = contents_service.selectContent(contents_idx);
		
		website_service.media_insert(galleryvo);
		
		for(int i = 1; i < 3; i++) {
			if(content_list.getWebsite_type().equals(String.valueOf(i))) {
				modelMap.addAttribute("content_list", content_list);
				return "view/page_type_" + i + "/media_management";
			}
		}
		
		return "view/page_type_2/main";
	}
}
