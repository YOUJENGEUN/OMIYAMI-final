package com.omiyami.shop.order;

import java.sql.Timestamp;

public class OrderDetailVO {

	private int orderId;                  // 주문 ID
    private int orderNum;                 // 주문 번호
    private Timestamp orderDate;          // 주문 날짜
    private int orderTotalPrice;          // 주문 총 금액
    private String productId;              // 상품 ID
    private String orderStatus;            // 주문 상태
    private String productName;            // 상품 이름
    private String brandName;              // 브랜드 이름
    private String productOption;          // 상품 옵션
    private int productOrderQuantity;      // 상품 주문 수량
    private int productOrderPrice;         // 상품 주문 가격 (op.quantity * p.price)
    private String imgUrl;                 // 제품 이미지 URL
	
	private String receiverName;
	private String receiverPhone;
	private String receiverPostnum;
	private String receiverAddress;
    
    
    public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public Timestamp getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}
	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}
	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getProductOption() {
		return productOption;
	}
	public void setProductOption(String productOption) {
		this.productOption = productOption;
	}
	public int getProductOrderQuantity() {
		return productOrderQuantity;
	}
	public void setProductOrderQuantity(int productOrderQuantity) {
		this.productOrderQuantity = productOrderQuantity;
	}
	public int getProductOrderPrice() {
		return productOrderPrice;
	}
	public void setProductOrderPrice(int productOrderPrice) {
		this.productOrderPrice = productOrderPrice;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverPhone() {
		return receiverPhone;
	}
	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}
	public String getReceiverPostnum() {
		return receiverPostnum;
	}
	public void setReceiverPostnum(String receiverPostnum) {
		this.receiverPostnum = receiverPostnum;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}

	
	
	
    


}
