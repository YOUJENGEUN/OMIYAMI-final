package com.omiyami.shop.admin;

import java.util.List;

import com.omiyami.shop.admin.vo.AdminReviewVO;

public interface AdminReviewService {
	 List<AdminReviewVO> getReviewList(int page, int size);
	    int getTotalPages(int size);
	    void deleteReviews(List<Long> reviewIds);
	    AdminReviewVO getReview(Long reviewId);
}
