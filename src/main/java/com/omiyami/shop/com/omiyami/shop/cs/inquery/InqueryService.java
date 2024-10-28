package com.omiyami.shop.cs.inquery;

import java.util.List;

public interface InqueryService {

    void insertInquery(InqueryVO inquery);
    List<InqueryVO> getInqueriesByUserId(int user_id);
    
}
