package com.omiyami.shop.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.omiyami.shop.cart.CheckoutVO;
import com.omiyami.shop.user.UserVO;
import com.omiyami.shop.user.coupon.UserCouponService;
import com.omiyami.shop.user.mypage.UserCouponVO;

@Controller
public class CheckoutController {

	@Autowired
	private UserCouponService userCouponService;
	
	
	@PostMapping("/checkout")
	public String showCheckoutPage(
            @RequestParam("product_id") List<Integer> productIds,
            @RequestParam("quantity") List<Integer> quantities,
            @RequestParam("total_price") List<Double> totalPrices,
            @RequestParam("total_order_amount") int totalOrderAmount,
            @RequestParam("shipping_fee") int shippingFee,
            @RequestParam("final_payment_amount") int finalPaymentAmount,
            @RequestParam("reward_point") int rewardPoint,
	        HttpSession session, Model model) {
	
		// 받은 데이터를 기반으로 결제 처리 로직을 추가
	    List<CheckoutVO> checkoutItems = new ArrayList<>();

	    
	    for (int i = 0; i < productIds.size(); i++) {
            CheckoutVO item = new CheckoutVO(productIds.get(i), quantities.get(i), 0.0);
            checkoutItems.add(item);
        }
	    
	    // 주문 금액과 기타 정보 모델에 추가
        model.addAttribute("checkoutItems", checkoutItems);
        model.addAttribute("totalOrderAmount", totalOrderAmount);
        model.addAttribute("shippingFee", shippingFee);
        model.addAttribute("finalPaymentAmount", finalPaymentAmount);
        //model.addAttribute("rewardPoint", rewardPoint);

        UserVO userVO = (UserVO) session.getAttribute("userVO");
        if (userVO != null) {
            model.addAttribute("user", userVO);
            
            List<UserCouponVO> userCoupons = userCouponService.getUserCoupons(userVO.getUser_id());
            model.addAttribute("userCoupons", userCoupons);
            
            String fullAddress = userVO.getAddress();
            String[] addressParts = fullAddress.split(", ");
            model.addAttribute("address1", addressParts.length > 0 ? addressParts[0] : "");
            model.addAttribute("address2", addressParts.length > 1 ? addressParts[1] : "");
            model.addAttribute("address3", addressParts.length > 2 ? addressParts[2] : "");
    	    
        }
	    
	    return "cart/checkout";  // 결제 페이지로 이동
	}

}
