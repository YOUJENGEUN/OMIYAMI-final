package com.omiyami.shop.admin.impl;

import java.util.List;

import com.omiyami.shop.admin.vo.AdminFAQVO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;
import com.omiyami.shop.admin.vo.AdminReviewVO;

public interface AdminPostDAO {
	List<AdminNoticeVO> getRecentNotices();

	List<AdminFAQVO> getRecentFaqs();

	List<AdminReviewVO> getRecentReviews();
}
