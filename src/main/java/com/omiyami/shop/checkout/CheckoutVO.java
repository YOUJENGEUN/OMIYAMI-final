package com.omiyami.shop.checkout;

public class CheckoutVO {

	private int productId;
    private int quantity;
    private int totalPrice;
    
	public int getProductId() {
		return productId;
	}
	
	public CheckoutVO(int productId, int quantity, int totalPrice) {
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}
