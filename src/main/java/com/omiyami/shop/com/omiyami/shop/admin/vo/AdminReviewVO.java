package com.omiyami.shop.admin.vo;
import java.time.LocalDateTime;

public class AdminReviewVO {
    private Long userId;
    private Long productId;
    private String status;          // ENUM('만족', '불만족')
    private String content;
    private LocalDateTime writeDate;
    private String productName;     // JOIN 시 필요
    private String productImage;    // JOIN 시 필요
    private String writer;          // JOIN 시 필요 (user.name)

    // 기존 Getters and Setters
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getWriteDate() {
        return writeDate;
    }

    public void setWriteDate(LocalDateTime writeDate) {
        this.writeDate = writeDate;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    // 새로 추가된 getter/setter
    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }
}