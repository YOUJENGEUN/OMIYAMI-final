package com.omiyami.shop.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.admin.vo.AdminMemberStatsVO;
import com.omiyami.shop.admin.vo.AdminMemberVO;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

	@Override
	public AdminMemberStatsVO selectMemberStats() {
		return sqlSession.selectOne("AdminMember.selectMemberStats");
	}

	@Override
	public List<AdminMemberVO> selectLatestMembers(int limit) {
		
		return sqlSession.selectList("AdminMember.selectLatestMembers", limit);
	}

	@Override
	public List<AdminMemberVO> selectMemberList(int offset, int size) {
		return sqlSession.selectList("AdminMember.selectMemberList", new int[] { offset, size });
	}

	@Override
	public int selectTotalMemberCount() {
		return sqlSession.selectOne("AdminMember.selectTotalMemberCount");
	}
}