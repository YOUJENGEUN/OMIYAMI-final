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

          <!-- content start -->
          <div class="col-10">
            <div class="points-section">
              <div class="text-left mt-4">포인트</div>
              <hr style="border: 1px solid var(--gray600); opacity: 1" />

              <div class="point-boxes">
                <div class="point-box">
                  <p>총 포인트</p>
                  <span>${totalPoints}</span>
                </div>
                <div class="point-box">
                  <p>사용 가능 포인트</p>
                  <span>${availablePoints}</span>
                </div>
                <div class="point-box">
                  <p>적립 예정 포인트</p>
                  <span>${pendingPoints}</span>
                </div>
                <div class="point-box">
                  <p>환불 예정 포인트</p>
                  <span>${refundWaitPoints}</span>
                </div>
              </div>
            </div>

            <div class="text-left mt-4">쿠폰</div>
            <hr style="border: 1px solid var(--gray600); opacity: 1" />
 			<form action="/couponPoint" method="get">
            <table class="coupon-table" style="margin-bottom: 150px">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>쿠폰명</th>
                  <th>쿠폰혜택</th>
                  <th>할인금액</th>
                  <th>사용가능 기간</th>
                </tr>
              </thead>
				<tbody>
				    <c:if test="${empty coupons}">
				        <tr>
				            <td colspan="4" class="no-coupon">쿠폰이 없습니다.</td>
				        </tr>
				    </c:if>
				
				    <c:if test="${!empty coupons}">
				        <c:forEach var="coupon" items="${coupons}">
						    <tr>
						        <td class="coupon-id">${coupon.coupon_id}</td>
						        <td class="coupon-name">${coupon.name}</td>
						        <td class="coupon-description"> ${coupon.description}</td>
						 		<td class="coupon-value"> -${coupon.value}</td>
						        <td class="coupon-date">
				                    <c:if test="${not empty coupon.delete_date}">
				                        <fmt:formatDate value="${coupon.delete_date}" pattern="yyyy-MM-dd" />
				                    </c:if>
				                    <c:if test="${empty coupon.delete_date}">
				                        <span>삭제되지 않음</span>
				                    </c:if>
				                </td>
				              </tr>
				        </c:forEach>
				    </c:if>
				</tbody>
            </table>
              </form>
          </div>
        </div>
      </div>
    
    </div>
    <!-- content end -->

    <!-- footer start -->
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- FOOTER END-->
  </body>
</html>