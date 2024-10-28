package com.omiyami.shop.user.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.order.OrderDetailVO;
import com.omiyami.shop.order.OrderVO;
import com.omiyami.shop.order.PaymentDetailVO;
import com.omiyami.shop.product.ProductVO;
import com.omiyami.shop.user.UserVO;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int getUserOrderCount(int userId) {
		return sqlSession.selectOne("MypageMapper.getUserOrderCount", userId);
	}

	@Override
	public int getUserCancelCount(int userId) {
		return sqlSession.selectOne("MypageMapper.getUserCancelCount", userId);
	}

	@Override
	public int getTotalPointsByStatus(Map<String, Object> params) {
        // userId와 status를 기반으로 포인트 합계를 조회
		Integer points = sqlSession.selectOne("MypageMapper.getTotalPointsByStatus", params);
    
        if (points == null) {
            points = 0; // NULL일때 기본값 설정
        }
        
        return points;
	}

	@Override
	public int getUserCouponCount(int userId) {
		return sqlSession.selectOne("MypageMapper.getUserCouponCount", userId);
	}

	@Override
	public String getLatestOrderStatus(int userId) {
		return sqlSession.selectOne("MypageMapper.getLatestOrderStatus", userId);
	}

	@Override
	public List<OrderDetailVO> getRecentOrders(int userId) {
		return sqlSession.selectList("MypageMapper.getRecentOrders", userId);
	}

	
	////////////////////////////////////////////////////
	@Override
	public int getAllOrdersCount(int userId) {
		return sqlSession.selectOne("MypageMapper.getAllOrdersCount", userId);
	}
	
	@Override
	public List<OrderDetailVO> getAllOrders(Map<String, Object> params) {
        return sqlSession.selectList("MypageMapper.getAllOrders", params);
    }
	
	@Override
	public int getCanceledOrdersCount(int userId) {
		return sqlSession.selectOne("MypageMapper.getCanceledOrdersCount", userId);
	}

	@Override
	public List<OrderDetailVO> getCanceledOrders(Map<String, Object> params) {
		return sqlSession.selectList("MypageMapper.getCanceledOrders", params);
	}
	
	@Override
	public OrderDetailVO getOrderDetail(int orderId) {
		return sqlSession.selectOne("MypageMapper.getOrderDetail", orderId);
	}
	
	@Override
	public List<OrderDetailVO> getOrderProductDetail(int orderId) {
		return sqlSession.selectList("MypageMapper.getOrderProductDetail", orderId);
	}
	
	@Override
	public PaymentDetailVO getOrderPaymentDetail(int orderId) {
		return sqlSession.selectOne("MypageMapper.getOrderPaymentDetail", orderId);
	}

	@Override
	public void insertReview(int userId, int productId, String status, String content) {
		Map<String, Object> params = new HashMap<>();
        params.put("userId", userId);
        params.put("productId", productId);
        params.put("status", status);
        params.put("content", content);
        
        sqlSession.insert("MypageMapper.insertReview", params);
	}
	
	////////////////////////////////////////////////////
	@Override
	public List<UserCouponVO> getUserCouponInfo(int userId) {
		return sqlSession.selectList("MypageMapper.getUserCouponInfo", userId);
	}

	

	
	


	




	
}
