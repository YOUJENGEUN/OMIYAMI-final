package com.omiyami.shop.checkout;

import java.util.List;
import java.util.Map;

import com.omiyami.shop.order.OrderDetailVO;
import com.omiyami.shop.order.PaymentDetailVO;
import com.omiyami.shop.user.mypage.UserCouponVO;

public interface CheckoutDAO {

	//쿠폰
	List<UserCouponVO> getUserCoupons(int user_id);
	
	//포인트
	int getCurrentBalance(int userId);
    void addPoints(Map<String, Object> params);//적립
    void addPendingPoints(Map<String, Object> params);//적립예정
    void usePoints(Map<String, Object> params);//사용
    
    //주문버튼
    int insertOrder(OrderDetailVO orderDetail);
    void insertOrderDetails(List<OrderDetailVO> orderDetails);
    void updateProductStock(Map<String, Object> params);
    void insertPaymentDetails(PaymentDetailVO paymentDetail);
    void updateUserCouponStatus(Integer userCouponId);
    void deleteCartItem(int productId, int userId);
}
