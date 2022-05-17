package com.business;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.PagingVO;
import com.common.PagingVO_2;
import com.common.loginVO;
import com.contents.ContentsVO;
import com.payment.PaymentVO;

@Service
public class BusinessSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void businessJoin(BusinessVO vo) {
		sqlSession.insert("businessJoin", vo);
	}

	public BusinessVO BusinessCheck(loginVO vo) {
		return sqlSession.selectOne("BusinessCheck", vo);
	}

	public BusinessVO business_num_check(String business_num) {
		return sqlSession.selectOne("business_num_check", business_num);
	}

	public BusinessVO duplicate_business_email(String email) {
		return sqlSession.selectOne("duplicate_business_email", email);
	}

	public BusinessVO business_password_check(BusinessVO mo) {
		return sqlSession.selectOne("business_password_check", mo);
	}
	
	public BusinessVO getBusiness_info(String business_num) {
		return sqlSession.selectOne("getBusiness_info", business_num);
	}
	
	public void getBusiness_info_update(String sql) {
		sqlSession.insert("getBusiness_info_update", sql);
	}
	
	public void business_secession(String business_num) {
		sqlSession.insert("business_secession", business_num);
	}

	public void setBusiness_password_update(BusinessVO vo) {
		sqlSession.insert("setBusiness_password_update", vo);
	}
	
	public int business_payment_count(String business_num) {
		return sqlSession.selectOne("business_payment_count", business_num);
	}

	public int business_payment_count(PagingVO_2 vo) {
		return sqlSession.selectOne("business_payment_count_search", vo);
	}

	public int count_business_contents(PagingVO vo) {
		return sqlSession.selectOne("count_business_contents", vo);
	}
	
	public List<PaymentVO> getBusiness_payment(PagingVO_2 vo) {
		return sqlSession.selectList("getBusiness_payment", vo);
	}
	
	public List<ContentsVO> getBusiness_contents_list(PagingVO vo) {
		return sqlSession.selectList("getBusiness_contents_list", vo);
	}
	
	public ContentsVO getcontent(String contents_idx) {
		return sqlSession.selectOne("getcontent", contents_idx);
	}
	
	public BusinessVO business_email_pw_find(BusinessVO vo) {
		return sqlSession.selectOne("business_email_pw_find", vo);
	}
	
	public BusinessVO business_tel_pw_find(BusinessVO vo) {
		return sqlSession.selectOne("business_tel_pw_find", vo);
	}

	public void business_password_update(BusinessVO mo) {
		sqlSession.insert("business_password_update", mo);
	}
}
