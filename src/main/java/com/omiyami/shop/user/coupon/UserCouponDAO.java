package com.omiyami.shop.user.coupon;

import java.util.List;

import com.omiyami.shop.user.mypage.UserCouponVO;

public interface UserCouponDAO {
	List<UserCouponVO> getUserCoupons(int user_id);
	
}
