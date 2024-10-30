package com.omiyami.shop.admin.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.admin.vo.AdminReviewVO;


@Repository
public class AdminReviewDAOImpl implements AdminReviewDAO {

	@Autowired
    private SqlSessionTemplate sqlSession;
    
    @Override
    public List<AdminReviewVO> getReviewList(Map<String, Object> params) {
        return sqlSession.selectList("AdminReviewMapper.getReviewList", params);
    }
    
    @Override
    public int getTotalReviewCount() {
        return sqlSession.selectOne("AdminReviewMapper.getTotalReviewCount");
    }
    
    @Override
    public void deleteReviews(List<Long> reviewIds) {
        sqlSession.delete("AdminReviewMapper.deleteReviews", reviewIds);
    }
    
    @Override
    public AdminReviewVO getReviewById(Long reviewId) {
        return sqlSession.selectOne("AdminReviewMapper.getReviewById", reviewId);
    }
}
