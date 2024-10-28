package com.omiyami.shop.cs.inquery;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InqueryDAOImpl implements InqueryDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
    public void insertInquery(InqueryVO inquery) {
		sqlSession.insert("CSMapper.insertInquery", inquery);
    }

    @Override
    public List<InqueryVO> getInqueriesByUserId(int user_id) {
        return sqlSession.selectList("CSMapper.getInqueriesByUserId", user_id);
    }

}
