package com.omiyami.shop.admin.impl;

import java.util.List;

import com.omiyami.shop.admin.vo.AdminFAQVO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;
import com.omiyami.shop.admin.vo.AdminReviewVO;

public interface AdminPostDAO {
	  // 메인 페이지 최근 글 조회
    List<AdminNoticeVO> getRecentNotices();
    List<AdminFAQVO> getRecentFaqs();
    List<AdminReviewVO> getRecentReviews();
    
    // FAQ 관련 메서드
    List<AdminFAQVO> getAllFaqs();
    AdminFAQVO getFaqById(Long faqId);
    void createFaq(AdminFAQVO faq);
    void updateFaq(AdminFAQVO faq);
    void deleteFaq(List<Long> faqIds);
   
    
    // Notice 관련 메서드
    void insertNotice(AdminNoticeVO notice);
    void updateNotice(AdminNoticeVO notice);
    void deleteNotice(Long noticeId);
    AdminNoticeVO getNoticeById(Long noticeId);
    List<AdminNoticeVO> getNoticeList();
}
