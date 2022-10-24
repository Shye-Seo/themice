package com.payment;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.contents.ContentsVO;
import com.member.MemberVO;

@Service
public class PaymentSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertPayment(PaymentVO payment) {
		sqlSession.insert("insertPayment", payment);
	}

	public String getTitle(String contents_idx) {
		return sqlSession.selectOne("getTitle", contents_idx);
	}

	public MemberVO getMember(String id) {
		return sqlSession.selectOne("getMember", id);
	}

	public ContentsVO getContents(String contents_idx) {
		return sqlSession.selectOne("getContents", contents_idx);
	}

	public String getBusiness_num(String contents_idx) {
		return sqlSession.selectOne("getBusiness_num", contents_idx);
	}

	public void insert_payment(PaymentVO vo) {
		sqlSession.insert("insert_payment", vo);
	}
	
	public void update_payment_status(PaymentVO vo) {
		sqlSession.insert("update_payment_status", vo);
	}
}
