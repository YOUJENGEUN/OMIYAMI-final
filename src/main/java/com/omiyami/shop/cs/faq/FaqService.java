package com.omiyami.shop.cs.faq;

import java.util.List;

public interface FaqService {
	
	List <FaqVO> getFaqList ();	// 전체 출력
	
	List<FaqVO> getPagedFaqList(int pageNumber, int pageSize); //paging1
    int getTotalFaqCount();	//paging2
    
    List<FaqVO> searchFaqs(String keyword, int pageNumber, int pageSize); 
	int getTotalCountByKeyword(String keyword); 
}
