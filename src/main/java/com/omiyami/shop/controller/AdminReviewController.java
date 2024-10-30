package com.omiyami.shop.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.omiyami.shop.admin.AdminReviewService;
import com.omiyami.shop.admin.vo.AdminReviewVO;

@Controller
public class AdminReviewController {
    
    private static final Logger logger = LoggerFactory.getLogger(AdminReviewController.class);
    
    @Autowired
    private AdminReviewService adminReviewService;
    
    @GetMapping("/post-review")
    public String postReview(Model model) {
        logger.info("Getting review list...");
        
        try {
            List<AdminReviewVO> reviews = adminReviewService.getReviewList(1, 10); // 기본값으로 설정
            
            if (reviews == null || reviews.isEmpty()) {
                logger.info("No reviews found");
                model.addAttribute("message", "리뷰 데이터가 없습니다.");
            } else {
                logger.info("Found {} reviews", reviews.size());
                model.addAttribute("reviews", reviews);
            }
            
        } catch (Exception e) {
            logger.error("Error getting reviews", e);
            model.addAttribute("error", "리뷰 목록을 불러오는 중 오류가 발생했습니다.");
        }
        
        return "admin/post-review";
    }
}
