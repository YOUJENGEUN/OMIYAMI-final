package com.omiyami.shop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.admin.impl.AdminPostDAO;
import com.omiyami.shop.admin.vo.AdminFAQVO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;
import com.omiyami.shop.admin.vo.AdminReviewVO;

@Service
public class AdminPostServiceImpl implements AdminPostService {

	@Autowired
    private AdminPostDAO adminPostDAO;
    
    @Override
    public List<AdminNoticeVO> getRecentNotices() {
        return adminPostDAO.getRecentNotices();
    }
    
    @Override
    public List<AdminFAQVO> getRecentFaqs() {
        return adminPostDAO.getRecentFaqs();
    }
    
    @Override
    public List<AdminReviewVO> getRecentReviews() {
        return adminPostDAO.getRecentReviews();
    }

}
