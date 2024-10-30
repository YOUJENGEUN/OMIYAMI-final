package com.omiyami.shop.admin.impl;

import java.util.List;


import com.omiyami.shop.admin.vo.AdminNoticeVO;

public interface AdminNoticeDAO {
    void insertNotice(AdminNoticeVO notice);
    void updateNotice(AdminNoticeVO notice);
    void deleteNotice(Long noticeId);
    AdminNoticeVO getNoticeById(Long noticeId);
    List<AdminNoticeVO> getNoticeList();
}
