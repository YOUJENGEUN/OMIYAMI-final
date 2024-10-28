package com.omiyami.shop.user.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.omiyami.shop.order.OrderDetailVO;
import com.omiyami.shop.order.PaymentDetailVO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDAO mypageDAO;

	@Override
	public int getUserOrderCount(int userId) {
		return mypageDAO.getUserOrderCount(userId);
	}

	@Override
	public int getUserCancelCount(int userId) {
		return mypageDAO.getUserCancelCount(userId);
	}

	@Override
	public int getTotalPointsByStatus(int userId, String description) {
		// 사용자 ID와 포인트 상태를 Map에 담아서 전달
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("description", description);
        
        return mypageDAO.getTotalPointsByStatus(params);
	}
	
	@Override
	public int getUserCouponCount(int userId) {
		return mypageDAO.getUserCouponCount(userId);
	}
	
	@Override
	public String getLatestOrderStatus(int userId) {
		return mypageDAO.getLatestOrderStatus(userId);
	}
	
	@Override
	public List<OrderDetailVO> getRecentOrders(int userId) {
		return mypageDAO.getRecentOrders(userId);
	}

	
	
	
	@Override
	public int getAllOrdersCount(int userId) {
		return mypageDAO.getAllOrdersCount(userId);
	}

	@Override
	public List<OrderDetailVO> getAllOrders(int userId, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("pageSize", pageSize);
        params.put("offset", offset);
        
        return mypageDAO.getAllOrders(params);
    }
	
	
	
	
	@Override
	public int getCanceledOrdersCount(int userId) {
		return mypageDAO.getCanceledOrdersCount(userId);
	}

	@Override
	public List<OrderDetailVO> getCanceledOrders(int userId, int page, int pageSize) {
		int offset = (page - 1) * pageSize;
        Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("pageSize", pageSize);
        params.put("offset", offset);
        
        return mypageDAO.getCanceledOrders(params);
	}
	
	
	
	
	@Override
	public OrderDetailVO getOrderDetail(int orderId) {
		return mypageDAO.getOrderDetail(orderId);
	}
	
	@Override
	public List<OrderDetailVO> getOrderProductDetail(int orderId) {
		return mypageDAO.getOrderProductDetail(orderId);
	}

	@Override
	public PaymentDetailVO getOrderPaymentDetail(int orderId) {
		return mypageDAO.getOrderPaymentDetail(orderId);
	}
	
	@Override
	public void insertReview(int userId, int productId, String status, String content) {
		mypageDAO.insertReview(userId, productId, status, content);
	}
	
	
	
	
	
	@Override
	public List<UserCouponVO> getUserCouponInfo(int userId) {
		return mypageDAO.getUserCouponInfo(userId);
	}

	

	

	

	

	


	

}
