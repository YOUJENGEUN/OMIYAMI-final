package com.omiyami.shop.product;

import java.util.List;

import com.omiyami.shop.product.review.ReviewVO;

public interface ProductDAO {

	//header 검색
	List<ProductVO> getSearchResult(String searchKeyword, int limit, int offset);
	int getSearchResultCount(String searchKeyword);
	
	//main
	List<ProductVO> getMainNewProducts();
	List<ProductVO> getMainBestProducts();
	
	//productList
	int getProductsCount(int area, List<String> categories);
	List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset);
	
	//product
	void insertProductClickLog(int product_id);
	ProductVO getProductDetailById(int product_id);
	List<ProductVO> getProductImagesById(int product_id);
	List<ProductVO> getRecommendsByCategory(int product_id);
	List<ReviewVO> getReviewsByProductId(int product_id);
	
	//cart
	public List<ProductVO> getRecommendsForCart();
	
	//admin product-main
		List<ProductVO> getAllProducts(); // 전체 상품 조회
		List<ProductVO> getAvailableProducts(); // 판매중 상품 조회
	    List<ProductVO> getStoppedProducts(); // 판매중지 상품 조회
	    List<ProductVO> getOutOfStockProducts(); // 품절 상품 조회
	    void updateProductsStatusToStopped(int productId); // 상품 삭제
	    
	    //admin product-modify
	    ProductVO getProductForUpdateById(int productId); // 상품 수정용 데이터 조회
	    void updateProduct(ProductVO product); // 상품 수정
	    
	    //admin product-form
	    void insertProduct(ProductVO product); // 상품 등록
	
//	
//	public void insertProduct(ProductVO vo);
//	public void updateProduct(ProductVO vo);
//	public void deleteProduct(int product_Id);
}
