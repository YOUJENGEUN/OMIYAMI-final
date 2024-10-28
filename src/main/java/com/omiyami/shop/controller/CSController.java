package com.omiyami.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.omiyami.shop.cs.faq.FaqService;
import com.omiyami.shop.cs.faq.FaqVO;
import com.omiyami.shop.cs.inquery.InqueryService;
import com.omiyami.shop.cs.inquery.InqueryVO;
import com.omiyami.shop.cs.notice.NoticeService;
import com.omiyami.shop.cs.notice.NoticeVO;
import com.omiyami.shop.user.UserVO;

@Controller
@RequestMapping("/customerservice")
public class CSController {

	@Autowired
    private NoticeService noticeService;
	
	@Autowired
    private FaqService faqService;
	
    @Autowired
    private InqueryService inqueryService;
	
	@GetMapping("/notices")
	public String getNoticeList(@RequestParam(defaultValue = "1") int pageNumber, Model model) {
		
		int pageSize = 6; 
        List<NoticeVO> noticeList = noticeService.getPagedNoticeList(pageNumber, pageSize); 
        
        for (NoticeVO notice : noticeList) {
            if (notice.getContent() != null) {
                notice.setContent(notice.getContent().replace("\n", "<br>"));
            }
        }
        
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("currentPage", pageNumber);

        
        int totalCount = noticeService.getTotalNoticeCount(); 
        int totalPages = (int) Math.ceil((double) totalCount / pageSize); // 페이지 수 계산
        model.addAttribute("totalPages", totalPages);
        
        return "customerservice/noticeList";  // 공지사항 리스트 페이지
    }
	
	// 검색 기능 추가
    @RequestMapping("/notice/search")
    public String searchNotice(@RequestParam String keyword, 
                            @RequestParam(defaultValue = "1") int pageNumber, 
                            Model model) {
        int pageSize = 6; // 페이지당 Notice 수
        List<NoticeVO> searchResults = noticeService.searchNotice(keyword, pageNumber, pageSize); 
        
        for (NoticeVO notice : searchResults) {
            if (notice.getContent() != null) {
                notice.setContent(notice.getContent().replace("\n", "<br>"));
            }
        }
        
        model.addAttribute("noticeList", searchResults);
        model.addAttribute("currentPage", pageNumber);
        model.addAttribute("keyword", keyword);
        
        // 총 페이지 수 계산
        int totalCount = noticeService.getTotalCountByKeyword(keyword); 
        int totalPages = (int) Math.ceil((double) totalCount / pageSize); 
        model.addAttribute("totalPages", totalPages);
        
        return "customerservice/noticeList"; 
    }
	
	
	@GetMapping("/faqs")
	public String getFaqList(@RequestParam(defaultValue = "1") int pageNumber, Model model) {
		
		int pageSize = 6; 
        List<FaqVO> faqList = faqService.getPagedFaqList(pageNumber, pageSize);
        
        
        model.addAttribute("faqList", faqList);
        model.addAttribute("currentPage", pageNumber);

        
        int totalCount = faqService.getTotalFaqCount(); 
        int totalPages = (int) Math.ceil((double) totalCount / pageSize); 
        model.addAttribute("totalPages", totalPages);
		
        return "customerservice/faqList";  // faq 리스트 페이지
    }
	
	
	// 검색 기능 추가
    @RequestMapping("/faq/search")
    public String searchFaq(@RequestParam String keyword, 
                            @RequestParam(defaultValue = "1") int pageNumber, 
                            Model model) {
        int pageSize = 6; 
        List<FaqVO> searchResults = faqService.searchFaqs(keyword, pageNumber, pageSize); 
        model.addAttribute("faqList", searchResults);
        model.addAttribute("currentPage", pageNumber);
        model.addAttribute("keyword", keyword); 
        
        // 총 페이지 수 계산
        int totalCount = faqService.getTotalCountByKeyword(keyword); 
        int totalPages = (int) Math.ceil((double) totalCount / pageSize); 
        model.addAttribute("totalPages", totalPages);
        
        return "customerservice/faqList"; 
    }
	

    @RequestMapping(value = "/inquery", method = RequestMethod.GET)
    public String getInqueryList(Model model, HttpSession session) {
        
        UserVO userVO = (UserVO) session.getAttribute("userVO");  
        if (userVO == null) {
	        session.setAttribute("redirectUrl", "/customerservice/inquery");
	        return "redirect:/login";
	    }

        int user_id = userVO.getUser_id(); 

        // 문의 목록 조회
        List<InqueryVO> inqueries = inqueryService.getInqueriesByUserId(user_id);
        
        
      //줄바꿈태그변환
        for (InqueryVO inquery : inqueries) {
            if (inquery.getContent() != null) {
                inquery.setContent(inquery.getContent().replace("\n", "<br>"));
            }
            if (inquery.getAnswer_content() != null) {
                inquery.setAnswer_content(inquery.getAnswer_content().replace("\n", "<br>"));
            }
        }
        
        model.addAttribute("inqueries", inqueries);

        return "customerservice/inqueryList";  
    }

    // 1:1 문의 요청 
    @RequestMapping(value = "/inqueryForm", method = RequestMethod.GET)
    public String showInqueryForm(HttpSession session) {
        UserVO userVO = (UserVO) session.getAttribute("userVO");  
        if (userVO == null) {
	        session.setAttribute("redirectUrl", "/customerservice/inquery");
	        return "redirect:/login";
	    }

        return "customerservice/inqueryForm";  
    }

    // 1:1 문의 등록 처리
    @RequestMapping(value = "/registerInquery", method = RequestMethod.POST)
    public String insertInquery(InqueryVO inquery, HttpSession session) {
        UserVO userVO = (UserVO) session.getAttribute("userVO");  
        if (userVO == null) {
            return "redirect:/login";  
        }

        int user_id = userVO.getUser_id();  
        inquery.setUser_id(user_id);  

        inquery.setStatus("미답변");

        inqueryService.insertInquery(inquery);  
        return "customerservice/inquery";  // 리다이렉트
    }
}

	
	

