package com.omiyami.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omiyami.shop.checkout.CheckoutService;
import com.omiyami.shop.checkout.CheckoutVO;
import com.omiyami.shop.user.UserVO;
import com.omiyami.shop.user.mypage.UserCouponVO;

@Controller
public class CheckoutController {

	@Autowired
	private CheckoutService checkoutService;
	
	@PostMapping("/checkout")
	public String showCheckoutPage(
            @RequestParam("product_id") List<Integer> productIds,
            @RequestParam("quantity") List<Integer> quantities,
            @RequestParam("total_price") List<Integer> totalPrices,
            @RequestParam("total_order_amount") int totalOrderAmount,
            @RequestParam("shipping_fee") int shippingFee,
            @RequestParam("final_payment_amount") int finalPaymentAmount,
            @RequestParam("reward_point") int rewardPoint,
	        HttpSession session, Model model) {
	
		// 받은 데이터를 기반으로 결제 처리 로직을 추가
	    List<CheckoutVO> checkoutItems = new ArrayList<>();

	    
	    for (int i = 0; i < productIds.size(); i++) {
            CheckoutVO item = new CheckoutVO(productIds.get(i), quantities.get(i), 0);
            checkoutItems.add(item);
        }
	    
	    // 주문 금액과 기타 정보 모델에 추가
        model.addAttribute("checkoutItems", checkoutItems);
        model.addAttribute("totalOrderAmount", totalOrderAmount);
        model.addAttribute("shippingFee", shippingFee);
        model.addAttribute("finalPaymentAmount", finalPaymentAmount);
        model.addAttribute("rewardPoint", rewardPoint);

        UserVO userVO = (UserVO) session.getAttribute("userVO");
        if (userVO != null) {
            model.addAttribute("user", userVO);

            List<UserCouponVO> userCoupons = checkoutService.getUserCoupons(userVO.getUser_id());
            model.addAttribute("userCoupons", userCoupons);
            
            int currentBalance = checkoutService.getCurrentBalance(userVO.getUser_id()); // 현재 포인트 잔액 조회
            model.addAttribute("currentBalance", currentBalance); // 모델에 잔액 추가
            
            
            String fullAddress = userVO.getAddress();
            String[] addressParts = fullAddress.split(", ");
            model.addAttribute("address1", addressParts.length > 0 ? addressParts[0] : "");
            model.addAttribute("address2", addressParts.length > 1 ? addressParts[1] : "");
            model.addAttribute("address3", addressParts.length > 2 ? addressParts[2] : "");
    	    
        }
	    
	    return "cart/checkout";  // 결제 페이지로 이동
	}

	//무통장입금
	@PostMapping("/processCheckout")
	public String processCheckout(
	        @RequestParam("productId") List<Integer> productIds,
	        @RequestParam("quantity") List<Integer> quantities,
	        @RequestParam("totalPrice") List<Integer> totalPrices,
	        @RequestParam("totalOrderAmount") int totalOrderAmount,
	        @RequestParam(value = "shippingFee", defaultValue = "0") int shippingFee,
	        @RequestParam(value = "pointDiscount", defaultValue = "0") int pointDiscount,
	        @RequestParam(value = "userCouponId", required = false) Integer userCouponId,
	        @RequestParam(value = "couponDiscount", defaultValue = "0") int couponDiscount,
	        @RequestParam("receiverName") String receiverName,
	        @RequestParam("receiverPhone") String receiverPhone,
	        @RequestParam("receiverPostnum") String postNum,
	        @RequestParam("address1") String address1,
	        @RequestParam("address2") String address2,
	        @RequestParam("address3") String address3,
	        HttpSession session, Model model) {

	    System.out.println("userCouponId: " + userCouponId); // 디버깅용 출력

	    UserVO userVO = (UserVO) session.getAttribute("userVO");
	    if (userVO == null) {
	        return "redirect:/login";
	    }

	    String address = address1 + ", " + address2 + ", " + address3;

	    // CheckoutService를 사용하여 주문 처리
	    checkoutService.processCheckout(productIds, quantities, totalPrices, totalOrderAmount, shippingFee,
	                                    pointDiscount, userCouponId, couponDiscount, 
	                                    userVO, receiverName, receiverPhone, postNum, address);

	    return "/cart/checkout_end"; // 주문 성공 페이지로 리디렉션
	}
}