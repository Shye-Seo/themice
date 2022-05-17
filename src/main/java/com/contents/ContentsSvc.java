package com.contents;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.business.BusinessVO;
import com.certification.Member_findVO;
import com.common.ImgVO;
import com.common.PagingVO;
import com.common.PagingVO_2;
import com.common.Temporary_ImgVO;
import com.common.loginVO;
import com.contents.comments.CommentsVO;
import com.contents.comments.Comments_answerVO;
import com.contents.comments.Report_answersVO;
import com.contents.comments.Report_commentsVO;
import com.member.InterestVO;
import com.member.MemberVO;
import com.notice.NoticeVO;
import com.payment.PaymentVO;
import com.website.Introduction_img;

@Service
public class ContentsSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ContentsVO> getContentinfo(PagingVO vo) {
		return sqlSession.selectList("getContentinfo", vo);
	}
	
	public List<ContentsVO> get_m_Contentinfo(PagingVO vo) {
		return sqlSession.selectList("get_m_Contentinfo", vo);
	}

	public void insertContents(ContentsVO entity) {
		sqlSession.insert("insertContents", entity);
	}

	public ContentsVO selectContent(int contents_idx) {
		return sqlSession.selectOne("selectContent", contents_idx);
	}

	public void insertComment(CommentsVO vo) {
		sqlSession.insert("insertComment", vo);
	}
	
	public void insert_Mobile_Comment(CommentsVO vo) {
		sqlSession.insert("insert_Mobile_Comment", vo);
	}

	public List<CommentsVO> selectComment(PagingVO_2 vo) {
		return sqlSession.selectList("selectComment", vo);
	}

	public List<Comments_answerVO> selectAnswer(int contents_idx) {
		return sqlSession.selectList("selectAnswer", contents_idx);
	}

	public void insertAnswer(Comments_answerVO vo) {
		sqlSession.insert("insertAnswer", vo);
	}

	public int comments_count(int contents_idx) {
		return sqlSession.selectOne("comments_count", contents_idx);
	}

	public void imgupload(List<ImgVO> img_list) {

		for (ImgVO img : img_list) {
			sqlSession.insert("imgupload", img);
		}
	}

	public int getContents_idx() {
		return sqlSession.selectOne("getContents_idx");
	}

	public MemberVO selectMemeber(String id) {
		return sqlSession.selectOne("selectMemeber", id);
	}

	public List<ImgVO> getContents_img(int contents_idx) {
		return sqlSession.selectList("getContents_img", contents_idx);
	}

	public Temporary_storage_VO temporary_check(String business) {
		return sqlSession.selectOne("temporary_check", business);
	}

	public void insertTemporary(Temporary_storage_VO vo) {
		sqlSession.insert("insertTemporary", vo);
	}

	public void updateTemporary(Temporary_storage_VO vo) {
		sqlSession.insert("updateTemporary", vo);
	}

	public int countContents() {
		return sqlSession.selectOne("countContents");
	}

	public int countSelectContents(PagingVO vo) {
		return sqlSession.selectOne("countSelectContents", vo);
	}
	
	public BusinessVO business_password_check(BusinessVO bo) {
		return sqlSession.selectOne("business_password_check", bo);
	}
	
	public List<ContentsVO> getContents_idx(String business_name) {
		return sqlSession.selectList("getContents_idx_business", business_name);
	}

	public String getTel(String business_id) {
		return sqlSession.selectOne("getTel", business_id);
	}

	public InterestVO getInterest(InterestVO vo) {
		return sqlSession.selectOne("getInterest", vo);
	}

	public void insertInterest(InterestVO vo) {
		sqlSession.insert("insertInterest", vo);
	}

	public void deleteInterest(InterestVO vo) {
		sqlSession.insert("deleteInterest", vo);
	}

	public List<ContentsVO> getSection_2_list() {
		return sqlSession.selectList("getSection_2_list");
	}
	
	public List<ContentsVO> m_getSection_2_list() {
		return sqlSession.selectList("m_getSection_2_list");
	}

	public List<NoticeVO> getmainNotice() {
		return sqlSession.selectList("getmainNotice");
	}

	public int countNotice() {
		return sqlSession.selectOne("countNotice");
	}

	public List<NoticeVO> getNotice_list(PagingVO vo) {
		return sqlSession.selectList("getNotice_list", vo);
	}

	public String getBusiness_name(String business_num) {
		return sqlSession.selectOne("getBusiness_name", business_num);
	}

	public void insertTemporary_Img(List<Temporary_ImgVO> img_list) {
		for (Temporary_ImgVO img : img_list) {
			sqlSession.insert("insertTemporary_Img", img);
		}
	}

	public List<Temporary_ImgVO> getTemporary_Img(String business) {
		return sqlSession.selectList("getTemporary_Img", business);
	}
	
	public void delete_temporary_img(String business_num) {
		sqlSession.insert("delete_temporary_img", business_num);
	}

	public void updateComment(CommentsVO vo) {
		sqlSession.insert("updateComment", vo);
	}
	
	public int notice_count(PagingVO_2 vo) {
		return sqlSession.selectOne("notice_count", vo);
	}

	public List<NoticeVO> selectNoticeList(PagingVO_2 vo) {
		return sqlSession.selectList("selectNoticeList", vo);
	}

	public NoticeVO getNotice_detail(int idx) {
		return sqlSession.selectOne("getNotice_detail", idx);
	}

	public List<ContentsVO> getSection_3_list(String day) {
		return sqlSession.selectList("getSection_3_list", day);
	}
	
	public List<ContentsVO> m_getSection_3_list() {
		return sqlSession.selectList("m_getSection_3_list");
	}

	public List<AdvertisementVO> getSection_1_list() {
		return sqlSession.selectList("getSection_1_list");
	}

	public int getSection_3_cnt(String day) {
		return sqlSession.selectOne("getSection_3_cnt", day);
	}

	public int getSection_1_cnt() {
		return sqlSession.selectOne("getSection_1_cnt");
	}
	
	public CommentsVO comment_check(CommentsVO vo) {
		return sqlSession.selectOne("comment_check", vo);
	}

	public void delete_comment(int idx) {
		sqlSession.insert("delete_comment", idx);
	}

	public void delete_answer(int comment_idx) {
		sqlSession.insert("delete_answer", comment_idx);
	}

	public Comments_answerVO answer_check(Comments_answerVO vo) {
		return sqlSession.selectOne("answer_check", vo);
	}

	public PaymentVO check_payment(PaymentVO payment) {
		return sqlSession.selectOne("check_payment", payment);
	}

	public void add_contents_view(int contents_idx) {
		sqlSession.insert("add_contents_view", contents_idx);
	}

	public String getContent_Score(int contents_idx) {
		return sqlSession.selectOne("getContent_Score", contents_idx);
	}

	public void add_notice_view(int idx) {
		sqlSession.insert("add_notice_view", idx);
	}

	public CommentsVO comment_delete_check(int comment_idx) {
		return sqlSession.selectOne("comment_delete_check", comment_idx);
	}

	public void comment_report(Report_commentsVO vo) {
		sqlSession.insert("comment_report", vo);
	}

	public CommentsVO getcomments(int idx) {
		return sqlSession.selectOne("getcomments", idx);
	}

	public int comments_report_check(Report_commentsVO vo) {
		return sqlSession.selectOne("comments_report_check", vo);
	}

	public void comment_report_cnt(int idx) {
		sqlSession.insert("comment_report_cnt", idx);
	}

	public int answers_report_check(Report_answersVO vo) {
		return sqlSession.selectOne("answers_report_check", vo);
	}

	public void answer_report(Report_answersVO vo) {
		sqlSession.insert("answer_report", vo);
	}

	public void answer_report_cnt(int idx) {
		sqlSession.insert("answer_report_cnt", idx);
	}

	public void insert_introduction_img(Introduction_img introduction_img) {
		sqlSession.insert("insert_introduction_img", introduction_img);
	}
}
