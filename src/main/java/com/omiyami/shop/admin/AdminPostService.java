package com.omiyami.shop.admin;

import java.util.List;

import com.omiyami.shop.admin.vo.FAQVO;
import com.omiyami.shop.admin.vo.NoticeVO;
import com.omiyami.shop.admin.vo.ReviewVO;

public interface AdminPostService {
	List<NoticeVO> getRecentNotices();

	List<FAQVO> getRecentFaqs();

	List<ReviewVO> getRecentReviews();
}
