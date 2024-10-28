package com.omiyami.shop.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.admin.vo.NoticeVO;
@Repository
public class NoticeDAOImpl implements NoticeDAO {

	 @Autowired
	    private SqlSessionTemplate sqlSession;
	    
	    @Override
	    public void insertNotice(NoticeVO notice) {
	        sqlSession.insert("NoticeMapper.insertNotice", notice);
	    }
	    
	    @Override
	    public void updateNotice(NoticeVO notice) {
	        sqlSession.update("NoticeMapper.updateNotice", notice);
	    }
	    @Override
	    public void deleteNotice(Long noticeId) {
	        sqlSession.delete("NoticeMapper.deleteNotice", noticeId);
	    }
	    
	    @Override
	    public NoticeVO getNoticeById(Long noticeId) {
	        return sqlSession.selectOne("NoticeMapper.getNoticeById", noticeId);
	    }
	    
	    @Override
	    public List<NoticeVO> getNoticeList() {
	        return sqlSession.selectList("NoticeMapper.getNoticeList");
	    }
}