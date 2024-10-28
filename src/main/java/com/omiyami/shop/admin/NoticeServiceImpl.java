package com.omiyami.shop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.admin.impl.NoticeDAO;
import com.omiyami.shop.admin.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	 
    @Autowired
    private NoticeDAO noticeDAO;
    
    @Override
    public void insertNotice(NoticeVO notice) {
        noticeDAO.insertNotice(notice);
    }
    
    @Override
    public void updateNotice(NoticeVO notice) {
        noticeDAO.updateNotice(notice);
    }
    
    @Override
    public void deleteNotice(Long noticeId) {
        noticeDAO.deleteNotice(noticeId);
    }
    
    @Override
    public NoticeVO getNoticeById(Long noticeId) {
        return noticeDAO.getNoticeById(noticeId);
    }
    
    @Override
    public List<NoticeVO> getNoticeList() {
        return noticeDAO.getNoticeList();
    }

    @Override
    public boolean deleteNotices(List<Long> noticeIds) {
        try {
            for (Long noticeId : noticeIds) {
                noticeDAO.deleteNotice(noticeId);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
