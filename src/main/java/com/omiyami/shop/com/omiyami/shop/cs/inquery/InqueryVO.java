package com.omiyami.shop.cs.inquery;

import java.sql.Timestamp;

public class InqueryVO {
	
	private int inquery_id;
	private int order_id;
    private int user_id;
    private String category;  
    private String title;
    private String content;
    private String email;
    private Timestamp write_date;
    private String status;
    private String answer_content;
    private Timestamp answer_date;
    
	public int getInquery_id() {
		return inquery_id;
	}
	public void setInquery_id(int inquery_id) {
		this.inquery_id = inquery_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAnswer_content() {
		return answer_content;
	}
	public void setAnswer_content(String answer_content) {
		this.answer_content = answer_content;
	}
	public Timestamp getAnswer_date() {
		return answer_date;
	}
	public void setAnswer_date(Timestamp answer_date) {
		this.answer_date = answer_date;
	}
    
    

}
