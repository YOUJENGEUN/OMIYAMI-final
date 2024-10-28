package com.omiyami.shop.order;

import java.util.List;

public interface OrderDAO {
	long getTotalOrderCount();

	long getCancelledOrderCount();

	List<OrderVO> getOrderList(OrderVO vo);

	OrderVO getOrder(Long orderId);

	void insertOrder(OrderVO vo);

	void updateOrder(OrderVO vo);

	void deleteOrder(Long orderId);
	
}
