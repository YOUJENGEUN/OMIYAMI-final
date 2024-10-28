package com.omiyami.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omiyami.shop.cart.CartService;
import com.omiyami.shop.cart.CartVO;
import com.omiyami.shop.product.ProductService;
import com.omiyami.shop.product.ProductVO;
import com.omiyami.shop.user.UserService;
import com.omiyami.shop.user.UserVO;

@Controller
public class CartController {

	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	UserService userService;
	
	@GetMapping("/cart/view")
	public String showCart(HttpSession session, Model model) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");

	    if (userVO == null) {
	        session.setAttribute("redirectUrl", "/cart/view");
	        return "redirect:/login";
	    }

	    List<CartVO> cartItems;
	    try {
	        // DB에서 카트 아이템 조회
	        cartItems = cartService.getCartItemsByUserId(userVO.getUser_id());
	        System.out.println("User ID: " + userVO.getUser_id());
	        System.out.println("Number of cart items: " + cartItems.size());

	        // 카트 아이템 로그
	        for (CartVO cartItem : cartItems) {
	            System.out.println("Cart Item Product ID: " + cartItem.getProductVO().getProduct_id());
	            System.out.println("Quantity: " + cartItem.getQuantity());
	        }
	    } catch (Exception e) {
	        System.err.println("Error fetching cart items: " + e.getMessage());
	        model.addAttribute("errorMessage", "장바구니 아이템을 불러오는 중 오류가 발생했습니다.");
	        return "main"; // 오류 페이지 또는 카트 페이지로 리턴
	    }

	    // 추천 상품 조회
	    List<ProductVO> cartRecommends = productService.getRecommendsForCart();

	    // 모델에 데이터 추가
	    model.addAttribute("cartItems", cartItems);
	    model.addAttribute("cartRecommends", cartRecommends);
	    model.addAttribute("user", userVO);

	    return "cart/cart"; // JSP 뷰 이름
	}
	
	@PostMapping("/cart/add")
    public String addToCart(@RequestParam("product_id") int product_id,
    						@RequestParam("quantity") int quantity,
    						HttpSession session, Model model) {
        UserVO userVO = (UserVO) session.getAttribute("userVO");

        if (userVO != null) {
            cartService.addToCart(userVO.getUser_id(), product_id, quantity);
            return "redirect:/cart/view";
        } else {
        	session.setAttribute("temp_product_id", product_id);
        	session.setAttribute("temp_quantity", quantity);
        	session.setAttribute("redirectUrl", "/cart/view");
            return "redirect:/login";
        }
    }

    @PostMapping("/cart/delete")
    public String deleteFromCart(@RequestParam("product_ids") List<Integer> productIds,
            					HttpSession session) {
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		if (userVO != null && productIds != null && !productIds.isEmpty()) {
			cartService.deleteCartItem(userVO.getUser_id(), productIds);
		}
		return "redirect:/cart/view";
}

    @PostMapping("/cart/update")
    @ResponseBody
    public ResponseEntity<String> updateCartQuantity(@RequestParam("product_id") int product_id,
                                                     @RequestParam("quantity") int quantity,
                                                     HttpSession session) {
        UserVO userVO = (UserVO) session.getAttribute("userVO");

        if (userVO == null) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("User not logged in");
        }

        int user_id = userVO.getUser_id();
        cartService.updateCartQuantity(user_id, product_id, quantity);
        return ResponseEntity.ok("Success");
    }
}