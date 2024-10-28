package com.omiyami.shop.admin.impl;

import java.util.List;

import com.omiyami.shop.admin.vo.NoticeVO;

public interface NoticeDAO {
    void insertNotice(NoticeVO notice);
    void updateNotice(NoticeVO notice);
    void deleteNotice(Long noticeId);
    NoticeVO getNoticeById(Long noticeId);
    List<NoticeVO> getNoticeList();
}
