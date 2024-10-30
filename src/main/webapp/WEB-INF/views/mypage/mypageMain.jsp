<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
          <!-- content -->
          <div class="col-10">
          
            <div class="user-check">
              <div class="user-check-name">
                <div><span style="font-weight: 600">${userVO.name}</span> 님</div>
              </div>

              <div class="user-check-item">
                <div>주문 / 취소</div>
                <span style="font-weight: 600">${orderCount} / ${cancelCount}</span>
              </div>

              <div class="user-check-item">
                <div>포인트</div>
                <span style="font-weight: 600">${availablePoints}P</span>
              </div>

              <div class="user-check-item">
                <div>쿠폰</div>
                <span style="font-weight: 600">${couponCount}개</span>
              </div>
            </div>


            <div class="text-left mt-4">주문처리 근황</div>
            <hr style="border: 1px solid var(--gray600); opacity: 1" />
            <div class="uorder-check kr-600">
			    <div class="uorder-check-item ${latestOrderStatus == '결제예정' ? 'highlight' : ''}">
			        <div>결제예정</div>
			    </div>
			    <i class="fa-solid fa-greater-than" style="color: var(--gray600)"></i>
			    <div class="uorder-check-item ${latestOrderStatus == '결제완료' ? 'highlight' : ''}">
			        <div>결제완료</div>
			    </div>
			    <i class="fa-solid fa-greater-than" style="color: var(--gray600)"></i>
			    <div class="uorder-check-item ${latestOrderStatus == '상품준비중' ? 'highlight' : ''}">
			        <div>상품준비중</div>
			    </div>
			    <i class="fa-solid fa-greater-than" style="color: var(--gray600)"></i>
			    <div class="uorder-check-item ${latestOrderStatus == '배송중' ? 'highlight' : ''}">
			        <div>배송중</div>
			    </div>
			    <i class="fa-solid fa-greater-than" style="color: var(--gray600)"></i>
			    <div class="uorder-check-item ${latestOrderStatus == '배송완료' ? 'highlight' : ''}">
			        <div>배송완료</div>
			    </div>
			</div>

            <br /><br />

            <div class="text-left mt-4">최근 주문상품</div>
            <hr style="border: 1px solid var(--gray600); opacity: 1" />

            <div class="order-container" style="margin-bottom:100px;">
              <table class="order-table">
                  <tr>
                    <td class="table-title">주문날짜</td>
                    <td class="table-title">주문번호</td>
                    <td class="table-title">상품정보</td>
                    <td class="table-title">수량</td>
                    <td class="table-title">주문금액</td>
                    <td class="table-title">주문상태</td>
                  </tr>

                  <!-- product data -->
                 <c:forEach var="order" items="${recentOrders}">
			        <tr>
			        	<td valign="middle" style="text-align: center">
			        		<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd" />	
			        	</td>
			            <td valign="middle">
			                <div style="text-align:center;text-decoration:underline;cursor:pointer;" 
			                onclick="location.href='/orderdetail?orderId=${order.orderId}'">
			                    ${order.orderNum}
			                </div>
			            </td>
			            <td>
			                <div class="product-info">
			                    <div class="product-image">
			                    	<img src="${order.imgUrl}" onclick="location.href='/product/${order.productId}'">
			                    </div>
			                    <div class="ms-2">
			                        <p class="mb-1 table-sub" valign="middle">${order.brandName}</p>
			                        <p class="mb-1 table-sub" valign="middle">${order.productName}</p>
			                        <p class="mb-1 table-sub" valign="middle">${order.productOption}</p>
			                    </div>
			                </div>
			            </td>
			            <td valign="middle">
			                <div style="text-align: center">${order.productOrderQuantity}</div>
			            </td>
			            <td valign="middle">
			                <div style="text-align: center">
			                	<fmt:formatNumber value="${order.productOrderPrice}"/>
			                </div>
			            </td>
			            <td valign="middle">
			                <div style="text-align: center">${order.orderStatus}</div>
			            </td>
			        </tr>
			    </c:forEach>
              </table>
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
