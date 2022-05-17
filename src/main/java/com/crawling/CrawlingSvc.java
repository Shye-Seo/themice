package com.crawling;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CrawlingSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public void setCrawling(List<Bexco_InsertVO> list) {
		for (Bexco_InsertVO vo : list) {
			sqlSession.insert("setCrawling", vo);
		}
	}

	public void setEndContents() {
		sqlSession.insert("setEndContents");
	}

	public void deleteContents() {
		sqlSession.insert("deleteContents");
	}

	public BexcoVO getidx() {
		return sqlSession.selectOne("getidx");
	}

	public void overlap_delete() {
		sqlSession.insert("overlap_delete");
	}

	public void move_data() {
		sqlSession.insert("move_data");
	}
}
