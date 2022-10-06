package com.website;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.business.BusinessVO;
import com.common.PagingVO_2;
import com.common.PagingVO_3;
import com.contents.ContentsVO;
import com.contents.comments.CommentsVO;
import com.contents.comments.Comments_answerVO;
import com.notice.Web_notice;

@Service
public class WebsiteSvc {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Introduction_img> get_Introduction_list(int contents_idx) {
		return sqlSession.selectList("get_Introduction_list", contents_idx);
	}
	
	public List<GalleryVO> get_Gallery_list(PagingVO_3 galleryvo) {
		return sqlSession.selectList("get_Gallery_list", galleryvo);
	}
	
	public int get_introduction_cnt(int contents_idx) {
		return sqlSession.selectOne("get_introduction_cnt", contents_idx);
	}
	
	public int get_gallery_cnt(PagingVO_3 galleryvo) {
		return sqlSession.selectOne("get_gallery_cnt", galleryvo);
	}
	
	public void update_main_img(ContentsVO vo) {
		sqlSession.insert("update_main_img", vo);
	}
	
	public int web_notice_count(PagingVO_2 vo) {
		return sqlSession.selectOne("web_notice_count", vo);
	}
	
	public List<Web_notice> select_web_NoticeList(PagingVO_2 vo) {
		return sqlSession.selectList("select_web_NoticeList", vo);
	}
	
	public void notice_management_insert(Web_notice noticeVO) {
		sqlSession.insert("notice_management_insert", noticeVO);
	}
	
	public void notice_management_update(Web_notice noticeVO) {
		sqlSession.insert("notice_management_update", noticeVO);
	}
	
	public int report_comments_cnt(PagingVO_2 vo) {
		return sqlSession.selectOne("report_comments_cnt", vo);
	}
	
	public List<CommentsVO> select_report_comments(PagingVO_2 vo) {
		return sqlSession.selectList("select_report_comments", vo);
	}
	
	public int report_answers_cnt(PagingVO_2 vo) {
		return sqlSession.selectOne("report_answers_cnt", vo);
	}
	
	public List<Comments_answerVO> select_report_answers(PagingVO_2 vo) {
		return sqlSession.selectList("select_report_answers", vo);
	}

	public Web_notice get_web_notice(int idx) {
		return sqlSession.selectOne("get_web_notice", idx);
	}

	public void set_gallery(GalleryVO gallery) {
		sqlSession.insert("set_gallery", gallery);
	}

	public int get_gallery_idx(int contents_idx) {
		return sqlSession.selectOne("get_gallery_idx", contents_idx);
	}

	public void set_gallery_img(List<Gallery_img> gallery_list) {
		for(Gallery_img img : gallery_list) {
			sqlSession.insert("set_gallery_img", img);
		}
	}

	public List<Gallery_img> get_gallery_img(int gallery_idx) {
		return sqlSession.selectList("get_gallery_img", gallery_idx);
	}

	public void set_pop_up(Pop_upVO pop_up) {
		sqlSession.insert("set_pop_up", pop_up);
	}

	public Pop_upVO get_pop_up(int contents_idx) {
		return sqlSession.selectOne("get_pop_up", contents_idx);
	}

	public void update_pop_up(Pop_upVO pop_up) {
		sqlSession.insert("update_pop_up", pop_up);
	}

	public int get_pop_up_cnt(int contents_idx) {
		return sqlSession.selectOne("get_pop_up_cnt", contents_idx);
	}
	
	public String comments_write(String c) {
		return sqlSession.selectOne("comments_write", c);
	}
	
//	public void comments_update(CommentsVO commentsVO) {
//		sqlSession.insert("comments_update", commentsVO);
//	}

	public void user_delete_management(String writer) {
		sqlSession.insert("user_delete_management", writer);
	}

	public void user_delete_comments(String c) {
		sqlSession.insert("user_delete_comments", c);
	}
	
	public void user_delete_answer(String c) {
		sqlSession.insert("user_delete_answer", c);
	}

	public void notice_delete_management(String c) {
		sqlSession.insert("notice_delete_management", c);
	}
	
	public int get_web_notice_cnt(int contents_idx) {
		return sqlSession.selectOne("get_web_notice_cnt", contents_idx);
	}

	public List<Web_notice> get_main_notice(int contents_idx) {
		return sqlSession.selectList("get_main_notice", contents_idx);
	}

	public GalleryVO get_gallery(int contents_idx) {
		return sqlSession.selectOne("get_gallery", contents_idx);
	}

	public int get_gallery_cnt_2(int contents_idx) {
		return sqlSession.selectOne("get_gallery_cnt_2", contents_idx);
	}

	public void create_gallery(ContentsVO content_list) {
		sqlSession.selectOne("create_gallery", content_list);
	}

	public List<Gallery_img> get_gallery_img_list(int contents_idx) {
		return sqlSession.selectList("get_gallery_img_list", contents_idx);
	}

	public int get_gallery_list_cnt(int contents_idx) {
		return sqlSession.selectOne("get_gallery_list_cnt", contents_idx);
	}

	public void set_gallery_img_list(List<Gallery_img> gallery_list) {
		for(Gallery_img img : gallery_list) {
			sqlSession.insert("set_gallery_img_list", img);
		}
	}

	public void media_insert(GalleryVO galleryvo) {
		sqlSession.insert("media_insert", galleryvo);
	}

	public void update_gallery(GalleryVO gallery) {
		sqlSession.insert("update_gallery", gallery);
	}

	public void delete_gallery(Gallery_img gallery_item) {
		sqlSession.insert("delete_gallery", gallery_item);
	}

	public int get_img_cnt(String imgName) {
		return sqlSession.selectOne("get_img_cnt", imgName);
	}

	public List<Gallery_img> get_existing_list(int contents_idx) {
		return sqlSession.selectList("get_existing_list", contents_idx);
	}

	public void remove_gallery(List<Gallery_img> img_list) {
		for(Gallery_img img_path : img_list) {
			sqlSession.insert("remove_gallery", img_path);
		}
	}

	public void add_web_notice_view(int idx) {
		sqlSession.insert("add_web_notice_view", idx);
	}

	public Web_menuVO get_web_menu(int contents_idx) {
		return sqlSession.selectOne("get_web_menu", contents_idx);
	}

	public void introduction_insert(Introduction_img introduction) {
		sqlSession.insert("introduction_insert", introduction);
	}

	public void introduction_update(Introduction_img introduction) {
		sqlSession.insert("introduction_update", introduction);
	}

	public String get_business_num(int contents_idx) {
		return sqlSession.selectOne("get_business_num", contents_idx);
	}

	public BusinessVO get_business(String business_num) {
		return sqlSession.selectOne("get_business", business_num);
	}
}
