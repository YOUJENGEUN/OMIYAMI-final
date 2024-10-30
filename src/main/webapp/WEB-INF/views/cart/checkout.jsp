<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <meta property="og:type" content="website" />
    <meta property="og:url" content="" />
    <meta property="og:site_name" content="OMIYAMI" />
    <meta property="og:title" content="OMIYAMI" />
    <meta property="og:image" content="img/logo/logo1.png" />
    <meta property="og:image:width" content="1200" />
    <meta property="og:image:height" content="630" />
    
	<link href="${pageContext.request.contextPath}/resources/img/logo/logo1.png" rel="icon" />
	<link href="${pageContext.request.contextPath}/resources/css/style/main.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/fonts/fonts.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/variables/colors.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/variables/round.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/style/btn.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/style/cart.css" rel="stylesheet" />

	<script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	  crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  	<script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/zipcode.js"></script>
	
	<title>OMIYAMI</title>
</head>
<body style="background-color: var(--trueGray50)">
  <!-- scroll up  -->
  <div class="scroll-top" id="scrollUp">
    <i class="fa-solid fa-cloud kr-700" style="font-size: var(--size900); color: var(--indigo100)"></i>
    <i class="fa-solid fa-plane-up kr-700" style="font-size: var(--size900); color: var(--rose300)"></i>
  </div>

    <!-- header include -->
  	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<!-- CHECKOUT START-->
    <div class="cart-wrapper">
    <form action="/processCheckout" method="post">
      <div class="checkout-container">
        <div class="checkout-top">
          <!-- 타이틀 -->
          <div class="checkout-top-title">
            <span>결제</span>
          </div>
          <!-- 주문상태 -->
          <div class="cart-top-breadcrumb">
			 장바구니 > <span class="kr-800" style="color: var(--gray900)">결제</span> > 주문완료
          </div>
        </div>

        
        <div class="checkout-left">
          <!-- 타이틀 -->
          <div class="checkout-title">주문 정보</div>
          <!-- 주문정보 -->
          <div class="checkout-infos">
            <div class="buyer-info">
              <div class="info-title kr-600">주문자 정보</div>
              <table>
                <tr>
                  <td>이름</td>
                  <td width="600px">
                    <input id="username" name="username" value="${user.name}" type="text" class="form-control-add ms-4 mb-3" style="width: 250px"/>
                  </td>
                </tr>
                <tr>
                  <td>이메일</td>
                  <td>
                    <input id="email" name="email" value="${user.email}" type="email" class="form-control-add ms-4 mb-3" style="width: 250px"/>
                  </td>
                </tr>
                <tr>
                  <td width="200px">전화번호</td>
                  <td>
                    <input id="phone" name="phone" value="${user.phone}" class="form-control-add ms-4 mb-3" type="text" style="width: 250px"/>
                  </td>
                </tr>

                <tr>
                  <td>우편번호</td>
                  <td>
                    <input name="post_num" id="sample6_postcode1" value="${user.post_num}" class="form-control-add ms-4 mb-3" type="text" 
						placeholder="우편번호" style="width: 150px"/>
                    <input class="btn"
                      style="background: #d1d5db50;font-size: 13.5px;margin-left: 3px;"
                      type="button"
                      onclick="searchZipcode1()"
                      value="우편번호찾기"/>
                  </td>
                </tr>

                <tr>
                  <td>주소</td>
                  <td class="address">
                    <input id="sample6_address1"
                      type="text" value="${address1}"
                      class="form-control-add ms-4"
                      style="width: 265px; margin-right: 10px"
                    />
                    <input id="sample6_extraAddress1"
                      type="text" value="${address2}"
                      class="form-control-add mb-2"
                      placeholder="(비고)"
                      style="width: 120px"
                    />
                    <input id="sample6_detailAddress1"
                      type="text" value="${address3}"
                      class="form-control-add ms-4"
                      placeholder="상세주소"
                      style="width: 400px"
                    />
                  </td>
                </tr>
              </table>
            </div>

            <hr />

            <div class="delivery-info">
              <div class="info-title kr-600">수령인 정보
                <div class="same-info">
                  <input type="checkbox" id="sameInfo" onclick="" />
                  <label for="sameInfo">주문자 정보와 동일</label>
                </div>
              </div>
              <table>
                <tr>
                  <td>이름</td>
                  <td width="600px">
                    <input name="receiverName" id="receiverName"
                      class="form-control-add ms-4 mb-3"
                      type="text"
                      style="width: 250px"
                    />
                  </td>
                </tr>

                <tr>
                  <td width="200px">전화번호</td>
                  <td>
                    <input name="receiverPhone" id="receiverPhone"
                      class="form-control-add ms-4 mb-3"
                      type="text"
                      style="width: 250px"
                    />
                  </td>
                </tr>
                <tr>
                  <td>우편번호</td>
                  <td>
                    <input name="receiverPostnum" id="sample6_postcode2"
                      class="form-control-add ms-4 mb-3"
                      type="text"
                      placeholder="우편번호"
                      style="width: 150px"
                    />
                    <input
                      class="btn"
                      style="
                        background: #d1d5db50;
                        font-size: 13.5px;
                        margin-left: 3px;
                      "
                      type="button"
                      onclick="searchZipcode2()"
                      value="우편번호찾기"
                    />
                  </td>
                </tr>

                <tr>
                  <td>주소</td>
                  <td class="address">
                    <input name="address1" id="sample6_address2"
                      type="text"
                      class="form-control-add ms-4"
                      style="width: 265px; margin-right: 10px"
                    />
                    <input name="address2" id="sample6_extraAddress2"
                      type="text"
                      class="form-control-add mb-2"
                      placeholder="(비고)"
                      style="width: 120px"
                    />
                    <input name="address3" id="sample6_detailAddress2"
                      type="text"
                      class="form-control-add ms-4"
                      placeholder="상세주소"
                      style="width: 400px"
                    />
                  </td>
                </tr>
                <tr>
                  <td>배송메모</td>
                  <td>
                    <input
                      type="text"
                      class="form-control-add ms-4"
                      placeholder="예시&rpar; 부재시 경비실에 맡겨주세요"
                      style="width: 400px"
                    />
                  </td>
                </tr>
              </table>
            </div>

            <hr />

            <div class="discount-info">
              <span class="info-title kr-600">할인 적용</span>
              <div class="discount-coupon">
                <div style="width: 130px">쿠폰</div>
				    <div class="selectBox">
				        <select class="select" name="userCouponId" id="coupon-select" style="width:250px;">
						    <option value="" data-discount="0">보유 쿠폰 선택</option>
						    <c:forEach var="coupon" items="${userCoupons}">
						        <option value="${coupon.user_coupon_id}" data-discount="${coupon.value}">
						            ${coupon.name} - ${coupon.value}원 할인
						        </option>
						    </c:forEach>
						</select>
				        <span class="icoArrow">
				        <img src="${pageContext.request.contextPath}/resources/img/icon/sort-down-solid.svg" alt=""/></span>
				    </div>
              </div>
              <div class="discount-point">
                <div style="width: 130px">포인트</div>
                <div class="set-point">
                  <input type="text" class="form-control-add-p" width="100px"/>&nbsp;
                  <input type="button" value="적용" class="btn" style="background: #d1d5db50;font-size: 13.5px;margin-left: 3px;"/>&nbsp;
                  <div style="font-size: 13px; margin-left: 10px">
                    (보유 포인트 : <span>${currentBalance}</span>)
                  </div>
                </div>
              </div>
            </div>

            <hr />

            <div class="pay-info">
              <div class="info-title">결제 수단</div>
              <div class="payments">
                <div class="payment">신용카드</div>
                <div class="payment">무통장입금</div>
                <div class="payment">간편결제</div>
              </div>
            </div>
            <div class="pay-alert" style="margin-bottom:100px;">
              <span style="font-weight: 600; font-size: 14px">주문 전 확인하세요!</span>
              <p class="text-box">
				실제 결제 금액에 따라 적립 포인트는 변경될 수 있습니다.<br />
				포인트와 쿠폰 사용시 유효 기간을 꼭 확인해 주시고, 무통장 결제일 경우 유효기간 내에 입금해주셔야 합니다<br />
				(유효기간이 지난 경우, 입금 불가)<br />
				결제 완료 이후 품절/결품이 발생한 경우, 메일을 통해 안내드리고 있으며,<br />
				 마이페이지에서도 품절/결품 여부를 확인하실 수 있습니다.
              </p>
            </div>
            
          </div>
          <!-- 주문정보 END -->
        </div>

        <div class="checkout-right">
          <!-- 타이틀 -->
          <div class="price-summaries-top">결제 정보</div>
          <!-- 결제정보/주문버튼 -->
          <div class="price-summaries">
            <ul class="price-summary-list">
              <li class="price-summary">
                <span>주문 금액</span>
                <span class="kr-600" id="total-order-amount">
                	<fmt:formatNumber value="${totalOrderAmount}" type="number" groupingUsed="true"/>원
                </span>
               	<input type="hidden" name="totalOrderAmount" id="totalOrderAmountHidden" value="${totalOrderAmount}" />
              </li>
              <li class="price-summary">
                <span>포인트 할인</span>
                <span class="discount-price kr-600" id="point-discount">0원</span>
                <input type="hidden" name="pointDiscount" id="pointDiscountHidden" value="0" />
              </li>
              <li class="price-summary">
                <span>쿠폰 할인</span>
                <span class="discount-price kr-600" id="coupon-discount">0원</span>
                <input type="hidden" name="couponDiscount" id="couponDiscountHidden" value="0" />
              </li>
              <li class="price-summary">
                <span>배송비</span>
                <span class="kr-600" id="shipping-fee">
                	<fmt:formatNumber value="${shippingFee}" type="number" groupingUsed="true"/>원
                </span>
                <input type="hidden" name="shippingFee" id="shippingFeeHidden" value="${shippingFee}" />
              </li>
              <hr/>
              <li class="price-summary total-price">
                <span>총 결제 금액</span>
                <span id="final-payment-amount">0원</span>
                <input type="hidden" name="finalPaymentAmount" id="finalPaymentAmountHidden" value="0" />
              </li>
            </ul>
		
    		
            <div class="checkout-agree">
              <div style="margin-bottom: 10px">
			                주문할 상품의 상품명, 상품 가격, 배송 정보를
			                확인하였으며,구매에동의하시겠습니까? (전자상거래법 제8조 제2항)
              </div>
            </div>
            <div class="checkout-agree1">
              <input type="checkbox" id="agreebtn" />
              <label for="agreebtn" class="agree-text">동의하기</label>
            </div>

            <div class="checkout-submit">
			    <c:forEach var="item" items="${checkoutItems}">
			        <input type="hidden" name="productId" value="${item.productId}">
			        <input type="hidden" name="quantity" value="${item.quantity}">
			        <input type="hidden" name="totalPrice" value="${item.totalPrice}">
			    </c:forEach>			    
				<!-- 수령인 정보 추가 -->
		        
			    <button type="submit" class="checkout-btn">결제하기</button>
    		</div>
          </div>
          <div class="to-cart">
			<a href="/cart/view">장바구니로 돌아가기</a>
          </div>

          </div>

          <!-- 결제정보/주문버튼 END-->
        </div>
          </form>
      </div>
      <!--CHECKOUT END-->
    
	<!-- footer include -->
  	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script>
document.getElementById('sameInfo').addEventListener('change', function() {
    if (this.checked) {
        // 주문자 정보에서 값을 가져와서 수령인 정보로 복사
        document.getElementById('receiverName').value = document.querySelector('input[name="username"]').value;
        document.getElementById('receiverPhone').value = document.querySelector('input[name="phone"]').value;
        document.getElementById('sample6_postcode2').value = document.getElementById('sample6_postcode1').value;
        document.getElementById('sample6_address2').value = document.getElementById('sample6_address1').value;
        document.getElementById('sample6_extraAddress2').value = document.getElementById('sample6_extraAddress1').value;
        document.getElementById('sample6_detailAddress2').value = document.getElementById('sample6_detailAddress1').value;
    } else {
        // 수령인 정보 초기화
        document.getElementById('receiverName').value = '';
        document.getElementById('receiverPhone').value = '';
        document.getElementById('sample6_postcode2').value = '';
        document.getElementById('sample6_address2').value = '';
        document.getElementById('sample6_extraAddress2').value = '';
        document.getElementById('sample6_detailAddress2').value = '';
    }
});

  document.getElementById("coupon-select").addEventListener("change", function() {
    const selectedOption = this.options[this.selectedIndex];
    const discountValue = parseInt(selectedOption.getAttribute("data-discount")) || 0; // 할인 금액을 정수로 변환
    document.getElementById("coupon-discount").innerText = discountValue.toLocaleString() + "원"; // 천 단위로 표시
  });
</script>
<script>
//초기 설정된 주문 금액과 배송비
let orderAmount = parseInt(document.getElementById("total-order-amount").innerText.replace(/[^0-9]/g, "")) || 0;
let shippingFee = parseInt(document.getElementById("shipping-fee").innerText.replace(/[^0-9]/g, "")) || 0;

//금액 업데이트 및 hidden 필드 동기화 함수
function updateAmounts() {
 const pointDiscount = parseInt(document.getElementById("point-discount").innerText.replace(/[^0-9]/g, "")) || 0;
 const couponDiscount = parseInt(document.getElementById("coupon-discount").innerText.replace(/[^0-9]/g, "")) || 0;

 const finalAmount = orderAmount - pointDiscount - couponDiscount + shippingFee;
 document.getElementById("final-payment-amount").innerText = finalAmount.toLocaleString() + "원";

 // hidden 필드 동기화
 document.getElementById("totalOrderAmountHidden").value = orderAmount;
 document.getElementById("pointDiscountHidden").value = pointDiscount;
 document.getElementById("couponDiscountHidden").value = couponDiscount;
 document.getElementById("shippingFeeHidden").value = shippingFee;
 document.getElementById("finalPaymentAmountHidden").value = finalAmount;
}

//페이지 로드 시 초기 금액 설정
document.addEventListener("DOMContentLoaded", function() {
 updateAmounts();

 // 쿠폰 및 포인트 입력 변경 시 금액 업데이트
 document.getElementById("coupon-select").addEventListener("change", function() {
     const selectedOption = this.options[this.selectedIndex];
     document.getElementById("coupon-discount").innerText = (parseInt(selectedOption.getAttribute("data-discount")) || 0).toLocaleString() + "원";
     updateAmounts();
 });

 document.querySelector(".set-point input[type='text']").addEventListener("input", function() {
     document.getElementById("point-discount").innerText = (parseInt(this.value) || 0).toLocaleString() + "원";
     updateAmounts();
 });

// submit 리스너 등록
document.querySelector("form").addEventListener("submit", function(event) {
     if (!document.getElementById("agreebtn").checked) {
         alert("구매에 동의하셔야 결제가 가능합니다.");
         event.preventDefault(); 
     }
 });
});

function applyPointDiscount() {
    // 입력된 포인트 값 가져오기
    const pointInput = document.querySelector(".form-control-add-p");
    const pointValue = parseInt(pointInput.value) || 0; // 숫자로 변환, 입력이 없으면 0

    // 포인트 할인 영역 업데이트
    const discountDisplay = document.getElementById("point-discount");
    discountDisplay.textContent = pointValue.toLocaleString() + "원"; // 포맷 후 출력

    // 숨겨진 input에 값 설정
    const hiddenPointInput = document.getElementById("pointDiscountHidden");
    hiddenPointInput.value = pointValue;
  }

  // "적용" 버튼 클릭 시 applyPointDiscount 함수 실행
  document.querySelector(".set-point .btn").addEventListener("click", applyPointDiscount);
</script>
</body>
</html>