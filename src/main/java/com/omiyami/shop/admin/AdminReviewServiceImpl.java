package com.omiyami.shop.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omiyami.shop.admin.impl.AdminReviewDAO;
import com.omiyami.shop.admin.vo.AdminReviewVO;

@Service
public class AdminReviewServiceImpl implements AdminReviewService {
    
    @Autowired
    private AdminReviewDAO adminReviewDAO;
    
    @Override
    public List<AdminReviewVO> getReviewList(int page, int size) {
        Map<String, Object> params = new HashMap<>();
        params.put("offset", (page - 1) * size);
        params.put("limit", size);
        return adminReviewDAO.getReviewList(params);
    }
    
    @Override
    public int getTotalPages(int size) {
        int total = adminReviewDAO.getTotalReviewCount();
        return (int) Math.ceil((double) total / size);
    }
    
    @Override
    @Transactional
    public void deleteReviews(List<Long> reviewIds) {
        adminReviewDAO.deleteReviews(reviewIds);
    }
    
    @Override
    public AdminReviewVO getReview(Long reviewId) {
        return adminReviewDAO.getReviewById(reviewId);
    }
}