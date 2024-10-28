package com.omiyami.shop.cs.notice;

import java.sql.Timestamp;

public class NoticeVO {

	private int notice_id;
	private String title;
	private String content;
	private Timestamp write_date;
	
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
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
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_Date) {
		this.write_date = write_Date;
	}
	
}
