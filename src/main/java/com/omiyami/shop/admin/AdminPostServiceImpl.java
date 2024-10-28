package com.omiyami.shop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.admin.impl.AdminPostDAO;
import com.omiyami.shop.admin.vo.FAQVO;
import com.omiyami.shop.admin.vo.NoticeVO;
import com.omiyami.shop.admin.vo.ReviewVO;

@Service
public class AdminPostServiceImpl implements AdminPostService {

	@Autowired
    private AdminPostDAO adminPostDAO;
    
    @Override
    public List<NoticeVO> getRecentNotices() {
        return adminPostDAO.getRecentNotices();
    }
    
    @Override
    public List<FAQVO> getRecentFaqs() {
        return adminPostDAO.getRecentFaqs();
    }
    
    @Override
    public List<ReviewVO> getRecentReviews() {
        return adminPostDAO.getRecentReviews();
    }

}
