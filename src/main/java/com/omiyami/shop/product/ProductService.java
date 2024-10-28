package com.omiyami.shop.product;

import java.util.List;

public interface ProductService {

	List<ProductVO> getSearchResult(String searchKeyword, int limit, int offset);
	int getSearchResultCount(String searchKeyword);
	
	List<ProductVO> getMainNewProducts();
	List<ProductVO> getMainBestProducts();
	
	int getProductsCount(int area, List<String> categories);
	List<ProductVO> getProductsByArea(int area, List<String> categories, String sortOption, int limit, int offset);
	
	void insertProductClickLog(int productId);
	ProductVO getProductDetailById(int product_id);
	List<ProductVO> getProductImagesById(int product_id);
	List<ProductVO> getRecommendeds(int product_id);
	
	
	
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