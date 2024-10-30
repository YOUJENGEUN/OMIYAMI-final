package com.omiyami.shop.admin.impl;


import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.admin.vo.AdminFAQVO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;
import com.omiyami.shop.admin.vo.AdminReviewVO;


@Repository
public class AdminPostDAOImpl implements AdminPostDAO {
    
    @Autowired
    private SqlSessionTemplate sqlSession;
    
    // Notice 관련 메서드
    @Override
    public List<AdminNoticeVO> getNoticeList() {
        return sqlSession.selectList("AdminPostMapper.getNoticeList");
    }
    
    @Override
    public List<AdminNoticeVO> getRecentNotices() {
        return sqlSession.selectList("AdminPostMapper.getRecentNotices");
    }
    
    @Override
    public AdminNoticeVO getNoticeById(Long noticeId) {
        return sqlSession.selectOne("AdminPostMapper.getNoticeById", noticeId);
    }
    
    @Override
    public void insertNotice(AdminNoticeVO notice) {
        sqlSession.insert("AdminPostMapper.insertNotice", notice);
    }
    
    @Override
    public void updateNotice(AdminNoticeVO notice) {
        sqlSession.update("AdminPostMapper.updateNotice", notice);
    }
    
    @Override
    public void deleteNotice(Long noticeId) {
        sqlSession.delete("AdminPostMapper.deleteNotice", noticeId);
    }

    // FAQ 관련 메서드
    @Override
    public List<AdminFAQVO> getAllFaqs() {
        return sqlSession.selectList("AdminPostMapper.getAllFaqs");
    }
    
    @Override
    public List<AdminFAQVO> getRecentFaqs() {
        return sqlSession.selectList("AdminPostMapper.getRecentFaqs");
    }
    
    @Override
    public AdminFAQVO getFaqById(Long faqId) {
        return sqlSession.selectOne("AdminPostMapper.getFaqById", faqId);
    }
    
    @Override
    public void createFaq(AdminFAQVO faq) {
        sqlSession.insert("AdminPostMapper.createFaq", faq);
    }
    
    @Override
    public void updateFaq(AdminFAQVO faq) {
        sqlSession.update("AdminPostMapper.updateFaq", faq);
    }
    
    @Override
    public void deleteFaq(List<Long> faqIds) {
        for(Long faqId : faqIds) {
            sqlSession.delete("AdminPostMapper.deleteFaq", faqId);
        }
    }

    // Review 관련 메서드
    @Override
    public List<AdminReviewVO> getRecentReviews() {
        return sqlSession.selectList("AdminPostMapper.getRecentReviews");
    }
}