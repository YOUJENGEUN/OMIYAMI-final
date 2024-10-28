package com.omiyami.shop.user.mypage;

import java.util.List;
import java.util.Map;

import com.omiyami.shop.order.OrderDetailVO;
import com.omiyami.shop.order.OrderVO;
import com.omiyami.shop.order.PaymentDetailVO;
import com.omiyami.shop.product.ProductVO;
import com.omiyami.shop.user.UserVO;

public interface MypageDAO {

	//메인
	int getUserOrderCount(int userId); // 주문 회수 조회
    int getUserCancelCount(int userId); // 취소 회수 조회
    int getTotalPointsByStatus(Map<String, Object> params);//상태 별 포인트 조회
	int getUserCouponCount(int userId); // 쿠폰 개수 조회
	String getLatestOrderStatus(int userId); // 최근 주문 현황
	List<OrderDetailVO> getRecentOrders(int userId); // 최근 주문 5개
	
	//쇼핑정보
	int getAllOrdersCount(int userId); // 페이징처리용
	List<OrderDetailVO> getAllOrders(Map<String, Object> params); // 모든 주문 조회
	int getCanceledOrdersCount(int userId); // 페이징처리용
	List<OrderDetailVO> getCanceledOrders(Map<String, Object> params); // 모든 주문 조회
	OrderDetailVO getOrderDetail(int orderId);
	List<OrderDetailVO> getOrderProductDetail(int orderId);
	PaymentDetailVO getOrderPaymentDetail(int orderId);
	void insertReview(int userId, int productId, String status, String content);
	
	//혜택정보
	List<UserCouponVO> getUserCouponInfo(int userId); //유저 쿠폰 정보
	
}
