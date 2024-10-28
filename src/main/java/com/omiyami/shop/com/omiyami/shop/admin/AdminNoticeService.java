package com.omiyami.shop.admin;

import java.util.List;

import com.omiyami.shop.admin.vo.AdminNoticeVO;

public interface AdminNoticeService {
	void insertNotice(AdminNoticeVO notice);
    void updateNotice(AdminNoticeVO notice);
    void deleteNotice(Long noticeId);
    AdminNoticeVO getNoticeById(Long noticeId);
    List<AdminNoticeVO> getNoticeList();
    boolean deleteNotices(List<Long> noticeIds);
}
