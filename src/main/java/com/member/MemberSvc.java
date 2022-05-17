package com.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.PagingVO_2;
import com.common.loginVO;
import com.payment.PaymentVO;

@Service
public class MemberSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int idCheck(String id) {
		return sqlSession.selectOne("idCheck", id);
	}

	public void join(MemberVO param) {
		sqlSession.insert("join", param);
	}

	public MemberVO loginCheck(loginVO param) {
		return sqlSession.selectOne("loginCheck", param);
	}

	public MemberVO duplicate_member_tel(String tel) {
		return sqlSession.selectOne("duplicate_member_tel", tel);
	}

	public MemberVO duplicate_member_email(String email) {
		return sqlSession.selectOne("duplicate_member_email", email);
	}
	
	public MemberVO member_password_check(MemberVO vo) {
		return sqlSession.selectOne("member_password_check", vo);
	}
	
	public MemberVO getMember_info(String id) {
		return sqlSession.selectOne("getMember_info", id);
	}
	
	public void set_member_update(String sql) {
		sqlSession.insert("set_member_update", sql);
	}
	
	public void set_m_member_update(MemberVO vo) {
		sqlSession.insert("set_m_member_update", vo);
	}
	
	public void member_secession(String id) {
		sqlSession.insert("member_secession", id);
	}
	
	public void member_password_update(MemberVO mo) {
		sqlSession.insert("member_password_update", mo);
	}
	
	public int member_payment_count(String consumer) {
		return sqlSession.selectOne("member_payment_count", consumer);
	}
	
	public List<PaymentVO> getMember_payment(PagingVO_2 vo) {
		return sqlSession.selectList("getMember_payment", vo);
	}
	
	public List<PaymentVO> getm_Member_payment(PagingVO_2 vo) {
		return sqlSession.selectList("getm_Member_payment", vo);
	}
	
	public MemberVO member_email_id_find(MemberVO vo) {
		return sqlSession.selectOne("member_email_id_find", vo);
	}

	public MemberVO member_tel_id_find(MemberVO vo) {
		return sqlSession.selectOne("member_tel_id_find", vo);
	}

	public MemberVO member_email_pw_find(MemberVO vo) {
		return sqlSession.selectOne("member_email_pw_find", vo);
	}
	
	public MemberVO member_tel_pw_find(MemberVO vo) {
		return sqlSession.selectOne("member_tel_pw_find", vo);
	}
	
	public MemberVO mobile_id_result(MemberVO vo) {
		return sqlSession.selectOne("mobile_id_result", vo);
	}
}
