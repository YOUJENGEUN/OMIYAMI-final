package com.omiyami.shop.cs.notice;

import java.util.List;

public interface NoticeService {

	List<NoticeVO> getNoticeList(); // 전체 출력
	List<NoticeVO> getPagedNoticeList(int pageNumber, int pageSize); // paging1
	int getTotalNoticeCount(); // paging2
	List<NoticeVO> searchNotice(String keyword, int pageNumber, int pageSize); // 검색 기능
	int getTotalCountByKeyword(String keyword); 
	
}
