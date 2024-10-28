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
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/zipcode.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <title>OMIYAMI</title>
  </head>

  <body style="background-color: var(--truegray50)">
    <!-- main start  -->
    <div class="main-page">
       <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <!-- header end -->

      <main class="signwel-wrapper">
        <div class="find-text text-center" >
          <p style="font-size: 40px; margin-top :200px;">회원정보 수정 완료</p>
          <p style="margin-top: 80px">회원님의 정보가 수정되었습니다.</p>
        </div>

        <div style="margin-bottom: 200px">
          <a href="/mypage">
            <button class="login btn-pro mx-auto" type="submit">
              	마이페이지로
            </button>
          </a>
        </div>
      </main>

      <!-- content end -->

      <!-- footer start -->
       <%@ include file="/WEB-INF/views/common/footer.jsp" %>

    </div>
  </body>
</html>
