package com.omiyami.shop.admin.impl;

import java.util.List;



import com.omiyami.shop.admin.vo.AdminMemberStatsVO;
import com.omiyami.shop.admin.vo.AdminMemberVO;

public interface AdminMemberDAO {
	 AdminMemberStatsVO selectMemberStats();
	    List<AdminMemberVO> selectLatestMembers(int limit);
	    List<AdminMemberVO> selectMemberList(int offset, int size);
	    int selectTotalMemberCount();
}
