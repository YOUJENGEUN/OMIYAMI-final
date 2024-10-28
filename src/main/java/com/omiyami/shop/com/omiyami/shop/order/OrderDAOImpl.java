package com.omiyami.shop.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	 @Autowired
	    private SqlSessionTemplate sqlSession;

	  @Override
	    public long getTotalOrderCount() {
	        return sqlSession.selectOne("OrderMapper.getTotalOrderCount");
	    }
	    
	    @Override
	    public long getCancelledOrderCount() {
	        return sqlSession.selectOne("OrderMapper.getCancelledOrderCount");
	    }

		@Override
		public List<OrderVO> getOrderList(OrderVO vo) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public OrderVO getOrder(Long orderId) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public void insertOrder(OrderVO vo) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void updateOrder(OrderVO vo) {
			// TODO Auto-generated method stub
			
		}

		@Override
		public void deleteOrder(Long orderId) {
			// TODO Auto-generated method stub
			
		}

}
