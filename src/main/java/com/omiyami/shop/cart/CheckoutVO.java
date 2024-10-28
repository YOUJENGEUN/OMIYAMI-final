package com.omiyami.shop.cart;

public class CheckoutVO {

	private int productId;
    private int quantity;
    private double totalPrice;
    
	public int getProductId() {
		return productId;
	}
	
	public CheckoutVO(int productId, int quantity, double totalPrice) {
		this.productId = productId;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}
	
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
    
    
    
}
