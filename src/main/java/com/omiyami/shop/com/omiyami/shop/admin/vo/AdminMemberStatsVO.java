package com.omiyami.shop.admin.vo;

public class AdminMemberStatsVO {
	   private int newMemberCount;
	    private int withdrawnMemberCount;
	    private int totalMemberCount;

	    public int getNewMemberCount() {
	        return newMemberCount;
	    }

	    public void setNewMemberCount(int newMemberCount) {
	        this.newMemberCount = newMemberCount;
	    }

	    public int getWithdrawnMemberCount() {
	        return withdrawnMemberCount;
	    }

	    public void setWithdrawnMemberCount(int withdrawnMemberCount) {
	        this.withdrawnMemberCount = withdrawnMemberCount;
	    }

	    public int getTotalMemberCount() {
	        return totalMemberCount;
	    }

	    public void setTotalMemberCount(int totalMemberCount) {
	        this.totalMemberCount = totalMemberCount;
	    }}
