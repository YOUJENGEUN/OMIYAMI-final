package com.omiyami.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.omiyami.shop.admin.AdminPostService;

@Controller
public class AdminPostController {
	 @Autowired
	    private AdminPostService adminPostService;
	    
	    @GetMapping("/post-main")
	    public String postMain(Model model) {
	        // 최근 공지사항 3개
	        model.addAttribute("notices", adminPostService.getRecentNotices());
	        // 최근 FAQ 3개
	        model.addAttribute("faqs", adminPostService.getRecentFaqs());
	        // 최근 리뷰 3개
	        model.addAttribute("reviews", adminPostService.getRecentReviews());
	        
	        return "admin/post-main";
	    }
}
