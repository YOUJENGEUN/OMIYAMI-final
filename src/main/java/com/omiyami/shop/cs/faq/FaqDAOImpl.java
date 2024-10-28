package com.omiyami.shop.cs.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOImpl implements FaqDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<FaqVO> getFaqList() {
		return sqlSession.selectList("CSMapper.getFaqList");
	}

	
	@Override
	public List<FaqVO> getPagedFaqList(int offset, int limit) {
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("limit", limit);
		return sqlSession.selectList("CSMapper.getPagedFaqList", params);
	}

	@Override
	public int getTotalFaqCount() {
		return sqlSession.selectOne("CSMapper.getTotalFaqCount");
	}

	// 검색된 FAQ 리스트 출력
	@Override
	public List<FaqVO> searchFaqs(String keyword, int offset, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", "%" + keyword + "%"); // LIKE 쿼리를 위한 패턴 설정
		params.put("offset", offset);
		params.put("pageSize", pageSize);
		return sqlSession.selectList("CSMapper.searchFaqs", params);
	}

	
	@Override
	public int getTotalCountByKeyword(String keyword) {
		return sqlSession.selectOne("CSMapper.getTotalFaqCountByKeyword", "%" + keyword + "%");
	}

}
