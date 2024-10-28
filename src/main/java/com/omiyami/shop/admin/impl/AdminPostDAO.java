package com.omiyami.shop.admin.impl;

import java.util.List;

import com.omiyami.shop.admin.vo.FAQVO;
import com.omiyami.shop.admin.vo.NoticeVO;
import com.omiyami.shop.admin.vo.ReviewVO;

public interface AdminPostDAO {
	List<NoticeVO> getRecentNotices();

	List<FAQVO> getRecentFaqs();

	List<ReviewVO> getRecentReviews();
}
