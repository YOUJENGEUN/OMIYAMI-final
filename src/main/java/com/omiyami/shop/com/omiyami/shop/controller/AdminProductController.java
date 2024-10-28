package com.omiyami.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.omiyami.shop.product.ProductService;
import com.omiyami.shop.product.ProductVO;

@Controller

public class AdminProductController {

    @Autowired
    private ProductService productService;

    // 상품 목록 페이지
    @GetMapping("/Product-main")
    public String productMain(
        @RequestParam(value = "status", defaultValue = "all") String status,
        @RequestParam(value = "page", defaultValue = "1") int currentPage,
        Model model) {
        List<ProductVO> allProductList = productService.getAllProducts();
        List<ProductVO> availableProductList = productService.getAvailableProducts();
        List<ProductVO> stoppedProductList = productService.getStoppedProducts();
        List<ProductVO> outOfStockProductList = productService.getOutOfStockProducts();
        
        List<ProductVO> productList;
        
        switch (status) {
            case "soldout":
                productList = outOfStockProductList;
                break;
            case "on":
                productList = availableProductList;
                break;
            case "out":
                productList = stoppedProductList;
                break;
            default:
                productList = allProductList;
                break;
        }

        int limit = 10;
        int totalProducts = productList.size();
        int totalPages = (int) Math.ceil((double) totalProducts / limit);
        currentPage = Math.max(1, Math.min(currentPage, totalPages));
        int offset = (currentPage - 1) * limit;

        List<ProductVO> paginatedProducts = productList.stream()
                .skip(offset)
                .limit(limit)
                .collect(Collectors.toList());

        model.addAttribute("allProducts", allProductList.size());
        model.addAttribute("availableProducts", availableProductList.size());
        model.addAttribute("stoppedProducts", stoppedProductList.size());
        model.addAttribute("outOfStockProducts", outOfStockProductList.size());
        model.addAttribute("products", paginatedProducts);
        model.addAttribute("selectedStatus", status);
        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startPage", Math.max(1, currentPage - 2));
        model.addAttribute("endPage", Math.min(totalPages, currentPage + 2));
        model.addAttribute("previousPage", currentPage - 1);
        model.addAttribute("nextPage", currentPage + 1);
        
        return "admin/Product-main";
    }

    // 상품 등록 폼
    @GetMapping("/Product-form")
    public String productForm(Model model) {
        model.addAttribute("productVO", new ProductVO());
        return "admin/Product-form";
    }

    // 상품 등록 처리
    @PostMapping("/Product-form")
    public String createProduct(@ModelAttribute ProductVO productVO) {
        productService.insertProduct(productVO);
        return "redirect:/product-main";  // 리다이렉트 경로 수정
    }

    // 상품 수정 폼
    @GetMapping("/Product-form-modify/{productId}")
    public String productFormModify(@PathVariable int productId, Model model) {
        ProductVO product = productService.getProductForUpdateById(productId);
        model.addAttribute("productVO", product);
        return "admin/product-form-modify";
    }

    // 상품 수정 처리
    @PostMapping("/Product-form-modify")
    public String modifyProduct(@ModelAttribute ProductVO productVO) {
        productService.updateProduct(productVO);
        return "redirect:/product-main";  // 리다이렉트 경로 수정
    }

    // 판매 중지 처리
    @PostMapping("/Product-main")
    public ResponseEntity<Map<String, String>> stopSellingProducts(@RequestBody List<Integer> productIds) {
        Map<String, String> response = new HashMap<>();
        
        try {
            for (int productId : productIds) {
                productService.updateProductsStatusToStopped(productId);
            }
            response.put("message", "판매 중지 처리 완료");
            
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("error", "판매 중지 처리 중 오류 발생");
            
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
}