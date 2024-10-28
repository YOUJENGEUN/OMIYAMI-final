package com.omiyami.shop.admin.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.admin.vo.FAQVO;
import com.omiyami.shop.admin.vo.NoticeVO;
import com.omiyami.shop.admin.vo.ReviewVO;

@Repository
public class AdminPostDAOImpl implements AdminPostDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<NoticeVO> getRecentNotices() {
		return sqlSession.selectList("AdminPost.getRecentNotices");
	}

	@Override
	public List<FAQVO> getRecentFaqs() {
		return sqlSession.selectList("AdminPost.getRecentFaqs");
	}

	@Override
	public List<ReviewVO> getRecentReviews() {
		return sqlSession.selectList("AdminPost.getRecentReviews");
	}
}
