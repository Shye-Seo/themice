package com.contents;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.RenderingHints;
import java.awt.Shape;
import java.awt.font.GlyphVector;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.attribute.PosixFileAttributes;
import java.nio.file.attribute.PosixFilePermission;
import java.nio.file.attribute.PosixFilePermissions;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
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

import com.business.BusinessSvc;
import com.common.Contents_ImgVO;
import com.common.ImgVO;
import com.common.PagingVO;
import com.common.PagingVO_2;
import com.common.ScriptUtils;
import com.common.Temporary_ImgVO;
import com.contents.comments.CommentsVO;
import com.contents.comments.Comments_answerVO;
import com.contents.comments.Report_answersVO;
import com.contents.comments.Report_commentsVO;
import com.member.MemberVO;
import com.notice.NoticeVO;
import com.payment.PaymentSvc;
import com.payment.PaymentVO;
import com.website.Introduction_img;
import com.website.Web_menuVO;

import cn.apiclub.captcha.Captcha;
import cn.apiclub.captcha.servlet.CaptchaServletUtil;

@Controller
public class ContentsCtr {

	@Resource(name = "contents_path")
	private String uploadPath;
	
	@Resource(name = "watermark_path")
	private String watermarkPath;
	
	@Resource(name = "notice_path")
	String notice_path;
	
	@Resource(name = "logo_path")
	String logo_path;
	
	@Resource(name = "banner_path")
	String banner_path;
	
	@Resource(name = "introduction_path")
	String introduction_path;
	
	@Resource(name = "web_main_path")
	String web_main_path;
	
	@Autowired
	ContentsSvc service;
	
	@Autowired
	PaymentSvc service2;
	
	@Autowired
	BusinessSvc business_service;
	
	@RequestMapping(value = "main")
	public String main(ModelMap modelMap,
			@RequestParam(value = "year", required = false) String year,
			@RequestParam(value = "month", required = false) String month) {
		
		if(month != null) {
			modelMap.addAttribute("focus", "focus");
		};
		
		List<AdvertisementVO> section_1_list = service.getSection_1_list();
		int section_1_cnt = service.getSection_1_cnt();
		
		List<ContentsVO> section_2_list = service.getSection_2_list();
		List<ContentsVO> m_section_2_list = service.m_getSection_2_list();

		List<NoticeVO> notice_list = service.getmainNotice();
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy");
		SimpleDateFormat format2 = new SimpleDateFormat ("MM");
		Date time = new Date();
		
		String end_year = format1.format(time);
		
		if(year == null) {
			year = format1.format(time);
		}
		
		if(month == null) {
			month = format2.format(time);
		}
		
		String day = "'" + year + "-" + month + "%'";
		
		int section_3_cnt = service.getSection_3_cnt(day);
		List<ContentsVO> section_3_list = service.getSection_3_list(day);
		List<ContentsVO> m_section_3_list = service.m_getSection_3_list();
		
		modelMap.addAttribute("section_1_list", section_1_list);
		modelMap.addAttribute("section_1_cnt", section_1_cnt);
		modelMap.addAttribute("section_2_list", section_2_list);
		modelMap.addAttribute("m_section_2_list", m_section_2_list);
		modelMap.addAttribute("section_3_list", section_3_list);
		modelMap.addAttribute("m_section_3_list", m_section_3_list);
		modelMap.addAttribute("section_3_cnt", section_3_cnt);
		modelMap.addAttribute("notice_list", notice_list);
		modelMap.addAttribute("year", year);
		modelMap.addAttribute("month", month);
		modelMap.addAttribute("end_year", end_year);
		
		return "view/main";
	}

	@SuppressWarnings("null")
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, ModelMap modelMap, PagingVO vo, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "exhn_type", defaultValue = "전체") String exhn_type,
			@RequestParam(value = "day", required = false) String day,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "term", defaultValue = "0") String term,
			@RequestParam(value = "keyword", defaultValue = "") String keyword, HttpSession session) throws IOException {

		
		String id = (String) session.getAttribute("id");
		MemberVO mv = service2.getMember(id);
		
		modelMap.addAttribute("mv", mv);
		
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
		
		if(keyword != null || !keyword.equals("")) {
			sql = sql + " and key_word like '%" + keyword + "%'";
		}
	
		if (term.equals("1")) {
			sql = sql + " and date(end_day) >= date('" + day + "')";
		} else if (term.equals("2")) {
			sql = sql + " and date(end_day) <= date('" + day + "')";
		}
		
		vo.setSql(sql);
		
		int total = service.countSelectContents(vo);
		
//		if(total == 0) {
//			ScriptUtils.alert(response, "test");
//		}

		modelMap.addAttribute("total", total);

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
		modelMap.addAttribute("paging", vo);
		List<ContentsVO> list = service.getContentinfo(vo);
		List<ContentsVO> m_list = service.get_m_Contentinfo(vo);
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setGrade(service.getContent_Score(list.get(i).getIdx()));
		}
		
		modelMap.addAttribute("list", list);
		modelMap.addAttribute("m_list", m_list);

		return "view/list";
	}

	@SuppressWarnings("null")
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String list_post(HttpServletRequest request, ModelMap modelMap, PagingVO vo, HttpServletResponse response,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "exhn_type", defaultValue = "전체") String exhn_type,
			@RequestParam(value = "day", required = false) String day,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "term", defaultValue = "0") String term) throws IOException {

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

		int total = service.countSelectContents(vo);
		
//		if(total == 0) {
//			ScriptUtils.alert(response, "test");
//		}
		
		modelMap.addAttribute("total", total);
		System.out.println("total : " + total);

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
		modelMap.addAttribute("paging", vo);
		List<ContentsVO> list = service.getContentinfo(vo);

		modelMap.addAttribute("list", list);
		
		return "view/list";
	}

	@RequestMapping(value = "insertContents", method = RequestMethod.GET)
	public String insertContents(HttpSession session, HttpServletResponse response) throws Exception {

		String business = (String) session.getAttribute("business_id");

		if (business == null || business.equals("")) {
			ScriptUtils.alertAndMovePage(response, "로그인을 해주세요", "login");
		}
		return "view/insertContents";
	}

	@RequestMapping(value = "insertContents", method = RequestMethod.POST)
	public String insertinfo(HttpServletRequest request, ModelMap modelMap, ContentsVO vo, List<MultipartFile> file,
			MultipartFile symbol_img, MultipartFile logo_name_, MultipartFile web_main_name_, MultipartFile banner,
			HttpSession session, HttpServletResponse response, Web_menuVO web_menuvo) throws IOException, InterruptedException {
		
		String content = vo.getContent();
		content = content.replace("\n", "<br>");
		vo.setContent(content);
		
		String business_id = (String) session.getAttribute("business_id");
		vo.setBusiness_num(business_id);
//		vo.setTel(service.getTel(business_id)); 전시등록 시, 직접 입력하는 것으로 바꿈
		vo.setBusiness(service.getBusiness_name(business_id));
		
		String saveName = symbol_img.getOriginalFilename();
		File target_1 = new File(uploadPath, saveName);
		FileCopyUtils.copy(symbol_img.getBytes(), target_1);
		
		String logoName = logo_name_.getOriginalFilename();
		File target_2 = new File(logo_path, logoName);
		FileCopyUtils.copy(logo_name_.getBytes(), target_2);
		
		String web_main_Name = web_main_name_.getOriginalFilename();
		File target_5 = new File(web_main_path, web_main_Name);
		FileCopyUtils.copy(web_main_name_.getBytes(), target_5);
		
		String bannerName = banner.getOriginalFilename();
		File target_3 = new File(banner_path, bannerName);
		FileCopyUtils.copy(banner.getBytes(), target_3);
		
		vo.setImg_path(saveName);
		vo.setLogo_name(logoName);
		vo.setWeb_main_name(web_main_Name);
		vo.setBanner_name(bannerName);
		vo.setWebsite_type("1"); //현재 웹사이트 1번만 가능하게끔 통일
		
		service.insertContents(vo);
		
		int contents_idx = service.getContents_idx();
		List<ImgVO> img_list = new ArrayList<ImgVO>();
		
		String title = vo.getTitle();
		
		for (MultipartFile imgs : file) {
//			int permissionCode = 750;
			int img_seq = 0;
			String imgName = imgs.getOriginalFilename();
			
			if (imgName != null && !imgName.equals("")) {
				File target = new File(uploadPath, imgName);
				File target1 = new File(watermarkPath, imgName);
				
				target.setReadable(true, true);
				target.setWritable(true, true);
				target.setExecutable(true, true);
				
				target1.setReadable(true, true);
				target1.setWritable(true, true);
				target1.setExecutable(true, true);
//				
//				if(target1.exists()) {
//					if(permissionCode == 750) {
//						Path paths = Paths.get(watermarkPath);
//						Set<PosixFilePermission> posixPermissions = Files.readAttributes(paths,PosixFileAttributes.class).permissions();
//						posixPermissions.add(PosixFilePermission.OWNER_READ);
//						posixPermissions.add(PosixFilePermission.OWNER_WRITE);
//						posixPermissions.add(PosixFilePermission.OWNER_EXECUTE);
//						
//						posixPermissions.add(PosixFilePermission.GROUP_READ);
//						posixPermissions.add(PosixFilePermission.GROUP_WRITE);
//						posixPermissions.add(PosixFilePermission.GROUP_EXECUTE);
//						
//						posixPermissions.add(PosixFilePermission.OTHERS_READ);
//						posixPermissions.add(PosixFilePermission.OTHERS_WRITE);
//						posixPermissions.add(PosixFilePermission.OTHERS_EXECUTE);
//						Files.setPosixFilePermissions(paths, posixPermissions);
//					}
//				}
//				Runtime.getRuntime().exec("chmod -R 777 " + target);
//				Runtime.getRuntime().exec("chmod -R 777 " + target1);
				
				FileCopyUtils.copy(imgs.getBytes(), target);
				FileCopyUtils.copy(imgs.getBytes(), target1);
				
		        Calendar cal = Calendar.getInstance();
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		        String time = dateFormat.format(cal.getTime());
				
				String path = "/usr/local/img/watermark/"+imgName;
				watermark(path, title);
				
				String imgName_watermark = time+"_"+imgName;
				
				ImgVO imgvo = new ImgVO(contents_idx, img_seq, imgName_watermark);
				img_list.add(imgvo);
				img_seq++;
			}
		}

		if (img_list != null) {
			service.imgupload(img_list);
		}
		
		return "redirect:main";
	}
	
	public static void watermark(String path, String watermarkText) throws InterruptedException, IOException {
        File sourceImageFile = new File(path);
        BufferedImage original = ImageIO.read(sourceImageFile);
        File f = new File(path);
        String f_name = f.getName();
        // 그래픽 컨텍스트 생성 및 앨리어스 방지 실행
        Graphics2D g2d = original.createGraphics();
        g2d.scale(1, 1);
        g2d.addRenderingHints(new RenderingHints(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON));
        g2d.setRenderingHint(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
 
        // 렌더링을 위한 워터 마크 텍스트 모양 생성
        //Font font = new Font(Font.SANS_SERIF, Font.PLAIN, 200);
        // (해당 PC에 존재하는 폰트 이름,     스타일 ex)bold,    front크기 이미지 해상도에따라 비율로 설정해야됨)
//        Font font = new Font("/usr/local/apache-tomcat-8.5.82/webapps/font/maruburi/마루 부리/MaruBuri-SemiBold.otf",Font.PLAIN, 120);
        Font font = new Font("Noto Sans KR",Font.PLAIN, 120);
        GlyphVector fontGV = font.createGlyphVector(g2d.getFontRenderContext(), watermarkText);
        Rectangle size = fontGV.getPixelBounds(g2d.getFontRenderContext(), 0, 0);
        Shape textShape = fontGV.getOutline();
        double textWidth = size.getWidth();
        double textHeight = size.getHeight();
        AffineTransform rotate45 = AffineTransform.getRotateInstance(Math.PI / 4d);
        Shape rotatedText = rotate45.createTransformedShape(textShape);
        
        // 4번 반복되는 경사를 사용하다
        g2d.setPaint(new GradientPaint(0, 0, new Color(1f, 1f, 1f, 0.08f), original.getWidth() / 2, original.getHeight() / 2, new Color(1f, 1f, 1f, 0.08f)));
        g2d.setStroke(new BasicStroke(0.5f));
 
        // 피타 고라스+5픽셀 패딩을 사용하여 y방향으로 스텝을 조정합니다. // 높이 간격
        double yStep = Math.sqrt(textWidth * textWidth / 2) + 200;
 
        // 영상 렌더링 이상 텍스트
        for (double x = -textHeight * 3; x < original.getWidth(); x += (textHeight * 3)) {
            double y = -yStep;
            for (; y < original.getHeight(); y += yStep) {
                g2d.draw(rotatedText);
                g2d.fill(rotatedText);
                g2d.translate(0, yStep);
            }
            g2d.translate(textHeight * 3, -(y + yStep));
        }
        
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        String time = dateFormat.format(cal.getTime());
//        File output = new File(path);
        File output = new File("/usr/local/img/watermark/"+time+"_"+f_name);
//        File output = new File("/C:/workspace/img/watermark/"+time+"_"+f_name);
        ImageIO.write(original, "png", output);
        output.setReadable(true, true);
        output.setWritable(true, true);
        output.setExecutable(true, true);
    }

	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(HttpServletRequest request, ModelMap modelMap, PagingVO_2 vo, CommentsVO commentsVO,
			HttpServletResponse response, HttpSession session,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "contents_idx", required = false) int contents_idx) {
		
		modelMap.addAttribute("contents_idx", contents_idx);

		vo.setContents_idx(contents_idx);

		int total = service.comments_count(contents_idx);

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
			List<CommentsVO> comment_list = service.selectComment(vo);
			List<Comments_answerVO> answer_list = service.selectAnswer(contents_idx);

			modelMap.addAttribute("comment_list", comment_list);
			modelMap.addAttribute("answer_list", answer_list);
		}

		ContentsVO content_list = service.selectContent(contents_idx);
		List<ImgVO> contents_img = service.getContents_img(contents_idx);
		Contents_ImgVO content_img = new Contents_ImgVO();

		for (int i = 0; i < contents_img.size(); i++) {
			if (i == 0) {
				content_img.setImg_1(contents_img.get(i).getImg_path());
			}

			if (i == 1) {
				content_img.setImg_2(contents_img.get(i).getImg_path());
			}

			if (i == 2) {
				content_img.setImg_3(contents_img.get(i).getImg_path());
			}

			if (i == 3) {
				content_img.setImg_4(contents_img.get(i).getImg_path());
			}

			if (i == 4) {
				content_img.setImg_5(contents_img.get(i).getImg_path());
			}

			if (i == 5) {
				content_img.setImg_6(contents_img.get(i).getImg_path());
			}

			if (i == 6) {
				content_img.setImg_7(contents_img.get(i).getImg_path());
			}

			if (i == 7) {
				content_img.setImg_8(contents_img.get(i).getImg_path());
			}
		}

		String id = (String) session.getAttribute("id");

		MemberVO mv = service.selectMemeber(id);

		modelMap.addAttribute("Member", mv);
		modelMap.addAttribute("contents_idx", contents_idx);
		modelMap.addAttribute("content_list", content_list);
		modelMap.addAttribute("content_img", content_img);
		modelMap.addAttribute("paging", vo);
		
		int price_check = 0;
		int check = 1;
		
		if(content_list.getCrawling_num() == 0) {
			String[] price = content_list.getPrice().split(",");
			for(int i = 0; i < 4; i++) {
				if(!price[i].equals("null")) {
					price_check = 1;
				}
			}
			
			if(price_check == 1) {
				PaymentVO payment = new PaymentVO();
				payment.setId(id);
				payment.setContents_idx(String.valueOf(contents_idx));
				payment = service.check_payment(payment);
				
				if(payment == null) {
					check = 0;
				} else {
					check = 1;
				}
			}
			
			modelMap.addAttribute("check", check);
		}
		
		String view = (String) session.getAttribute("view");
		
		if(view == null) {
			session.setAttribute("view", String.valueOf(contents_idx));
			service.add_contents_view(contents_idx);
		} else {
			if(!view.equals(String.valueOf(contents_idx))) {
				session.setAttribute("view", String.valueOf(contents_idx));
				service.add_contents_view(contents_idx);
			}
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
		
		if(content_list.getLayout_type() == 1 || content_list.getLayout_type() == 2 || content_list.getLayout_type() == 4) {
			String[] sub_title = content_list.getSub_title().split(",");
			modelMap.addAttribute("sub_title", sub_title);
			System.out.println("detail subtitle --------------->"+sub_title);
		}
		
		
		for (int i = 0; i < 10; i++) {
			if (content_list.getLayout_type() == i) {
				return "view/detail/detail_" + i;
			}
		}
		
		return "view/main";
	}

	@RequestMapping(value = "comments", method = RequestMethod.POST)
	public String insertComment(HttpServletRequest request, CommentsVO vo,
			HttpSession session, HttpServletResponse response,
			@RequestParam(value = "contents_idx", defaultValue = "") String contents_idx) throws IOException {
		
		String authority = (String) session.getAttribute("authority");
		if (authority.equals("member")) {
			String member_id = (String) session.getAttribute("id");
			vo.setUser_id(member_id);
		} else if (authority.equals("business")) {
			String business_id = (String) session.getAttribute("business_id");
			vo.setUser_id(service.getBusiness_name(business_id));
		}
		
		String content = vo.getComment();
		content = content.replace("\n", "<br>");
		vo.setComment(content);
	
		service.insertComment(vo);

		return "redirect:website?contents_idx=" + contents_idx;
	}
	
	@RequestMapping(value = "mobile_comments", method = RequestMethod.POST)
	public String mobile_comments(CommentsVO vo, HttpSession session, ModelMap modelMap,
			@RequestParam(value = "contents_idx", defaultValue = "") String contents_idx) {
		
		String authority = (String) session.getAttribute("authority");
		if (authority.equals("member")) {
			String member_id = (String) session.getAttribute("id");
			vo.setUser_id(member_id);
			
		} else if (authority.equals("business")) {
			
			String business_id = (String) session.getAttribute("business_id");
			vo.setUser_id(service.getBusiness_name(business_id));
		} 
		
		String content = vo.getComment();
		content = content.replace("\n", "<br>");
		vo.setComment(content);
		service.insert_Mobile_Comment(vo);
		
		return "redirect:detail?contents_idx=" + contents_idx;
	}
	
	@RequestMapping(value = "mobile_answer", method = RequestMethod.POST)
	public String mobile_answer(CommentsVO vo, HttpSession session, ModelMap modelMap,
			@RequestParam(value = "contents_idx", defaultValue = "") String contents_idx) {
		
		String authority = (String) session.getAttribute("authority");
		if (authority.equals("member")) {
			String member_id = (String) session.getAttribute("id");
			vo.setUser_id(member_id);
		} else if (authority.equals("business")) {
			
			String business_id = (String) session.getAttribute("business_id");
			vo.setUser_id(service.getBusiness_name(business_id));
		} 
		
		String content = vo.getComment();
		content = content.replace("\n", "<br>");
		vo.setComment(content);
		service.insert_Mobile_Comment(vo);
		
		return "redirect:detail?contents_idx=" + contents_idx;
	}
	
	@RequestMapping(value = "comment_check", method = RequestMethod.POST)
	public @ResponseBody String comment_check(HttpSession session, CommentsVO vo,
			@RequestParam(value = "idx", defaultValue = "") int idx) {
		
		int check = 1;
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority.equals("member")) {
			String member_id = (String) session.getAttribute("id");
			vo.setIdx(idx);
			vo.setUser_id(member_id);
			vo = service.comment_check(vo);
			
			if(vo == null) {
				check = 0;
			} 
			
		} else if (authority.equals("business")) {
			String business_id = (String) session.getAttribute("business_id");
			String business_name = service.getBusiness_name(business_id);
			vo.setIdx(idx);
			vo.setUser_id(business_name);
			vo = service.comment_check(vo);
			
			if(vo == null) {
				check = 0;
			}
		} else {
			check = 0;
		}
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "comment_delete")
	public String comment_delete(
			@RequestParam(value = "contents_idx", defaultValue = "") String contents_idx,
			@RequestParam(value = "comment_idx", defaultValue = "") int comment_idx) throws IOException {
		
		service.delete_comment(comment_idx);
		service.delete_answer(comment_idx);
		
		return "redirect:website?contents_idx=" + contents_idx;
	}
	
	@RequestMapping(value = "comment_update", method = RequestMethod.POST)
	public String comment_update(HttpServletRequest request, CommentsVO vo,
			HttpSession session, HttpServletResponse response,
			@RequestParam(value = "contents_idx", defaultValue = "") String contents_idx,
			@RequestParam(value = "comment_idx", defaultValue = "") int comment_idx) throws IOException {
		
		vo.setIdx(comment_idx);
		System.out.println("comment_idx==========>"+comment_idx);
		
		if (vo.getComment() == null) {
			ScriptUtils.alertAndMovePage(response, "댓글을 입력해 주세요. ", "detail?contents_idx=" + contents_idx);
		}

		if (vo.getScore() == null) {
			ScriptUtils.alertAndMovePage(response, "별점을 입력해 주세요. ", "detail?contents_idx=" + contents_idx);
		}

		String authority = (String) session.getAttribute("authority");
		if (authority.equals("member")) {
			String member_id = (String) session.getAttribute("id");
			vo.setUser_id(member_id);
		} else if (authority.equals("business")) {
			String business_id = (String) session.getAttribute("business_id");

			vo.setUser_id(service.getBusiness_name(business_id));
		}

		String content = vo.getComment();
		content = content.replace("\n", "<br>");
		vo.setComment(content);
		service.updateComment(vo);

		return "redirect:website?contents_idx=" + contents_idx;
	}

	@RequestMapping(value = "answer", method = RequestMethod.POST)
	public String insertAnswer(HttpSession session, HttpServletRequest request, Comments_answerVO vo,
			HttpServletResponse response) throws IOException {
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority == null) {
			ScriptUtils.alertAndMovePage(response, "로그인을 해주세요. ", "detail?contents_idx=" + vo.getContents_idx());
		}
		
		if (authority.equals("member")) {
			String member_id = (String) session.getAttribute("id");
			vo.setUser_id(member_id);

		} else if (authority.equals("business")) {
			String business_id = (String) session.getAttribute("business_id");
			vo.setUser_id(service.getBusiness_name(business_id));
		}
		
		service.insertAnswer(vo);
		return "redirect:website?contents_idx=" + vo.getContents_idx();
	}
	
	@RequestMapping(value = "answer_delete", method = RequestMethod.POST)
	public @ResponseBody String answer_delete(HttpSession session, Comments_answerVO vo,
			@RequestParam(value = "idx", defaultValue = "") int idx) {
		
		int check = 1;
		vo.setIdx(idx);
		
		String authority = (String) session.getAttribute("authority");
		
		if (authority.equals("member")) {
			String member_id = (String) session.getAttribute("id");
			vo.setUser_id(member_id);
			vo = service.answer_check(vo);
			
			if(vo == null) {
				check = 0;
			} else {
				vo.setIdx(idx);
				service.delete_answer(idx);
			}

		} else if (authority.equals("business")) {
			String business_id = (String) session.getAttribute("business_id");
			vo.setUser_id(business_id);
			vo = service.answer_check(vo);
			
			if(vo == null) {
				check = 0;
			} else {
				vo.setIdx(idx);
				service.delete_answer(idx);
			}
		}
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "comment_report", method = RequestMethod.POST)
	public @ResponseBody String comment_report(HttpSession session, CommentsVO vo,
			@RequestParam(value = "idx", defaultValue = "") int idx) {
		
		int check = 1;
		CommentsVO comments = service.getcomments(idx);
		
		service.comment_report_cnt(idx);
		
		return String.valueOf(check);
	}
	
	@RequestMapping(value = "answer_report", method = RequestMethod.POST)
	public @ResponseBody String answer_report(HttpSession session, Comments_answerVO vo,
			@RequestParam(value = "idx", defaultValue = "") int idx) {
		
		int check = 1;
		String authority = (String) session.getAttribute("authority");
		CommentsVO comments = service.getcomments(idx);
		
		if (authority.equals("member")) {
			
			service.answer_report_cnt(idx);
			
		} else if (authority.equals("business")) {
			
			service.answer_report_cnt(idx);
		}
		return String.valueOf(check);
	}

	/** 임시저장 **/
	@RequestMapping(value = "temporary_check")
	public String temporary_check(HttpSession session) {
		
		String business = (String) session.getAttribute("business_id");
		Temporary_storage_VO temporary = service.temporary_check(business);
		
		int check = 0;
		
		if (temporary == null) {
			check = 1;
		}
		return String.valueOf(check);
	}

	/**
	 * 임시저장
	 * 
	 * @throws IOException
	 **/
	@RequestMapping(value = "temporary", method = RequestMethod.POST)
	public @ResponseBody String temporary(HttpSession session, Temporary_storage_VO vo, ModelMap modelMap,
			List<MultipartFile> file) throws IOException, InterruptedException {
		
		int check = 0;
		
		String business_num = (String) session.getAttribute("business_id");

		service.delete_temporary_img(business_num);

		Temporary_storage_VO temporary = service.temporary_check(business_num);
		vo.setBusiness(business_num);
		
		if (temporary == null) {
			vo.setBusiness(business_num);
			service.insertTemporary(vo);
			Temporary_storage_VO temporary1 = service.temporary_check(business_num);
			
			List<Temporary_ImgVO> img_list = new ArrayList<Temporary_ImgVO>();
			String title = temporary1.getTitle();
			
			for (MultipartFile imgs : file) {
				String imgName = imgs.getOriginalFilename();
				if (imgName != null && !imgName.equals("")) {

					File target = new File(uploadPath, imgName);
					File target1 = new File(watermarkPath, imgName);
					
					target.setReadable(true, true);
					target.setWritable(true, true);
					target.setExecutable(true, true);
					
					target1.setReadable(true, true);
					target1.setWritable(true, true);
					target1.setExecutable(true, true);
					
					FileCopyUtils.copy(imgs.getBytes(), target);
					FileCopyUtils.copy(imgs.getBytes(), target1);

					
					Calendar cal = Calendar.getInstance();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
					String time = dateFormat.format(cal.getTime());
					String path = "/usr/local/img/watermark/"+imgName;
//					String path = "/C:/workspace/img/watermark/"+imgName;
					watermark(path, title);
					
					String imgName_watermark = time+"_"+imgName;
					Temporary_ImgVO imgvo = new Temporary_ImgVO(business_num, imgName_watermark);
					img_list.add(imgvo);
				}
			}

			service.insertTemporary_Img(img_list);
			check = 1;
		} else {
			service.updateTemporary(vo);
			Temporary_storage_VO temporary1 = service.temporary_check(business_num);

			List<Temporary_ImgVO> img_list = new ArrayList<Temporary_ImgVO>();
			String title = temporary1.getTitle();
			
			for (MultipartFile imgs : file) {
				String imgName = imgs.getOriginalFilename();
				if (imgName != null && !imgName.equals("")) {

					File target = new File(uploadPath, imgName);
					File target1 = new File(watermarkPath, imgName);
					
					target.setReadable(true, true);
					target.setWritable(true, true);
					target.setExecutable(true, true);
					
					target1.setReadable(true, true);
					target1.setWritable(true, true);
					target1.setExecutable(true, true);
					
					FileCopyUtils.copy(imgs.getBytes(), target);
					FileCopyUtils.copy(imgs.getBytes(), target1);

					Calendar cal = Calendar.getInstance();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
					String time = dateFormat.format(cal.getTime());
					String path = "/usr/local/img/watermark/"+imgName;
//					String path = "/C:/workspace/img/watermark/"+imgName;
					watermark(path, title);
					
					String imgName_watermark = time+"_"+imgName;
					Temporary_ImgVO imgvo = new Temporary_ImgVO(business_num, imgName_watermark);
					img_list.add(imgvo);
				}
			}

			service.insertTemporary_Img(img_list);
			check = 1;
		}
		
//		List<Temporary_ImgVO> img_list = new ArrayList<Temporary_ImgVO>();
//		String title = temporary.getTitle();
//		
//		for (MultipartFile imgs : file) {
//			String imgName = imgs.getOriginalFilename();
//			if (imgName != null && !imgName.equals("")) {
//
//				File target = new File(uploadPath, imgName);
//				File target1 = new File(watermarkPath, imgName);
//				
//				FileCopyUtils.copy(imgs.getBytes(), target);
//				FileCopyUtils.copy(imgs.getBytes(), target1);
//
//				Temporary_ImgVO imgvo = new Temporary_ImgVO(business_num, imgName);
//				img_list.add(imgvo);
//				
//				String path = "/C:/workspace/img/watermark/"+imgName;
//				watermark(path, title);
//			}
//		}
//
//		service.insertTemporary_Img(img_list);


		if (check == 1) {
			session.setAttribute("temporary", "Y");
		}

		modelMap.addAttribute("temporary", "Y");
		return String.valueOf(check);
	}

	/**
	 * 미리보기
	 * 
	 * @throws IOException
	 **/
	@RequestMapping(value = "Preview")
	public String Preview(HttpSession session, HttpServletRequest request, ModelMap modelMap,
			HttpServletResponse response) throws IOException {
		
		int check = 1;
		String business = (String) session.getAttribute("business_id");
		Temporary_storage_VO temporary = service.temporary_check(business);
		String t = request.getParameter("temporary");
		
		List<Temporary_ImgVO> contents_img = service.getTemporary_Img(business);
		Contents_ImgVO content_img = new Contents_ImgVO();
		for (int i = 0; i < contents_img.size(); i++) {
			if (i == 0) {
				content_img.setImg_1(contents_img.get(i).getImg_path());
			}

			if (i == 1) {
				content_img.setImg_2(contents_img.get(i).getImg_path());
			}

			if (i == 2) {
				content_img.setImg_3(contents_img.get(i).getImg_path());
			}

			if (i == 3) {
				content_img.setImg_4(contents_img.get(i).getImg_path());
			}

			if (i == 4) {
				content_img.setImg_5(contents_img.get(i).getImg_path());
			}

			if (i == 5) {
				content_img.setImg_6(contents_img.get(i).getImg_path());
			}

			if (i == 6) {
				content_img.setImg_7(contents_img.get(i).getImg_path());
			}

			if (i == 7) {
				content_img.setImg_8(contents_img.get(i).getImg_path());
			}
		}
		
		if(temporary.getLayout_type().equals("1") || temporary.getLayout_type().equals("2") || temporary.getLayout_type().equals("4")) {
//			String[] sub_title = temporary.getSub_title().split(",");
			String[] sub_title = temporary.getSub_title().split(",");
			modelMap.addAttribute("sub_title", sub_title);
		}

		for (int i = 0; i < 5; i++) {
			if (Integer.parseInt(temporary.getLayout_type()) == i) {
				modelMap.addAttribute("t", t);
				modelMap.addAttribute("content_list", temporary);
				modelMap.addAttribute("content_img", content_img);
				modelMap.addAttribute("check", check);
				return "view/detail/detail_" + i;
			}
		}
		return "view/Preview";
	}

	@RequestMapping(value = "Preview_check", method = RequestMethod.POST)
	public @ResponseBody String Preview_check(HttpSession session, Temporary_storage_VO vo, ModelMap modelMap) {
		
		int check = 0;
		
		String temporary = (String) session.getAttribute("temporary");
		
		if (temporary.equals("Y")) {
			check = 1;
		}
		
		return String.valueOf(check);
	}

	/**
	 * 마이 페이지
	 * 
	 * @throws IOException
	 **/
	@RequestMapping(value = "login_check", method = RequestMethod.GET)
	public String login_check(HttpSession session, HttpServletResponse response) throws Exception {

		String business = (String) session.getAttribute("business_id");
		String member = (String) session.getAttribute("id");
//		String authority = (String) session.getAttribute("authority");

		if ((business == null || business.equals("")) && (member == null || member.equals(""))) {
			ScriptUtils.alertAndMovePage(response, "로그인을 해주세요", "login");
		} else {
			if (member != null) {
				return "view/member_page/member_password_check";
			} else if (business != null) {
				return "view/business_page/business_password_check";
			}
		}
		return "view/login";
	}
	
//	
//	@RequestMapping(value = "login_check", method = RequestMethod.GET)
//	public String password_check(HttpServletResponse response, HttpSession session) throws IOException {
//
//		String authority = (String) session.getAttribute("authority");
//		if (authority == null || authority.equals("")) {
//			ScriptUtils.alertAndMovePage(response, "로그인을 해주세요.", "login");
//		} else {
//			if (authority.equals("member")) {
//				return "view/member_page/member_password_check";
//			} else if (authority.equals("business")) {
//				return "view/business_page/business_password_check";
//			}
//		}
//		return "view/login";
//	}
		
	/** 메뉴얼 **/
	@RequestMapping(value = "manual")
	public String manual(HttpServletRequest request, ModelMap modelMap) {
		String mini = request.getParameter("mini");
		
		modelMap.addAttribute("mini", mini);
		return "view/manual";
	}
	
	/** 공지사항 페이지 **/
	@RequestMapping(value = "notice_list", method = RequestMethod.GET)
	public String notice_list(HttpServletRequest request, ModelMap modelMap, PagingVO_2 vo, NoticeVO noticeVO,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage,
			@RequestParam(value = "title", required = false) String title) {
		
		String sql = "";
		
		if(title != null) {
			modelMap.addAttribute("title", title);
			sql = " and title like '%" + title + "%'";
		}
		
		vo.setSql(sql);
		int total = service.notice_count(vo);
		modelMap.addAttribute("total", total);
		
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
			List<NoticeVO> notice_list = service.selectNoticeList(vo);
			modelMap.addAttribute("notice_list", notice_list);
		}
		
		return "view/notice_list";
	}
	
	@RequestMapping(value = "notice_detail")
	public String notice_detial(ModelMap modelMap, HttpSession session,
			@RequestParam(value = "idx", required = false) int idx) {
		
		String view = (String) session.getAttribute("notice_view");
		
		if(view == null) {
			session.setAttribute("notice_view", String.valueOf(idx));
			service.add_notice_view(idx);
		} else {
			if(!view.equals(String.valueOf(idx))) {
				session.setAttribute("notice_view", String.valueOf(idx));
				service.add_notice_view(idx);
			}
		}
		
		NoticeVO vo = service.getNotice_detail(idx);
		modelMap.addAttribute("vo", vo);
		
		return "view/notice_detail";
	}
	
	@RequestMapping("download")
	@ResponseBody
	public byte[] downlod(HttpServletResponse response, @RequestParam String filename) throws IOException{
		File file = new File(notice_path, filename);
		byte[] bytes = FileCopyUtils.copyToByteArray(file);
		
		String fn = new String(file.getName().getBytes(), "utf-8");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + fn + "\"");
		response.setContentLength(bytes.length);
		return bytes;
	}
	
	@RequestMapping(value = "mobile_payment_check", method = RequestMethod.POST)
	public @ResponseBody String mobile_payment_check(HttpSession session) {
		
		int check = 1;
		
		String id = (String) session.getAttribute("id");
		
		if(id != null) {
			check = 0;
		}
		
		return String.valueOf(check);
	}
	
//	/** 전시 수정 **/
//	@RequestMapping(value = "contents_update", method = RequestMethod.GET)
//	public String contents_update(HttpServletRequest request, ModelMap modelMap, HttpSession session, ContentsVO vo,
//			HttpServletResponse response) throws IOException {
//		
////		String id = (String) session.getAttribute("id");
////		if(id == null) {
////			ScriptUtils.alertAndMovePage(response, "개인 회원으로 로그인 해주세요.", "main");
////		}
//		int contents_idx = service.getContents_idx();
//		ContentsVO content_list = service.selectContent(contents_idx);
//		
//		modelMap.addAttribute("content_list", content_list);
//		
//		return "view/business_page/contents_update";
//	}
	
	/** 전시 수정 
	 * @throws IOException **/
//	@SuppressWarnings("null")
	@RequestMapping(value = "contents_update", method = RequestMethod.POST)
	public String contents_update_post(HttpServletRequest request, ModelMap modelMap, ContentsVO vo, List<MultipartFile> file,
			MultipartFile symbol_img, MultipartFile logo_name_, MultipartFile web_main_name_, MultipartFile banner,
			HttpSession session, HttpServletResponse response, Web_menuVO web_menuvo) throws IOException, InterruptedException {
		
		int contents_idx = service.getContents_idx();
		ContentsVO content_list = service.selectContent(contents_idx);
		List<ImgVO> contents_img = service.getContents_img(contents_idx);
		System.out.println(contents_img);
		
		modelMap.addAttribute("content_list",content_list);
		vo.setIdx(contents_idx);
//		String content = vo.getContent();
//		content = content.replace("\n", "<br>");
//		vo.setContent(content);
		service.delete_img(contents_idx);
		
		
		String business_id = (String) session.getAttribute("business_id");
		vo.setBusiness_num(business_id);
//		vo.setTel(service.getTel(business_id)); 전시등록 시, 직접 입력하는 것으로 바꿈
		vo.setBusiness(service.getBusiness_name(business_id));
		
		String saveName = symbol_img.getOriginalFilename();
		File target_1 = new File(uploadPath, saveName);
		FileCopyUtils.copy(symbol_img.getBytes(), target_1);
		
		String logoName = logo_name_.getOriginalFilename();
		File target_2 = new File(logo_path, logoName);
		FileCopyUtils.copy(logo_name_.getBytes(), target_2);
		
		String web_main_Name = web_main_name_.getOriginalFilename();
		File target_5 = new File(web_main_path, web_main_Name);
		FileCopyUtils.copy(web_main_name_.getBytes(), target_5);
		
		String bannerName = banner.getOriginalFilename();
		File target_3 = new File(banner_path, bannerName);
		FileCopyUtils.copy(banner.getBytes(), target_3);
		
		vo.setImg_path(saveName);
		vo.setLogo_name(logoName);
		vo.setWeb_main_name(web_main_Name);
		vo.setBanner_name(bannerName);
		
		String content = vo.getContent();
		content = content.replace("\n", "<br>");
		vo.setContent(content);
		
		service.updateContents(vo);
		
		List<ImgVO> img_list = new ArrayList<ImgVO>();
		
		String title = vo.getTitle();
		
		for (MultipartFile imgs : file) {
			int img_seq = 0;
			String imgName = imgs.getOriginalFilename();
			
			if (imgName != null && !imgName.equals("")) {
				
				File target = new File(uploadPath, imgName);
				File target1 = new File(watermarkPath, imgName);
				
				target.setReadable(true, true);
				target.setWritable(true, true);
				target.setExecutable(true, true);
				
				target1.setReadable(true, true);
				target1.setWritable(true, true);
				target1.setExecutable(true, true);
				
				FileCopyUtils.copy(imgs.getBytes(), target);
				FileCopyUtils.copy(imgs.getBytes(), target1);
				
		        Calendar cal = Calendar.getInstance();
		        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		        String time = dateFormat.format(cal.getTime());
				
				String path = "/usr/local/img/watermark/"+imgName;
				watermark(path, title);
				
				String imgName_watermark = time+"_"+imgName;
				
				ImgVO imgvo = new ImgVO(contents_idx, img_seq, imgName_watermark);
				img_list.add(imgvo);
				img_seq++;
			}
		}

		if (img_list != null) {
			service.imgupload(img_list);
		}
		
		return "view/business_page/business_contents_list";
	}
//	@RequestMapping(value = "contents_update", method = RequestMethod.POST)
//	public String contents_update_post(HttpServletRequest request, ModelMap modelMap, ContentsVO vo, List<MultipartFile> file,
//			MultipartFile symbol_img, HttpSession session, HttpServletResponse response,
//			@RequestParam(value = "captcha", defaultValue = "") String captcha) throws IOException {
//		
//		String content = vo.getContent();
//		content = content.replace("\n", "<br>");
//		vo.setContent(content);
//		
//		if (vo.getTitle() == null || vo.getTitle().equals("")) {
//			modelMap.addAttribute("vo", vo);
//			ScriptUtils.alertAndMovePage(response, "제목을 입력해주세요.", "updateContents");
//		}
//		
//		if (vo.getStart_time() == null || vo.getStart_time().equals("")) {
//			modelMap.addAttribute("vo", vo);
//			ScriptUtils.alertAndMovePage(response, "시간을 입력해주세요.", "updateContents");
//		}
//		
//		if (vo.getEnd_time() == null || vo.getEnd_time().equals("")) {
//			modelMap.addAttribute("vo", vo);
//			ScriptUtils.alertAndMovePage(response, "시간을 입력해주세요.", "updateContents");
//		}
//		
//		if (vo.getAddress() == null || vo.getAddress().equals("") || vo.getWeb_address() == null || vo.getWeb_address().equals("")) {
//			modelMap.addAttribute("vo", vo);
//			ScriptUtils.alertAndMovePage(response, "장소를 입력해주세요.", "updateContents");
//		}
//		
////		String Captcha = (String) session.getAttribute("captcha");
////		
////		if (!captcha.equals(Captcha)) {
////			modelMap.addAttribute("vo", vo);
////			ScriptUtils.alertAndMovePage(response, "보안 문자를 다시 입력해주세요.", "insertContents");
////		}
//		
//		String business_id = (String) session.getAttribute("business_id");
//		vo.setBusiness_num(business_id);
//		vo.setTel(service.getTel(business_id));
//		vo.setBusiness(service.getBusiness_name(business_id));
//		
//		String saveName = symbol_img.getOriginalFilename();
//		
//		File target_1 = new File(uploadPath, saveName);
//		FileCopyUtils.copy(symbol_img.getBytes(), target_1);
//		
//		vo.setImg_path(saveName);
//		service.updateContents(vo);
//		
//		int contents_idx = service.getContents_idx();
//		List<ImgVO> img_list = new ArrayList<ImgVO>();
//		
//		for (MultipartFile imgs : file) {
//			int img_seq = 0;
//			String imgName = imgs.getOriginalFilename();
//			if (imgName != null && !imgName.equals("")) {
//				
//				File target = new File(uploadPath, imgName);
//				FileCopyUtils.copy(imgs.getBytes(), target);
//				
//				ImgVO imgvo = new ImgVO(contents_idx, img_seq, imgName);
//				img_list.add(imgvo);
//				img_seq++;
//			}
//		}
//		
//		if (img_list != null) {
//			service.imgupload(img_list);
//		}
//		
//		return "view/business_page/business_contents_list";
//	}
	
	
	@RequestMapping(value = "divison")
	public String divison(ModelMap modelMap,
			@RequestParam(value = "category", defaultValue = "0") int category) {
		
		if(category == 0) {
			category = 4;
		}
		
		modelMap.addAttribute("category", category);
		
		return "view/divison";
	}
}
