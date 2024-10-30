<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<link
	href="../${pageContext.request.contextPath}/resources/img/logo/logo1.png"
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
<script src="/css/bootstrap/js/admin.js"></script>
<script src="/css/bootstrap/js/bootstrap.js"></script>

<title>OMIYAMI</title>
</head>

<body style="background-color: var(- -bluegray100)">
	<div class="main-wrapper row">
		<div class="sidebar col-lg-2 px-0">
			<div class="d-flex justify-content-center my-5 logo">
				<a href="/main.html"> <img class="logo-img"
					src="../${pageContext.request.contextPath}/resources/img/logo/logo.png"
					alt="logo" />
				</a>
			</div>
			<div class="nav-items" id="sidebarMenu">
				<a href="admin.html" class="nav-item kr-500" id="menu1"><i
					class="fa-solid fa-store"></i> OMIYAMI</a> <a href="Product-main.html"
					class="nav-item kr-500" id="menu2"><i class="fa-solid fa-tags"></i>상품관리</a>
				<a href="order-main.html" class="nav-item kr-500" id="menu3"><i
					class="fa-solid fa-receipt"></i>주문관리</a> <a href="member-main.html"
					class="nav-item kr-500" id="menu4"><i class="fa-solid fa-users"></i>회원관리</a>
				<a href="post-main.html" class="nav-item active kr-500" id="menu5"><i
					class="fa-solid fa-list-check"></i>게시물관리</a> <a
					href="Inquiry-main.html" class="nav-item kr-500" id="menu6"><i
					class="fa-solid fa-pen-to-square"></i>문의관리</a>
			</div>
			<footer>
				<p class="copyright">© 2024 OMIYAMI. All Rights Reserved.</p>
			</footer>
		</div>

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
					<div class="col section-title kr-700">FAQ 작성</div>
				</div>
				<hr class="admin-boder" />

				<div class="product-info-container">
					<form action="${pageContext.request.contextPath}/post-faq-write"
						method="POST">
						<div class="card-section">
							<div class="card3">
								<div class="kr-600">
									<p>제목</p>
									<input class="form-control" type="text" name="title"
										placeholder="제목을 입력해주세요" required />
								</div>
							</div>
							
						</div>

						<div class="card2">
							<div class="kr-600">
								<p>내용</p>
								<textarea class="form-control" name="content" rows="20"
									style="resize: none" required></textarea>
							</div>
						</div>

						<div class="d-flex justify-content-center"
							style="margin-bottom: 100px">
							<button type="button" class="btn btn-l me-5"
								onclick="location.href='${pageContext.request.contextPath}/post-faq'">
								목록가기</button>
							<button type="submit" class="btn btn-l">작성하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${not empty message}">
		<script>
			alert("${message}");
		</script>
	</c:if>
</body>
</html>