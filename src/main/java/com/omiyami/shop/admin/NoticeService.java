package com.omiyami.shop.admin;

import java.util.List;

import com.omiyami.shop.admin.vo.NoticeVO;

public interface NoticeService {
	void insertNotice(NoticeVO notice);
    void updateNotice(NoticeVO notice);
    void deleteNotice(Long noticeId);
    NoticeVO getNoticeById(Long noticeId);
    List<NoticeVO> getNoticeList();
    boolean deleteNotices(List<Long> noticeIds);
}
