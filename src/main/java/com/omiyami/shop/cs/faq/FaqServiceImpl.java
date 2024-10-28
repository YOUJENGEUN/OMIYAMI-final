package com.omiyami.shop.cs.faq;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO faqDao;

	// 전체 출력
	@Override
	public List<FaqVO> getFaqList() {
		return faqDao.getFaqList();
	}

	
	@Override
	public List<FaqVO> getPagedFaqList(int pageNumber, int pageSize) {
		int offset = (pageNumber - 1) * pageSize;
		return faqDao.getPagedFaqList(offset, pageSize);
	}

	@Override
	public int getTotalFaqCount() {
		return faqDao.getTotalFaqCount();
	}

	// 검색 기능
	@Override
	public List<FaqVO> searchFaqs(String keyword, int pageNumber, int pageSize) {
		int offset = (pageNumber - 1) * pageSize;
		return faqDao.searchFaqs(keyword, offset, pageSize); // DAO 호출
	}

	@Override
	public int getTotalCountByKeyword(String keyword) {
		return faqDao.getTotalCountByKeyword(keyword); // DAO 호출
	}
}
