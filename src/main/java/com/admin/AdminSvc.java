package com.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.business.BusinessVO;
import com.contents.AdvertisementVO;
import com.contents.ContentsVO;
import com.member.MemberVO;
import com.notice.NoticeVO;
import com.notice.Notice_ImgVO;
import com.payment.PaymentVO;

@Service
public class AdminSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public AdminVO login_check(AdminVO vo) {
		return sqlSession.selectOne("login_check", vo);
	}
	
	public List<MemberVO> getMemberList(Admin_Paging_VO paging) {
		return sqlSession.selectList("getMemberList", paging);
	}

	public List<BusinessVO> getBusinessList(Admin_Paging_VO paging) {
		return sqlSession.selectList("getBusinessList", paging);
	}

	public List<ContentsVO> getContentsList(Admin_Paging_VO paging) {
		return sqlSession.selectList("getContentsList", paging);
	}

	public String getName(int idx) {
		return sqlSession.selectOne("getName", idx);
	}

	public List<MemberVO> getMemberNewList() {
		return sqlSession.selectList("getMemberNewList");
	}

	public List<BusinessVO> getBesinessNewList() {
		return sqlSession.selectList("getBesinessNewList");
	}

	public List<NoticeVO> getNotice(Admin_Paging_VO paging) {
		return sqlSession.selectList("getNotice", paging);
	}

	public void insert_notice(NoticeVO vo) {
		sqlSession.insert("insert_notice", vo);
	}

	public int getnotice_idx() {
		return sqlSession.selectOne("getnotice_idx");
	}

	public void insert_img(Notice_ImgVO notice_img) {
		sqlSession.insert("insert_img", notice_img);
	}

	public List<PaymentVO> getpayment(Admin_Paging_VO paging) {
		return sqlSession.selectList("getpayment", paging);
	}

	public List<BusinessVO> getBusiness(Admin_Paging_VO paging) {
		return sqlSession.selectList("getBusiness", paging);
	}

	public void business_Approval(String check) {
		sqlSession.insert("business_Approval", check);
	}

	public int business_cnt(String check) {
		return sqlSession.selectOne("business_cnt", check);
	}

	public void business_Refusal(String check) {
		sqlSession.insert("business_Refusal", check);
	}

	public void contents_release(String check) {
		sqlSession.insert("contents_release", check);
	}

	public int content_release_cnt(String check) {
		return sqlSession.selectOne("content_release_cnt", check);
	}

	public void contents_stop(String check) {
		sqlSession.insert("contents_stop", check);
	}

	public int content_stop_cnt(String check) {
		return sqlSession.selectOne("content_stop_cnt", check);
	}

	public void member_release(String check) {
		sqlSession.insert("member_release", check);
	}

	public int member_release_cnt(String check) {
		return sqlSession.selectOne("member_release_cnt", check);
	}

	public void member_stop(String check) {
		sqlSession.insert("member_stop", check);
	}

	public int member_stop_cnt(String check) {
		return sqlSession.selectOne("member_stop_cnt", check);
	}

	public void business_release(String check) {
		sqlSession.insert("business_release", check);
	}

	public int business_release_cnt(String check) {
		return sqlSession.selectOne("business_release_cnt", check);
	}

	public void business_stop(String check) {
		sqlSession.insert("business_stop", check);
	}

	public int business_stop_cnt(String check) {
		return sqlSession.selectOne("business_stop_cnt", check);
	}

	public int countContents(Admin_Paging_VO paging) {
		return sqlSession.selectOne("admin_countContents", paging);
	}

	public int count_member_total(Admin_Paging_VO paging) {
		return sqlSession.selectOne("count_member_total", paging);
	}

	public int count_business_total(Admin_Paging_VO paging) {
		return sqlSession.selectOne("count_business_total", paging);
	}

	public int count_admin_otice(Admin_Paging_VO paging) {
		return sqlSession.selectOne("count_admin_otice", paging);
	}

	public void notice_release(String check) {
		sqlSession.insert("notice_release", check);
	}

	public int notice_release_cnt(String check) {
		return sqlSession.selectOne("notice_release_cnt", check);
	}

	public void notice_stop(String check) {
		sqlSession.insert("notice_stop", check);
	}

	public int notice_stop_cnt(String check) {
		return sqlSession.selectOne("notice_stop_cnt", check);
	}

	public NoticeVO getNotice_update(int idx) {
		return sqlSession.selectOne("getNotice_update", idx);
	}

	public List<NoticeVO> getNoticeNewList() {
		return sqlSession.selectList("getNoticeNewList");
	}

	public int count_advertisement_total(Admin_Paging_VO paging) {
		return sqlSession.selectOne("count_advertisement_total", paging);
	}

	public List<AdvertisementVO> getAdvertisement_list(Admin_Paging_VO paging) {
		return sqlSession.selectList("getAdvertisement_list", paging);
	}

	public void advertisement_release(String c) {
		sqlSession.insert("advertisement_release", c);
	}

	public int advertisement_release_cnt(String c) {
		return sqlSession.selectOne("advertisement_release_cnt", c);
	}

	public void advertisement_stop(String c) {
		sqlSession.insert("advertisement_stop", c);
	}

	public int advertisement_stop_cnt(String c) {
		return sqlSession.selectOne("advertisement_stop_cnt", c);
	}

	public int count_payments_total(Admin_Paging_VO paging) {
		return sqlSession.selectOne("count_payments_total", paging);
	}

	public void insert_advertisement(AdvertisementVO vo) {
		sqlSession.insert("insert_advertisement", vo);
	}

	public int count_business_watie_total(Admin_Paging_VO paging) {
		return sqlSession.selectOne("count_business_watie_total", paging);
	}
}
