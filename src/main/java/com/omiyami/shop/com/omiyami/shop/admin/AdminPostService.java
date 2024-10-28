package com.omiyami.shop.admin;

import java.util.List;

import com.omiyami.shop.admin.vo.AdminFAQVO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;
import com.omiyami.shop.admin.vo.AdminReviewVO;

public interface AdminPostService {
	List<AdminNoticeVO> getRecentNotices();

	List<AdminFAQVO> getRecentFaqs();

	List<AdminReviewVO> getRecentReviews();
}
