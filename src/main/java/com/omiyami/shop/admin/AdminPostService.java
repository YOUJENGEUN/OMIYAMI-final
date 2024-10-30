package com.omiyami.shop.admin;

import java.util.List;

import com.omiyami.shop.admin.vo.AdminFAQVO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;
import com.omiyami.shop.admin.vo.AdminReviewVO;

public interface AdminPostService {
	List<AdminNoticeVO> getNoticeList(); // 공지사항 전체 목록

	List<AdminNoticeVO> getRecentNotices(); // 최근 공지사항 목록

	AdminNoticeVO getNoticeById(Long noticeId); // 공지사항 상세 조회

	void insertNotice(AdminNoticeVO notice); // 공지사항 등록

	void updateNotice(AdminNoticeVO notice); // 공지사항 수정

	void deleteNotice(Long noticeId); // 공지사항 삭제

	// FAQ 관련 메서드
	List<AdminFAQVO> getAllFaqs(); // FAQ 전체 목록

	List<AdminFAQVO> getRecentFaqs(); // 최근 FAQ 목록

	AdminFAQVO getFaqById(Long faqId); // FAQ 상세 조회

	void createFaq(AdminFAQVO faq); // FAQ 생성

	void updateFaq(AdminFAQVO faq); // FAQ 수정

	void deleteFaq(List<Long> faqIds); // FAQ 삭제 (다중)

	// Review 관련 메서드
	List<AdminReviewVO> getRecentReviews(); // 최근 리뷰 목록
}
