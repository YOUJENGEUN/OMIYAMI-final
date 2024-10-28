package com.omiyami.shop.cs.notice;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NoticeDAO {

	List<NoticeVO> getNoticeList(); // 전체 출력
    List<NoticeVO> getPagedNoticeList(@Param("offset") int offset, @Param("limit") int limit); // paging1
    int getTotalNoticeCount(); // paging2 
    List<NoticeVO> searchNotice(@Param("keyword") String keyword, @Param("offset") int offset, @Param("pageSize") int pageSize);
    int getTotalCountByKeyword(@Param("keyword") String keyword); 
	
}
