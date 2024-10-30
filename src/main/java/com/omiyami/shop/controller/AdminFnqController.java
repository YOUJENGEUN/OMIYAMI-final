package com.omiyami.shop.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.omiyami.shop.admin.AdminPostService;
import com.omiyami.shop.admin.vo.AdminFAQVO;

@Controller
public class AdminFnqController {
	@Autowired
	private AdminPostService adminPostService;

	// FAQ 목록 페이지
	@GetMapping("/post-faq")
	public String faqList(Model model) {
		try {
			List<AdminFAQVO> faqs = adminPostService.getAllFaqs();
			model.addAttribute("faqs", faqs);
		} catch (Exception e) {
			model.addAttribute("messageType", "error");
			model.addAttribute("message", "FAQ 목록을 불러오는 중 오류가 발생했습니다.");
		}
		return "admin/post-faq";
	}

	// FAQ 작성 폼
	@GetMapping("/post-faq-form")
	public String faqWriteForm() {
		return "admin/post-faq-form";
	}

	// FAQ 작성 처리
	@PostMapping("/post-faq-write")
	public String faqWrite(AdminFAQVO faq, RedirectAttributes rttr) {
		try {
			adminPostService.createFaq(faq);
			rttr.addFlashAttribute("messageType", "success");
			rttr.addFlashAttribute("message", "FAQ가 성공적으로 등록되었습니다.");
		} catch (Exception e) {
			rttr.addFlashAttribute("messageType", "error");
			rttr.addFlashAttribute("message", "FAQ 등록 중 오류가 발생했습니다.");
		}
		return "redirect:/post-faq";
	}

	// FAQ 수정 폼
	@GetMapping("/post-faq-form-modify")
	public String faqModifyForm(Long faqId, Model model) {
		try {
			AdminFAQVO faq = adminPostService.getFaqById(faqId);
			model.addAttribute("faq", faq);
		} catch (Exception e) {
			model.addAttribute("messageType", "error");
			model.addAttribute("message", "FAQ 정보를 불러오는 중 오류가 발생했습니다.");
		}
		return "admin/post-faq-form-modify";
	}

	// FAQ 수정 처리
	@PostMapping("/post-faq-modify")
	public String faqModify(AdminFAQVO faq, RedirectAttributes rttr) {
		try {
			adminPostService.updateFaq(faq);
			rttr.addFlashAttribute("messageType", "success");
			rttr.addFlashAttribute("message", "FAQ가 성공적으로 수정되었습니다.");
		} catch (Exception e) {
			rttr.addFlashAttribute("messageType", "error");
			rttr.addFlashAttribute("message", "FAQ 수정 중 오류가 발생했습니다.");
		}
		return "redirect:/post-faq";
	}

	// FAQ 삭제 처리
	@PostMapping("/post-faq/delete")
	public String deleteFaq(@RequestParam("faqIds") List<Long> faqIds, RedirectAttributes rttr) {
		try {
			adminPostService.deleteFaq(faqIds); // 서비스 메서드 호출
			rttr.addFlashAttribute("message", "FAQ가 성공적으로 삭제되었습니다.");
			rttr.addFlashAttribute("messageType", "success");
		} catch (Exception e) {
			rttr.addFlashAttribute("message", "FAQ 삭제 중 오류가 발생했습니다.");
			rttr.addFlashAttribute("messageType", "error");
		}
		return "redirect:/post-faq";
	}

	// FAQ 상세 조회
	@GetMapping("/post-faq/{faqId}")
	@ResponseBody
	public AdminFAQVO getFaq(@PathVariable Long faqId) {
		try {
			return adminPostService.getFaqById(faqId);
		} catch (Exception e) {
			return null;
		}
	}
}