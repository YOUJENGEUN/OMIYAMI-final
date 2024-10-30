package com.omiyami.shop.checkout;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.omiyami.shop.order.OrderDetailVO;
import com.omiyami.shop.order.PaymentDetailVO;
import com.omiyami.shop.user.UserVO;
import com.omiyami.shop.user.mypage.UserCouponVO;

@Service
public class CheckoutServiceImpl implements CheckoutService {

	@Autowired
	CheckoutDAO checkoutDAO;
	
	@Override
	public List<UserCouponVO> getUserCoupons(int user_id) {
		return checkoutDAO.getUserCoupons(user_id);
	}

	@Override
    public int getCurrentBalance(int userId) {
        return checkoutDAO.getCurrentBalance(userId);
    }

    @Override
    @Transactional
    public void addPoints(int userId, int points) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", userId);
        params.put("points", points);
        checkoutDAO.addPoints(params);
    }

    @Override
	public void addPendingPoints(int userId, int points) {
    	Map<String, Object> params = new HashMap<>();
        params.put("user_id", userId);
        params.put("points", points);
        checkoutDAO.addPendingPoints(params);
	}
    
    @Override
    @Transactional
    public void usePoints(int userId, int pointsUsed) {
        int currentBalance = checkoutDAO.getCurrentBalance(userId);
        if (currentBalance >= pointsUsed) {
            Map<String, Object> params = new HashMap<>();
            params.put("user_id", userId);
            params.put("pointsUsed", pointsUsed);
            params.put("currentBalance", currentBalance);
            checkoutDAO.usePoints(params);
        } else {
            throw new RuntimeException("잔액이 부족합니다.");
        }
    }

	@Override
	public void saveOrder(OrderDetailVO orderDetail, List<OrderDetailVO> orderDetails) {
		checkoutDAO.insertOrder(orderDetail);
        checkoutDAO.insertOrderDetails(orderDetails);
	}

	@Override
	@Transactional
	public void processCheckout(List<Integer> productIds, List<Integer> quantities, List<Integer> totalPrices,
            int totalOrderAmount, int shippingFee, int pointDiscount, Integer userCouponId, int couponDiscount, UserVO user,
            String receiverName, String receiverPhone, String postNum, String address) {

        int userId = user.getUser_id();
        Long orderNum = generateOrderNum(userId);

        // 최종 결제 금액 계산
        int finalPaymentAmount = totalOrderAmount - pointDiscount - couponDiscount + shippingFee;

        
        // 주문 정보 생성
        OrderDetailVO orderDetail = new OrderDetailVO();
        orderDetail.setUserId(userId);
        orderDetail.setOrderNum(orderNum);
        orderDetail.setOrderTotalPrice(finalPaymentAmount);
        orderDetail.setOrderStatus("결제예정");
        orderDetail.setReceiverName(receiverName);
        orderDetail.setReceiverPhone(receiverPhone);
        orderDetail.setPostNum(postNum);
        orderDetail.setAddress(address);

        // 주문 저장
        int orderId = checkoutDAO.insertOrder(orderDetail);
        // 주문 상세 리스트 생성
        List<OrderDetailVO> orderDetails = new ArrayList<>();
        for (int i = 0; i < productIds.size(); i++) {
            OrderDetailVO detail = new OrderDetailVO();
            detail.setOrderId(orderId); // 생성된 order_id 설정
            detail.setProductId(String.valueOf(productIds.get(i)));
            detail.setProductOrderQuantity(quantities.get(i));
            detail.setProductOrderPrice(totalPrices.get(i));
            orderDetails.add(detail);
        }

        // 주문 상세 저장
        checkoutDAO.insertOrderDetails(orderDetails);

        // 재고 업데이트
        for (int i = 0; i < productIds.size(); i++) {
            updateProductStock(productIds.get(i), quantities.get(i));
        }
        
        // 카트에서 삭제
        for (int productId : productIds) {
        	checkoutDAO.deleteCartItem(productId, userId);
        }
        
        // 포인트 차감 처리
        if (pointDiscount > 0) {
            usePoints(userId, pointDiscount);  // 포인트 차감 메소드 호출
        }
        
        // 결제 정보 생성
        PaymentDetailVO paymentDetail = new PaymentDetailVO();
        paymentDetail.setOrderId(orderId);
        paymentDetail.setUserId(userId);
        paymentDetail.setPointDiscount(pointDiscount); // 포인트 할인 설정
        paymentDetail.setPaymentPrice(finalPaymentAmount);
        paymentDetail.setPaymentMethod("무통장입금"); // 결제 수단 설정
        // 필요한 경우 쿠폰 ID와 쿠폰 할인 값 설정
        paymentDetail.setUserCouponId(userCouponId);
        paymentDetail.setCouponDiscount(couponDiscount);
        // 결제 정보 DB 저장
        checkoutDAO.insertPaymentDetails(paymentDetail);
        
        // 쿠폰 사용 처리
        if (userCouponId != null) {
            checkoutDAO.updateUserCouponStatus(userCouponId);
        }
        
        // 적립 예정 포인트 추가
        int rewardPoints = calculateRewardPoints(totalOrderAmount); // 적립 포인트 계산 로직 추가
        addPendingPoints(userId, rewardPoints); // 적립 예정 포인트 추가 메소드 호출
        
    }

    private void updateProductStock(int productId, int quantity) {
        Map<String, Object> params = new HashMap<>();
        params.put("productId", productId);
        params.put("quantity", quantity);
        checkoutDAO.updateProductStock(params); // DAO를 통해 재고 업데이트
    }

    private long generateOrderNum(int userId) {
        // 현재 날짜를 'yyMMddHHmm' 형식으로 포맷
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMddHHmm");
        String datePart = dateFormat.format(new Date());

        // 날짜 부분을 long으로 변환
        long dateLong = Long.parseLong(datePart); // yymmddHHmm을 long으로 변환

        // user_id를 두 자리로 포맷 (1 -> 01, 10 -> 10)
        String userIdPart = String.format("%02d", userId);
        int userIdInt = Integer.parseInt(userIdPart); // 포맷된 user_id를 int로 변환

        // 주문 번호 생성 (yymmddHHmm * 100 + user_id) 방식으로 생성
        return dateLong * 100 + userIdInt; // 최종 결과: yymmddHHmm01 형태의 long
    }

    private int calculateRewardPoints(int totalOrderAmount) {
        double rate = 0.01; // 예: 구매 금액의 1%를 적립
        return (int) (totalOrderAmount * rate);
    }
}