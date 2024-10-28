package com.omiyami.shop.admin.vo;

import java.time.LocalDateTime;

public class AdminMemberVO {
	   private Long memberNo;      // user_id에 매핑
	    private String userId;      // username에 매핑
	    private String name;        // name에 매핑
	    private String phone;       // phone에 매핑
	    private String email;       // email에 매핑
	    private String address;     // post_num + address에 매핑
	    private String memberStatus;// status에 매핑
	 // Getters and Setters
	    public Long getMemberNo() {
	        return memberNo;
	    }

	    public void setMemberNo(Long memberNo) {
	        this.memberNo = memberNo;
	    }

	    public String getUserId() {
	        return userId;
	    }

	    public void setUserId(String userId) {
	        this.userId = userId;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getPhone() {
	        return phone;
	    }

	    public void setPhone(String phone) {
	        this.phone = phone;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getAddress() {
	        return address;
	    }

	    public void setAddress(String address) {
	        this.address = address;
	    }

	    public String getMemberStatus() {
	        return memberStatus;
	    }

	    public void setMemberStatus(String memberStatus) {
	        this.memberStatus = memberStatus;
	    }
}
