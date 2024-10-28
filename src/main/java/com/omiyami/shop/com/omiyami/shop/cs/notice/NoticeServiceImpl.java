package com.omiyami.shop.cs.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> getNoticeList() {
		return noticeDAO.getNoticeList();
	}

	@Override
	public List<NoticeVO> getPagedNoticeList(int pageNumber, int pageSize) {
		int offset = (pageNumber - 1) * pageSize;
		return noticeDAO.getPagedNoticeList(offset, pageSize);
	}

	@Override
	public int getTotalNoticeCount() {
		return noticeDAO.getTotalNoticeCount();
	}

	@Override
	public List<NoticeVO> searchNotice(String keyword, int pageNumber, int pageSize) {
		int offset = (pageNumber - 1) * pageSize;
		return noticeDAO.searchNotice(keyword, offset, pageSize); 
	}

	@Override
	public int getTotalCountByKeyword(String keyword) {
		return noticeDAO.getTotalCountByKeyword(keyword); 
	}
}
