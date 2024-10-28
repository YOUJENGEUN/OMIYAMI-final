package com.omiyami.shop.order;

import java.util.List;

public interface OrderService {
	// 주문 목록 조회
    List<OrderVO> getOrderList(OrderVO vo);
    
    // 주문 상세 조회
    OrderVO getOrder(Long orderId);
    
    // 주문 등록
    void insertOrder(OrderVO vo);
    
    // 주문 수정
    void updateOrder(OrderVO vo);
    
    // 주문 삭제
    void deleteOrder(Long orderId);
    
    // 주문 취소
    void cancelOrder(Long orderId);
    // 전체 주문 수 조회
	Long getTotalOrderCount();
	// 취소된 주문 수 조회
	Long getCancelledOrderCount();
}
