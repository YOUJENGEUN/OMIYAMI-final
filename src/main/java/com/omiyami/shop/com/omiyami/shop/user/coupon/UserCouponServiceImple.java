package com.omiyami.shop.user.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.user.mypage.UserCouponVO;

@Service
public class UserCouponServiceImple implements UserCouponService {

	@Autowired
    private UserCouponDAO userCouponDAO;
	
	@Override
	public List<UserCouponVO> getUserCoupons(int user_id) {
		return userCouponDAO.getUserCoupons(user_id);
	}

}
