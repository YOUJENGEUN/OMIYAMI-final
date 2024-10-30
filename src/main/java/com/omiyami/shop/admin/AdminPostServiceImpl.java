package com.omiyami.shop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omiyami.shop.admin.impl.AdminPostDAO;
import com.omiyami.shop.admin.vo.AdminFAQVO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;
import com.omiyami.shop.admin.vo.AdminReviewVO;

@Service
public class AdminPostServiceImpl implements AdminPostService {

	 @Autowired
	   private AdminPostDAO adminPostDAO;
	   
	   // Notice 관련 메서드
	   @Override
	   public List<AdminNoticeVO> getRecentNotices() {
	       return adminPostDAO.getRecentNotices();
	   }
	   
	   @Override
	   public List<AdminNoticeVO> getNoticeList() {
	       return adminPostDAO.getNoticeList();
	   }
	   
	   @Override
	   public AdminNoticeVO getNoticeById(Long noticeId) {
	       return adminPostDAO.getNoticeById(noticeId);
	   }
	   
	   @Override
	   public void insertNotice(AdminNoticeVO notice) {
	       adminPostDAO.insertNotice(notice);
	   }
	   
	   @Override
	   public void updateNotice(AdminNoticeVO notice) {
	       adminPostDAO.updateNotice(notice);
	   }
	   
	   @Override
	   public void deleteNotice(Long noticeId) {
	       adminPostDAO.deleteNotice(noticeId);
	   }

	   // FAQ 관련 메서드
	   @Override
	   public List<AdminFAQVO> getRecentFaqs() {
	       return adminPostDAO.getRecentFaqs();
	   }
	   
	   @Override
	   public List<AdminFAQVO> getAllFaqs() {
	       return adminPostDAO.getAllFaqs();
	   }
	   
	   @Override
	   public AdminFAQVO getFaqById(Long faqId) {
	       return adminPostDAO.getFaqById(faqId);
	   }
	   
	   @Override
	   public void createFaq(AdminFAQVO faq) {
	       adminPostDAO.createFaq(faq);
	   }
	   
	   @Override
	   public void updateFaq(AdminFAQVO faq) {
	       adminPostDAO.updateFaq(faq);
	   }
	   
	   @Override
	   @Transactional
	   public void deleteFaq(List<Long> faqIds) {
	       adminPostDAO.deleteFaq(faqIds);
	   }

	   // Review 관련 메서드
	   @Override
	   public List<AdminReviewVO> getRecentReviews() {
	       return adminPostDAO.getRecentReviews();
	   }
	}