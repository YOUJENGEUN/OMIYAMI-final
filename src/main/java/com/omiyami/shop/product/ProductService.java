package com.omiyami.shop.product;

import java.util.List;

import com.omiyami.shop.product.review.ReviewVO;

public interface ProductService {

	//header 검색
	List<ProductVO> getSearchResult(String searchKeyword, int limit, int offset);
	int getSearchResultCount(String searchKeyword);
	
	//메인
	List<ProductVO> getMainNewProducts();
	List<ProductVO> getMainBestProducts();
	
	//지역별리스트&페이징
	int getProductsCount(int area, List<String> categories);
	List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset);
	
	//상세페이지&해당카테고리내추천
	void insertProductClickLog(int productId);
	ProductVO getProductDetailById(int product_id);
	List<ProductVO> getProductImagesById(int product_id);
	List<ProductVO> getRecommendsByCategory(int product_id);
	List<ReviewVO> getReviewsByProductId(int product_id);
	
	//장바구니추천
	List<ProductVO> getRecommendsForCart();
	
	List<ProductVO> getAllProducts(); // 전체 상품 조회
	List<ProductVO> getAvailableProducts(); // 판매중 상품 조회
    List<ProductVO> getStoppedProducts(); // 판매중지 상품 조회
    List<ProductVO> getOutOfStockProducts(); // 품절 상품 조회
    void updateProductsStatusToStopped(int productId); // 상품 삭제
    
    ProductVO getProductForUpdateById(int productId); // 상품 수정용 데이터 조회
    void updateProduct(ProductVO product); // 상품 수정
    
    void insertProduct(ProductVO product); // 상품 등록
	
	
//	void insertProduct(ProductVO product);
//	void updateProduct(ProductVO product);
//	void deleteProduct(int productId);
//	
}