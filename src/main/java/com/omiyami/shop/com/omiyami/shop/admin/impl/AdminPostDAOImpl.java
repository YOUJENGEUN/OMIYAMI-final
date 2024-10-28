package com.omiyami.shop.admin.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.admin.vo.AdminFAQVO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;
import com.omiyami.shop.admin.vo.AdminReviewVO;

@Repository
public class AdminPostDAOImpl implements AdminPostDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<AdminNoticeVO> getRecentNotices() {
		return sqlSession.selectList("AdminPost.getRecentNotices");
	}

	@Override
	public List<AdminFAQVO> getRecentFaqs() {
		return sqlSession.selectList("AdminPost.getRecentFaqs");
	}

	@Override
	public List<AdminReviewVO> getRecentReviews() {
		return sqlSession.selectList("AdminPost.getRecentReviews");
	}
}
