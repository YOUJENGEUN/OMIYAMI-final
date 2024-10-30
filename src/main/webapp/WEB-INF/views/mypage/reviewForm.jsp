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
  <link href="${pageContext.request.contextPath}/resources/css/style/review.css" rel="stylesheet" />

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

	<!-- content start -->
    <div class="mypage-wrapper my-5">
      <div class="container mt-5">
        <div class="section-title-in kr-700" style="font-size: var(--size800)">마이페이지</div>
        <hr style="border: 1px solid var(--gray900);transform: scaleY(1.1);opacity: 1;"/>

        <div class="row">
        <!-- sidebar include  -->
		<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

          <!-- content start -->
          <div class="col-10">
            <div class="text-left mt-4">리뷰 작성</div>
            <hr style="border: 1px solid var(--gray600);opacity: 1;margin: 5px 0;"/>
            
            <div class="review-box" style="margin-left: 15px">
	          <form action="/submitReview" method="post">
	            <input type="hidden" name="userId" value="${sessionScope.userVO.user_id}">
	    		<input type="hidden" name="productId" value="${productId}">
				<table class="review-table" id="review-tab">
					<tr class="table-section">
	                  <th valign="middle">주문번호</th>
	                  <td>
	                    <input type="text" id="orderNum" name="orderNum" value="${orderNum}" readonly 
	                    		class="form-control mt-2" style="background-color: var(--gray200);"/>
	                  </td>
	                </tr>
					<tr class="table-section">
	                    <th valign="middle">상품명</th>
	                    <td>
	                      <input type="text" id="productName" name="productName" value="${productName}" readonly 
	                      		class="form-control mt-2" style="background-color: var(--gray200);"/>
	                    </td>
	                </tr>
					<tr class="table-section">
	                    <th valign="middle">평가</th>
	                    <td>
	                      <select name="status" class="form-select" required>
	                        <option value="" hidden selected>상품은 어떠셨나요?</option>
	                        <option value="만족">만족</option>
	                        <option value="불만족">불만족</option>
	                      </select>
	                    </td>
	                </tr>
	                <tr class="table-section">
	                  <th valign="middle">리뷰내용</th>
	                  <td class="mt-2">
	                  	<textarea name="content" required class="form-control mt-2" rows="5"
	                			style="resize: none"></textarea>
	                  </td>
	                </tr>
				</table>
				<div class="d-flex justify-content-center" style="margin-bottom: 40px">
					<button class="btn-pro" type="button" onclick="location.href='/orderList'">주문목록</button>
				  	<button class="btn-pro" type="submit">작성하기</button>
				</div>
              </form>
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