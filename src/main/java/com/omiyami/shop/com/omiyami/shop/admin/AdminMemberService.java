package com.omiyami.shop.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.omiyami.shop.admin.impl.AdminMemberDAO;
import com.omiyami.shop.admin.vo.AdminMemberStatsVO;
import com.omiyami.shop.admin.vo.AdminMemberVO;

@Service("adminMemberService")
public class AdminMemberService {
    
    @Autowired
    private AdminMemberDAO adminMemberDAO;
    
    public AdminMemberStatsVO getMemberStats() {
        return adminMemberDAO.selectMemberStats();
    }
    
    public List<AdminMemberVO> getLatestMembers(int limit) {
        return adminMemberDAO.selectLatestMembers(limit);
    }
    
    public List<AdminMemberVO> getMemberList(int page, int size) {
        int offset = (page - 1) * size;
        return adminMemberDAO.selectMemberList(offset, size);
    }
    
    public int getTotalMemberCount() {
        return adminMemberDAO.selectTotalMemberCount();
    }
}