package com.omiyami.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.omiyami.shop.cs.notice.NoticeVO;
import com.omiyami.shop.order.OrderDetailVO;
import com.omiyami.shop.order.OrderVO;
import com.omiyami.shop.order.PaymentDetailVO;
import com.omiyami.shop.user.UserService;
import com.omiyami.shop.user.UserVO;
import com.omiyami.shop.user.mypage.MypageService;
import com.omiyami.shop.user.mypage.UserCouponVO;

@Controller
public class MypageController {

	@Autowired
	UserService userService;
	
	@Autowired
	MypageService mypageService;
	
	//마이페이지메인
	@GetMapping("/mypage")
	public String showMypage(HttpSession session, Model model) {
		
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		if(userVO != null) {
            int userId = userVO.getUser_id();
			int orderCount = mypageService.getUserOrderCount(userId);
	        int cancelCount = mypageService.getUserCancelCount(userId);
	        int availablePoints = mypageService.getTotalPointsByStatus(userId, "적립");
	        int couponCount = mypageService.getUserCouponCount(userId);
	        String latestOrderStatus = mypageService.getLatestOrderStatus(userId);
            List<OrderDetailVO> recentOrders = mypageService.getRecentOrders(userId);

            model.addAttribute("userVO", userVO);
	        model.addAttribute("orderCount", orderCount);
	        model.addAttribute("cancelCount", cancelCount);
	        model.addAttribute("availablePoints", availablePoints);
	        model.addAttribute("couponCount", couponCount);
	        model.addAttribute("latestOrderStatus", latestOrderStatus);
	        model.addAttribute("recentOrders", recentOrders);
			
			return "mypage/mypageMain";
		}else {
			session.setAttribute("redirectUrl", "/mypage");
			return "redirect:/login";
		}
	}
	
	/////////////////////////////////////////////////////////
	////////////////쇼핑정보////////////////////////////////////
	
	@GetMapping("/orderList")
	public String showOrderList(@RequestParam(value = "page", defaultValue = "1") int page,
								HttpSession session, Model model) {
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		if(userVO != null) {
            int userId = userVO.getUser_id();

            int pageSize = 8;
            int allOrdersCount = mypageService.getAllOrdersCount(userId);
            int totalPages = (int) Math.ceil((double) allOrdersCount / pageSize);
            List<OrderDetailVO> allOrders = mypageService.getAllOrders(userId, page, pageSize);
            
            model.addAttribute("allOrders", allOrders);
            model.addAttribute("allOrdersCount", allOrdersCount);
            model.addAttribute("currentPage", page);
            model.addAttribute("userVO", userVO);
            model.addAttribute("totalPages", totalPages);
            
		}
		return "mypage/orderList";
	}
	
	@GetMapping("/orderCanceled")
	public String showOrderCanceled(@RequestParam(value = "page", defaultValue = "1") int page,
									HttpSession session, Model model) {
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		if(userVO != null) {
			int userId = userVO.getUser_id();
			
			int pageSize = 8;
			int canceledOrdersCount = mypageService.getCanceledOrdersCount(userId);
			int totalPages = (int) Math.ceil((double) canceledOrdersCount / pageSize);
			List<OrderDetailVO> canceledOrders = mypageService.getCanceledOrders(userId, page, pageSize);
			
			model.addAttribute("canceledOrders", canceledOrders);
			model.addAttribute("canceledOrdersCount", canceledOrdersCount);
			model.addAttribute("currentPage", page);
			model.addAttribute("userVO", userVO);
			model.addAttribute("totalPages", totalPages); // 총 페이지 수 추가
		}
		return "mypage/orderCanceled";
	}

	@GetMapping("/orderdetail")
	public String showOrderDetail(@RequestParam("orderId") int orderId,
								  HttpSession session, Model model) {
		
		OrderDetailVO order = mypageService.getOrderDetail(orderId);
		List<OrderDetailVO> orderProduct = mypageService.getOrderProductDetail(orderId);
		PaymentDetailVO payment = mypageService.getOrderPaymentDetail(orderId);
		
		
		model.addAttribute("order", order);
		model.addAttribute("orderProduct", orderProduct);
		model.addAttribute("payment", payment);
		
		return "mypage/orderdetail";
	}
	
	@GetMapping("/reviewForm")
	public String showReviewForm(@RequestParam("orderNum") String orderNum,
            @RequestParam("productName") String productName,
            @RequestParam("productId") int productId,
								HttpSession session, Model model) {
		
		model.addAttribute("orderNum", orderNum);
	    model.addAttribute("productName", productName);
	    model.addAttribute("productId", productId);
		
		return "mypage/reviewForm";
	}
	
	@PostMapping("/submitReview")
	public String submitReview(@RequestParam("productId") int productId,
					            @RequestParam("status") String status,
					            @RequestParam("content") String content,
					            HttpSession session, Model model) {
		
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		model.addAttribute("userVO", userVO);
		int userId = userVO.getUser_id();
		
		mypageService.insertReview(userId, productId, status, content);
		return "mypage/reviewForm_end";
	}
	
	/////////////////////////////////////////////////////////
	////////////////혜택정보////////////////////////////////////
	
	@GetMapping("/pointcoupon")
	public String showCouponPoint(HttpSession session, Model model) {
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		if(userVO != null) {
			model.addAttribute("userVO", userVO);
			int userId = userVO.getUser_id();

			int availablePoints = mypageService.getTotalPointsByStatus(userId, "적립");
			int pendingPoints = mypageService.getTotalPointsByStatus(userId, "적립예정");
			int refundWaitPoints = mypageService.getTotalPointsByStatus(userId, "환불차감");
			int totalPoints = availablePoints + pendingPoints + refundWaitPoints;

			availablePoints = Math.max(availablePoints, 0);
			pendingPoints = Math.max(pendingPoints, 0);
			refundWaitPoints = Math.max(refundWaitPoints, 0);

			List<UserCouponVO> coupons = mypageService.getUserCouponInfo(userId);

			model.addAttribute("totalPoints", totalPoints);
			model.addAttribute("availablePoints", availablePoints);
			model.addAttribute("pendingPoints", pendingPoints);
			model.addAttribute("refundWaitPoints", refundWaitPoints);
			model.addAttribute("coupons", coupons);

			return "mypage/pointcoupon";
		} else {
			session.setAttribute("redirectUrl", "/pointcoupon");
			return "redirect:/login";
		}
    }
	
	
	/////////////////////////////////////////////////////////
	////////////////나의정보////////////////////////////////////

    // 회원정보수정 (GET)
 	@RequestMapping(value = "/userModify", method = RequestMethod.GET)
 	public String showModifyUserInfo(HttpSession session, Model model) {
 		// 1. 세션 체크
 		UserVO sessionUser = (UserVO) session.getAttribute("userVO");
 		if (sessionUser == null) {
 			// 세션이 없으면 로그인 페이지로 리다이렉트
 			return "redirect:/login";
 		}

 		try {
 			// 2. 사용자 정보 조회
 			UserVO vo = userService.getUserInfo(sessionUser.getUsername());
 			if (vo == null) {
 				// 사용자 정보가 없으면 로그인 페이지로 리다이렉트
 				return "redirect:/login";
 			}

 			// 3. 주소 처리
 			if (vo.getAddress() != null && !vo.getAddress().isEmpty()) {
 				String[] addressParts = vo.getAddress().split(", ", 3);
 					model.addAttribute("address1", addressParts[0]);
 					model.addAttribute("address2", addressParts[1]);
 					model.addAttribute("address3", addressParts[2]);
 			} else {
 				// 주소가 null이거나 비어있을 경우
 				model.addAttribute("address1", "");
 				model.addAttribute("address2", "");
 				model.addAttribute("address3", "");
 			}

 			// 4. 사용자 정보를 모델에 추가
 			model.addAttribute("user", vo);

 			return "mypage/userModifyForm";

 		} catch (Exception e) {
 			e.printStackTrace();
 			return "error/500";
 		}
 	}

 	// 회원정보수정 (POST)
 	@RequestMapping(value = "/userModify", method = RequestMethod.POST)
 	public String modifyUserInfo(
 			@RequestParam("username") String username, 
 			@RequestParam("password") String password,
 			@RequestParam("email") String email, 
 			@RequestParam("post_num") String post_num,
 			@RequestParam("address1") String address1, 
 			@RequestParam("address2") String address2,
 			@RequestParam("address3") String address3, 
 			Model model) throws Exception {

 		String fulladdress = address1 + ", " + address2 + ", " + address3;

 		UserVO vo = new UserVO();

 		vo.setUsername(username);
 		vo.setPassword(password);
 		vo.setEmail(email);
 		vo.setPost_num(post_num);
 		vo.setAddress(fulladdress);

 		userService.updateInfo(vo);

 		return "mypage/userModify_end";
 	}

 	//회원탈퇴 (GET)
 	@RequestMapping(value = "/userDelete", method = RequestMethod.GET)
 	public String showDeleteUserForm(HttpSession session, Model model) {

 		UserVO sessionUser = (UserVO) session.getAttribute("userVO");
 		if (sessionUser == null) {
 			return "redirect:/login";
 		}
 		
 		model.addAttribute("user", sessionUser);
 		return "mypage/userDeleteForm";

 	}
 		
	//회원탈퇴 (POST)
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public String deleteUser(@RequestParam("password") String password,
	        				HttpSession session, Model model) throws Exception {

		// 세션에서 로그인된 사용자 정보 가져오기
	    UserVO sessionUser = (UserVO) session.getAttribute("userVO");

	    // DB에서 비밀번호 가져옴
        String dbPass = userService.deleteCheckPassword(sessionUser.getUsername());
        // DB비밀번호&입력비밀번호비교 / 불일치 시 폼으로 돌아감
        if (dbPass == null || !dbPass.equals(password)) {
            model.addAttribute("ErrorMessage", "비밀번호가 일치하지 않습니다.");
            model.addAttribute("user", sessionUser);
            return "mypage/userDeleteForm"; 
        }
        // 삭제처리
	    userService.deleteUser(sessionUser);
		session.invalidate();
		return "mypage/userDelete_end";

	}

}
