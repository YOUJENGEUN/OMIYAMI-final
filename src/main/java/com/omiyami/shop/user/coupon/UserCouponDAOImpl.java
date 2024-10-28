package com.omiyami.shop.user.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.user.mypage.UserCouponVO;

@Repository
public class UserCouponDAOImpl implements UserCouponDAO {

	@Autowired
    private SqlSession sqlSession;
	
	@Override
	public List<UserCouponVO> getUserCoupons(int user_id) {
		return sqlSession.selectList("CouponMapper.getUserCoupons", user_id);
	}

}
