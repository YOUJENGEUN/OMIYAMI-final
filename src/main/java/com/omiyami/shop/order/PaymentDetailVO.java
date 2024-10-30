package com.omiyami.shop.order;

public class PaymentDetailVO {

	private int paymentId;
	private int orderId;
	private int userId;
	private int pointDiscount;
	private int paymentPrice;
	private String paymentMethod;

	private Integer userCouponId;
	private int couponDiscount;
	
	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getPointDiscount() {
		return pointDiscount;
	}
	public void setPointDiscount(int pointDiscount) {
		this.pointDiscount = pointDiscount;
	}
	public int getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(int paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public String getPaymentMethod() {
		return paymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	public Integer getUserCouponId() {
		return userCouponId;
	}
	public void setUserCouponId(Integer userCouponId) {
		this.userCouponId = userCouponId;
	}
	public int getCouponDiscount() {
		return couponDiscount;
	}
	public void setCouponDiscount(int couponDiscount) {
		this.couponDiscount = couponDiscount;
	}
}