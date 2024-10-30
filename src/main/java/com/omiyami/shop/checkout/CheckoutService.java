package com.omiyami.shop.checkout;

import java.util.List;

import com.omiyami.shop.order.OrderDetailVO;
import com.omiyami.shop.user.UserVO;
import com.omiyami.shop.user.mypage.UserCouponVO;

public interface CheckoutService {

	List<UserCouponVO> getUserCoupons(int user_id);
	
	int getCurrentBalance(int userId);
    void addPoints(int userId, int points);
    void usePoints(int userId, int pointsUsed);
    void addPendingPoints(int userId, int points);
    
    void saveOrder(OrderDetailVO orderDetail, List<OrderDetailVO> orderDetails);
    void processCheckout(List<Integer> productIds, List<Integer> quantities, List<Integer> totalPrices,
            int totalOrderAmount, int shippingFee, int pointDiscount, Integer userCouponId, int couponDiscount, UserVO user,
            String receiverName, String receiverPhone, String postNum, String address);
    
}
