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
  <link href="${pageContext.request.contextPath}/resources/css/style/mypageMain.css" rel="stylesheet" />

  <script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>

 
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <title>OMIYAMI</title>
  </head>

  <body style="background-color: var(--truegray50)">
  <!-- scroll up  -->
  <div class="scroll-top" id="scrollUp">
    <i class="fa-solid fa-cloud kr-700" style="font-size: var(--size900); color: var(--indigo100)"></i>
    <i class="fa-solid fa-plane-up kr-700" style="font-size: var(--size900); color: var(--rose300)"></i>
  </div>

  <!-- header include -->
  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  
   <div class="mypage-wrapper my-5">
      <div class="container mt-5">
        <div class="section-title-in kr-700" style="font-size: var(--size800)">마이페이지</div>
        <hr style="border: 1px solid var(--gray900);transform: scaleY(1.1);opacity: 1;"/>

        <div class="row">
        <!-- sidebar include  -->
		<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

          <!-- content start -->
          <div class="col-10">
            <div class="text-left mt-1">주문정보</div>
            <hr style="border: 1px solid var(--gray600);opacity: 1;margin-top: 5px;"/>

            <table>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">주문번호</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">${order.orderNum}</div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">주문일자</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">
                  	<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" />            
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">주문자</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">${sessionScope.userVO.name}</div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">주문처리상태</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">${order.orderStatus}</div>
                </td>
              </tr>
            </table>

            <div class="text-left mt-4">주문상품</div>
            <hr style="border: 1px solid var(--gray600);opacity: 1;margin: 5px 0;" />
            <table class="order-table">
              <thead>
                <tr>
                  <td class="table-title">상품정보</td>
                  <td class="table-title">수량</td>
                  <td class="table-title">주문금액</td>
                  <td class="table-title">주문상태</td>
                </tr>
              </thead>
              <tbody>
                <!-- product data -->
                <c:forEach var="product" items="${orderProduct}">
                <tr>
                  <td>
                    <div class="product-info">
                      <div class="product-image">
                      	<img src="${product.imgUrl}" onclick="location.href='/product/${product.productId}'">
                      </div>
                      <div class="ms-2">
                        <p class="mb-1 table-sub" valign="middle">${product.brandName}</p>
                        <p class="mb-1 table-sub" valign="middle">${product.productName}</p>
                        <p class="mb-1 table-sub" valign="middle">${product.productOption}</p>
                      </div>
                    </div>
                  </td>

                  <td valign="middle">
                    <div>${product.productOrderQuantity}</div>
                  </td>

                  <td valign="middle">
                    <div>
                    	<fmt:formatNumber value="${product.productOrderPrice}"/>
                    </div>
                  </td>

                  <td valign="middle">
                    <div>${product.orderStatus}</div>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>

            <div class="text-left mt-4">결제정보</div>
            <hr style="border: 1px solid var(--gray600);opacity: 1;margin-top: 5px;"/>
            <table>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">총 주문 금액</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">
                  	<fmt:formatNumber value="${order.orderTotalPrice}"/>원
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">할인 혜택</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">쿠폰</div>
                </td>
                <td>
                  <div class="mb-2">
                    <span style="color: var(--error)">&#40;-&#41; ${payment.couponDiscount}</span>원
                  </div>
                </td>
              </tr>

              <tr>
                <td></td>
                <td>
                  <div class="ms-5 mb-2">포인트</div>
                </td>
                <td>
                  <div class="mb-2">
                    <span style="color: var(--error)">&#40;-&#41; ${payment.pointDiscount}</span>원
                  </div>
                </td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <div class="ms-5 mb-2">총 할인</div>
                </td>
                <td>
                  <div class="mb-2">
                  	<c:set var="totalValue" value="${payment.couponDiscount + payment.pointDiscount}"/>
                    <span style="color: var(--error)">&#40;-&#41; ${totalValue}</span>원
                  </div>
                </td>
              </tr>

              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">총 결제 금액</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">
                  	<fmt:formatNumber value="${payment.paymentPrice}"/>원
                  </div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">결제 수단</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">${payment.paymentMethod}</div>
                </td>
              </tr>

              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">적립 포인트</div>
                </td>
                <td>
                  <c:set var="pendingPoint" value="${payment.paymentPrice *0.01}"/>
                  <div class="ms-5 mb-2">${pendingPoint}원</div>
                </td>
              </tr>
            </table>

            <div class="text-left mt-4">배송정보</div>
            <hr style="border: 1px solid var(--gray600);opacity: 1;margin-top: 5px;"/>
            <table>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">받으시는 분</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">${order.receiverName}</div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">우편번호</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">${order.receiverPostnum}</div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">주소</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">${order.address.replace(',', '')}</div>
                </td>
              </tr>
              <tr>
                <td>
                  <div class="mb-2 table-title" style="text-align: left">연락처</div>
                </td>
                <td>
                  <div class="ms-5 mb-2">${order.receiverPhone}</div>
                </td>
              </tr>
            </table>
            <div style="margin-bottom: 100px">
              <button class="login btn-pro mx-auto" onclick="location.href='/orderList'">돌아가기</button>
          </div>
          </div>

          
        </div>
      </div>
    </div>
    <!-- content end -->

    <!-- footer include -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>

  </body>
</html>