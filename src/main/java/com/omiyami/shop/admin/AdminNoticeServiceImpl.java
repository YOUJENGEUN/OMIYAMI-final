package com.omiyami.shop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.admin.impl.AdminNoticeDAO;
import com.omiyami.shop.admin.vo.AdminNoticeVO;

@Service
public class AdminNoticeServiceImpl implements AdminNoticeService {
	 
    @Autowired
    private AdminNoticeDAO noticeDAO;
    
    @Override
    public void insertNotice(AdminNoticeVO notice) {
        noticeDAO.insertNotice(notice);
    }
    
    @Override
    public void updateNotice(AdminNoticeVO notice) {
        noticeDAO.updateNotice(notice);
    }
    
    @Override
    public void deleteNotice(Long noticeId) {
        noticeDAO.deleteNotice(noticeId);
    }
    
    @Override
    public AdminNoticeVO getNoticeById(Long noticeId) {
        return noticeDAO.getNoticeById(noticeId);
    }
    
    @Override
    public List<AdminNoticeVO> getNoticeList() {
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
