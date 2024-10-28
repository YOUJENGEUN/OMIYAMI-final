package com.omiyami.shop.order;

public class PaymentDetailVO {

	private int paymentId;
	private int orderId;
	private int userId;
	private int points;
	private int paymentPrice;
	private String paymentMethod;

	private int userCouponId;
	private int couponValue;
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
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
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
	public int getUserCouponId() {
		return userCouponId;
	}
	public void setUserCouponId(int userCouponId) {
		this.userCouponId = userCouponId;
	}
	public int getCouponValue() {
		return couponValue;
	}
	public void setCouponValue(int couponValue) {
		this.couponValue = couponValue;
	}
	
	
	
}
