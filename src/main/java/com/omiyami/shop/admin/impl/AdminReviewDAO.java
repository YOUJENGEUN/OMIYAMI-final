package com.omiyami.shop.admin.impl;

import java.util.List;
import java.util.Map;

import com.omiyami.shop.admin.vo.AdminReviewVO;

public interface AdminReviewDAO {
	 List<AdminReviewVO> getReviewList(Map<String, Object> params);
	    int getTotalReviewCount();
	    void deleteReviews(List<Long> reviewIds);
	    AdminReviewVO getReviewById(Long reviewId);
}	
