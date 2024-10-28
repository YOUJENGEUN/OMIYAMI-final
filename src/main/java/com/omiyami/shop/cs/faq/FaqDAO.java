package com.omiyami.shop.cs.faq;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FaqDAO {

	public List<FaqVO> getFaqList();
	
	List<FaqVO> getPagedFaqList(@Param("offset") int offset, @Param("limit") int limit); // paging1
    int getTotalFaqCount(); // paging2 

    List<FaqVO> searchFaqs(@Param("keyword") String keyword, @Param("offset") int offset, @Param("pageSize") int pageSize);

    int getTotalCountByKeyword(@Param("keyword") String keyword); 
	
}
