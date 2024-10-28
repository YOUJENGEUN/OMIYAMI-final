package com.omiyami.shop.cs.inquery;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class InqueryServiceImpl implements InqueryService {

	@Autowired
	private InqueryDAO inqueryDAO;
	
	@Override
    public void insertInquery(InqueryVO inquery) {
        inqueryDAO.insertInquery(inquery);
    }

    @Override
    public List<InqueryVO> getInqueriesByUserId(int user_id) {
        return inqueryDAO.getInqueriesByUserId(user_id);
    }

}
