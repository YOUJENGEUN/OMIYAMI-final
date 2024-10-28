package com.omiyami.shop.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;

	@Override
	public Long getTotalOrderCount() {
		return orderDAO.getTotalOrderCount();
	}

	@Override
	public Long getCancelledOrderCount() {
		return orderDAO.getCancelledOrderCount();
	}

	@Override
	public List<OrderVO> getOrderList(OrderVO vo) {
		return orderDAO.getOrderList(vo);
	}

	@Override
	public OrderVO getOrder(Long orderId) {
		return orderDAO.getOrder(orderId);
	}

	@Override
	public void insertOrder(OrderVO vo) {
		orderDAO.insertOrder(vo);

	}

	@Override
	@Transactional
	public void updateOrder(OrderVO vo) {
		orderDAO.updateOrder(vo);

	}

	@Override
	@Transactional
	public void deleteOrder(Long orderId) {
		orderDAO.deleteOrder(orderId);

	}

	@Override
	@Transactional
	public void cancelOrder(Long orderId) {
		OrderVO order = orderDAO.getOrder(orderId);
		if (order != null) {
			order.setStatus("주문취소");
			orderDAO.updateOrder(order);
		}

	}

}