package com.omiyami.shop.user.coupon;

import java.sql.Timestamp;

public class UserCouponVO {
	private int user_coupon_id;
	private int coupon_id;
	private String name;
	private String description;
	private int value;
	private Timestamp delete_date;
	
	public int getUser_coupon_id() {
		return user_coupon_id;
	}
	public void setUser_coupon_id(int user_coupon_id) {
		this.user_coupon_id = user_coupon_id;
	}
	public int getCoupon_id() {
		return coupon_id;
	}
	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	public Timestamp getDelete_date() {
		return delete_date;
	}
	public void setDelete_date(Timestamp delete_date) {
		this.delete_date = delete_date;
	}
	
}