package com.omiyami.shop.cs.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<NoticeVO> getNoticeList() {
		return sqlSession.selectList("CSMapper.getNoticeList");
	}

	@Override
	public List<NoticeVO> getPagedNoticeList(int offset, int limit) {
		Map<String, Integer> params = new HashMap<>();
		params.put("offset", offset);
		params.put("limit", limit);
		return sqlSession.selectList("CSMapper.getPagedNoticeList", params);
	}

	@Override
	public int getTotalNoticeCount() {
		return sqlSession.selectOne("CSMapper.getTotalNoticeCount");
	}

	@Override
	public List<NoticeVO> searchNotice(String keyword, int offset, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("offset", offset);
		params.put("pageSize", pageSize);
		return sqlSession.selectList("CSMapper.searchNotice", params);
	}

	@Override
	public int getTotalCountByKeyword(String keyword) {
		return sqlSession.selectOne("CSMapper.getTotalNoticeCountByKeyword", "%" + keyword + "%");
	}
}
