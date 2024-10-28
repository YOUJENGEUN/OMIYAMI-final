package com.omiyami.shop.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omiyami.shop.admin.NoticeService;
import com.omiyami.shop.admin.vo.NoticeVO;

@Controller
public class NoticeController {
    
    @Autowired
    private NoticeService noticeService;
    
    // 공지사항 메인 페이지
    @RequestMapping(value = "/post-notice", method = {RequestMethod.GET, RequestMethod.POST})
    public String getNoticeList(Model model) {
        try {
            List<NoticeVO> notices = noticeService.getNoticeList();
            model.addAttribute("notices", notices);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "공지사항 목록을 불러오는데 실패했습니다: " + e.getMessage());
        }
        return "admin/post-notice"; // WEB-INF/views/admin/post-notice.jsp
    }
    
    // 공지사항 작성 폼
    @GetMapping("/post-notice-form")
    public String noticeForm(Model model) {
        model.addAttribute("notice", new NoticeVO());
        return "admin/post-notice-form";
    }
    
    // 공지사항 등록
    @PostMapping("/insertNotice")
    public String insertNotice(NoticeVO notice, RedirectAttributes rttr) {
        try {
            notice.setWriteDate(new Date());
            noticeService.insertNotice(notice);
            rttr.addFlashAttribute("message", "공지사항이 성공적으로 등록되었습니다.");
            rttr.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("message", "공지사항 등록에 실패했습니다: " + e.getMessage());
            rttr.addFlashAttribute("messageType", "error");
        }
        return "redirect:/post-notice";
    }
    
    // 공지사항 수정 폼
    @GetMapping("/post-notice-form-modify")
    public String modifyForm(@RequestParam("noticeId") Long noticeId, Model model) {
        try {
            NoticeVO notice = noticeService.getNoticeById(noticeId);
            if (notice == null) {
                model.addAttribute("error", "해당 공지사항을 찾을 수 없습니다.");
                return "redirect:/post-notice";
            }
            model.addAttribute("notice", notice);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "공지사항을 불러오는데 실패했습니다: " + e.getMessage());
        }
        return "admin/post-notice-form-modify";
    }
    
    // 공지사항 수정
    @PostMapping("/updateNotice")
    public String updateNotice(NoticeVO notice, RedirectAttributes rttr) {
        try {
            noticeService.updateNotice(notice);
            rttr.addFlashAttribute("message", "공지사항이 성공적으로 수정되었습니다.");
            rttr.addFlashAttribute("messageType", "success");
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("message", "공지사항 수정에 실패했습니다: " + e.getMessage());
            rttr.addFlashAttribute("messageType", "error");
        }
        return "redirect:/post-notice";
    }
    
    // 공지사항 삭제
    @PostMapping("/deleteNotices")
    public String deleteNotices(@RequestParam("noticeIds") List<Long> noticeIds, 
                              RedirectAttributes rttr) {
        try {
            boolean deleted = noticeService.deleteNotices(noticeIds);
            if (deleted) {
                rttr.addFlashAttribute("message", "선택한 공지사항이 성공적으로 삭제되었습니다.");
                rttr.addFlashAttribute("messageType", "success");
            } else {
                rttr.addFlashAttribute("message", "공지사항 삭제에 실패했습니다.");
                rttr.addFlashAttribute("messageType", "error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            rttr.addFlashAttribute("message", "처리 중 오류가 발생했습니다: " + e.getMessage());
            rttr.addFlashAttribute("messageType", "error");
        }
        return "redirect:/post-notice";
    }
    

}