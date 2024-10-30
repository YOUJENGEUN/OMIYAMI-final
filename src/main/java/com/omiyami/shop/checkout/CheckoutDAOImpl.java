package com.omiyami.shop.checkout;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.omiyami.shop.order.OrderDetailVO;
import com.omiyami.shop.order.PaymentDetailVO;
import com.omiyami.shop.user.mypage.UserCouponVO;

@Repository
public class CheckoutDAOImpl implements CheckoutDAO {

	@Autowired
    private SqlSession sqlSession;
	
	@Override
	public List<UserCouponVO> getUserCoupons(int user_id) {
		return sqlSession.selectList("CheckoutMapper.getUserCouponInfo", user_id);
	}

	@Override
    public int getCurrentBalance(int userId) {
        return sqlSession.selectOne("CheckoutMapper.getCurrentBalance", userId);
    }

    @Override
    public void addPoints(Map<String, Object> params) {
        sqlSession.insert("CheckoutMapper.addPoints", params);
    }

    @Override
    public void addPendingPoints(Map<String, Object> params) {
        sqlSession.insert("CheckoutMapper.addPendingPoints", params);
    }
    
    @Override
    public void usePoints(Map<String, Object> params) {
        sqlSession.insert("CheckoutMapper.usePoints", params);
    }

    @Override
    public int insertOrder(OrderDetailVO orderDetail) {
        sqlSession.insert("CheckoutMapper.insertOrder", orderDetail);
        return orderDetail.getOrderId();
    }

    @Override
    public void insertOrderDetails(List<OrderDetailVO> orderDetails) {
        for (OrderDetailVO detail : orderDetails) {
            sqlSession.insert("CheckoutMapper.insertOrderDetail", detail);
        }
    }

	@Override
	public void updateProductStock(Map<String, Object> params) {
		sqlSession.update("CheckoutMapper.updateProductStock", params);
		
	}

	@Override
	public void deleteCartItem(int productId, int userId) {
		Map<String, Object> params = new HashMap<>();
        params.put("productId", productId);
        params.put("userId", userId);
        sqlSession.delete("CheckoutMapper.deleteCartItem", params);
		
	}

	@Override
	public void insertPaymentDetails(PaymentDetailVO paymentDetail) {
		sqlSession.insert("CheckoutMapper.insertPaymentDetail", paymentDetail);
		
	}

	@Override
	public void updateUserCouponStatus(Integer userCouponId) {
		sqlSession.update("CheckoutMapper.updateUserCouponStatus", userCouponId);
		
	}

	
}