package com.omiyami.shop.controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omiyami.shop.admin.AdminMemberService;
import com.omiyami.shop.admin.vo.AdminMemberStatsVO;
import com.omiyami.shop.admin.vo.AdminMemberVO;

@Controller
public class AdminMemberController {
    
    @Autowired
    private AdminMemberService adminMemberService;
    
    // 메인 페이지 매핑
    @GetMapping("/member-main")
    public String memberMain(Model model) {
        // 회원 통계 조회
        AdminMemberStatsVO stats = adminMemberService.getMemberStats();
        model.addAttribute("stats", stats);
        
        // 최신 회원 5명 조회
        List<AdminMemberVO> latestMembers = adminMemberService.getLatestMembers(5);
        model.addAttribute("latestMembers", latestMembers);
        
        return "admin/member-main";
    }
    
    // 회원 목록 더보기
    @GetMapping("/member-list")
    @ResponseBody
    public Map<String, Object> getMemberList(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size) {
        
        List<AdminMemberVO> members = adminMemberService.getMemberList(page, size);
        int totalCount = adminMemberService.getTotalMemberCount();
        
        Map<String, Object> response = new HashMap<>();
        response.put("members", members);
        response.put("totalCount", totalCount);
        
        return response;
    }
}
