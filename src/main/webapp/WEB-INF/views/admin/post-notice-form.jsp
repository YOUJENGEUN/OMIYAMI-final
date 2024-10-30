<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<meta property="og:type" content="website" />
<meta property="og:site_name" content="OMIYAMI" />
<meta property="og:title" content="OMIYAMI" />
<meta property="og:image" content="img/logo/logo1.png" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />

<link
	href="${pageContext.request.contextPath}/resources/img/logo/logo1.png"
	rel="icon" />
<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/fonts/fonts.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/variables/round.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/style/btn.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/style/admin.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/variables/colors.css"
	rel="stylesheet" />

<script src="https://kit.fontawesome.com/efcc08af8c.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/admin.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/bootstrap.js"></script>

<title>OMIYAMI - 공지사항 작성</title>
</head>

<body style="background-color: var(- -bluegray100)">
	<div class="main-wrapper row">
		<!-- 사이드바 부분 -->
		<div class="sidebar col-lg-2 px-0">
			<div class="d-flex justify-content-center my-5 logo">
				<a href="${pageContext.request.contextPath}/admin"> <img
					class="logo-img"
					src="${pageContext.request.contextPath}/resources/img/logo/logo.png"
					alt="logo" />
				</a>
			</div>
			<div class="nav-items" id="sidebarMenu">
				<a href="${pageContext.request.contextPath}/admin"
					class="nav-item kr-500" id="menu1"> <i
					class="fa-solid fa-store"></i> OMIYAMI
				</a> <a href="${pageContext.request.contextPath}/admin/Product-main"
					class="nav-item kr-500" id="menu2"> <i class="fa-solid fa-tags"></i>상품관리
				</a> <a href="${pageContext.request.contextPath}/admin/order-main"
					class="nav-item kr-500" id="menu3"> <i
					class="fa-solid fa-receipt"></i>주문관리
				</a> <a href="${pageContext.request.contextPath}/admin/member-main"
					class="nav-item kr-500" id="menu4"> <i
					class="fa-solid fa-users"></i>회원관리
				</a> <a href="${pageContext.request.contextPath}/admin/post-notice"
					class="nav-item active kr-500" id="menu5"> <i
					class="fa-solid fa-list-check"></i>게시물관리
				</a> <a href="${pageContext.request.contextPath}/admin/Inquiry-main"
					class="nav-item kr-500" id="menu6"> <i
					class="fa-solid fa-pen-to-square"></i>문의관리
				</a>
			</div>
			<footer>
				<p class="copyright">© 2024 OMIYAMI. All Rights Reserved.</p>
			</footer>
		</div>

		<!-- 메인 컨텐츠 -->
		<div class="content col-lg-9">
			<div class="top-section">
				<div class="top-bar">
					<div class="top-icon">
						<i class="fa-solid fa-bell fa-xl"></i>
					</div>
					<div class="top-icon">
						<i class="fa-solid fa-user fa-xl"></i>
					</div>
				</div>
				<hr
					style="border: 1px solid var(- -gray900); transform: scaleY(1.1); opacity: 1;" />
			</div>

			<div class="product-container">
				<div class="row d-flex">
					<div class="col section-title kr-700">공지사항 작성</div>
				</div>
				<hr class="admin-boder" />

				<!-- 공지사항 작성 폼 -->
				<form action="${pageContext.request.contextPath}/insertNotice"
					method="post">
					<div class="product-info-container">
						<div class="card3">
							<div class="kr-600">
								<p>공지사항 제목</p>
								<input class="form-control" type="text" name="title"
									placeholder="제목을 입력해주세요" required />
							</div>
						</div>

						<div class="card2">
							<div class="kr-600">
								<p>공지 내용</p>
								<textarea class="form-control" name="content" rows="20"
									style="resize: none" required></textarea>
							</div>
						</div>
					</div>

					<div class="d-flex justify-content-center"
						style="margin-bottom: 100px">
						<button type="button" class="btn btn-l me-5"
							onclick="location.href='${pageContext.request.contextPath}/post-notice'">목록가기</button>
						<button type="submit" class="btn btn-l">작성하기</button>
					</div>
				</form>

				<!-- 알림 메시지 -->
				<c:if test="${not empty message}">
					<div class="alert alert-${messageType}" role="alert">
						${message}</div>
				</c:if>
				<script>
   

    // 폼 제출 전 유효성 검사
    document.querySelector('form').addEventListener('submit', function(e) {
      const title = document.querySelector('input[name="title"]').value.trim();
      const content = document.querySelector('textarea[name="content"]').value.trim();
      const noticeType = document.querySelector('select[name="noticeType"]').value;

      if (!title) {
        e.preventDefault();
        alert('제목을 입력해주세요.');
        return;
      }

      if (!noticeType) {
        e.preventDefault();
        alert('공지사항 유형을 선택해주세요.');
        return;
      }

      if (!content) {
        e.preventDefault();
        alert('내용을 입력해주세요.');
        return;
      }
    });
  </script>
</body>
</html>