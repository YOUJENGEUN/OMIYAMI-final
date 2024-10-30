<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	href="./${pageContext.request.contextPath}/resources/img/logo/logo1.png"
	rel="icon" />

<link
	href="../${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="../${pageContext.request.contextPath}/resources/resources/css/fonts/fonts.css"
	rel="stylesheet" />
<link
	href="../${pageContext.request.contextPath}/resources/css/variables/round.css"
	rel="stylesheet" />
<link
	href="../${pageContext.request.contextPath}/resources/css/style/btn.css"
	rel="stylesheet" />
<link
	href="../${pageContext.request.contextPath}/resources/css/style/admin.css"
	rel="stylesheet" />
<link
	href="../${pageContext.request.contextPath}/resources/css/variables/colors.css"
	rel="stylesheet" />

<script src="https://kit.fontawesome.com/efcc08af8c.js"
	crossorigin="anonymous"></script>
<script
	src="../${pageContext.request.contextPath}/resources/css/bootstrap/js/admin.js"></script>

<title>OMIYAMI</title>
</head>

<body style="background-color: var(- -bluegray100)">
	<div class="main-wrapper row">
		<div class="sidebar col-lg-2 px-0">
			<div class="d-flex justify-content-center my-5 logo">
				<a href="/main.html"> <img class="logo-img"
					src="../resources/img/logo/logo.png" alt="logo" /></a>
			</div>
			<div class="nav-items" id="sidebarMenu">
				<a href="admin.html" class="nav-item   active kr-500" id="menu1"><i
					class="fa-solid fa-store"></i> OMIYAMI</a> <a href="/Product-main"
					class="nav-item kr-500" id="menu2"><i class="fa-solid fa-tags"></i>상품관리</a>

				<a href="/order-main" class="nav-item kr-500" id="menu3"><i
					class="fa-solid fa-receipt"></i>주문관리</a> <a href="member-main.html"
					class="nav-item kr-500" id="menu4"><i class="fa-solid fa-users"></i>회원관리</a>

				<a href="post-main.html" class="nav-item kr-500" id="menu5"><i
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
					<div class="col section-title kr-700">상품관리</div>
				</div>
				<hr class="admin-boder" />

				<form action="${pageContext.request.contextPath}/insertProduct"
					method="post" enctype="multipart/form-data">
					<div class="product-info-container">
						<div class="order-section">
							<div class="thumbnail-wrapper">
								<div class="Thumbnail">
									<input class="form-control" type="file" id="Thumbnail"
										name="Thumbnail" accept="image/*" style="display: none" /> <label
										class="Thumbnail-before" id="Thumbnail-img" for="Thumbnail"
										style="width: 100%; position: relative">
										<div class="icon">
											<i class="fa-solid fa-image" style="font-weight: 700">
												썸네일 이미지 등록 </i>
										</div>
									</label>
								</div>
							</div>
						</div>
						<div class="card2">
							<div class="kr-600">
								<p>브랜드명</p>
								<input class="form-control" type="text"
									placeholder="브랜드명을 입력해주세요" />
							</div>
						</div>
						<div class="card2">
							<div class="kr-600">
								<p>제품명</p>
								<input class="form-control" type="text"
									placeholder="제품명을 입력해주세요" />
							</div>
						</div>
						<div class="card-section">
							<div class="card2">
								<div class="kr-600">
									<p>가격</p>
									<input class="form-control" type="text" />
								</div>
							</div>
							<div class="card2">
								<div class="kr-600">
									<p>재고</p>
									<input class="form-control" type="text" />
								</div>
							</div>
							<div class="card2">
								<div class="kr-600">
									<p>카테고리</p>
									<input class="form-control" type="text" />
								</div>
							</div>
						</div>
						<div class="card2">
							<div class="kr-600">
								<p>이미지 등록</p>
								<input class="form-control" type="file" id="product-image"
									name="product-image" accept="image/*" />
							</div>
						</div>
						<div class="card2">
							<div class="kr-600">
								<p>제품 설명</p>
								<textarea class="form-control" id="product-description"
									placeholder="제품 설명을 입력해주세요" rows="20" style="resize: none"></textarea>
							</div>
						</div>
					</div>
				</form>
				<div class="d-flex justify-content-center"
					style="margin-bottom: 100px">
					<button type="button" class="btn btn-l me-5" id="go-back">
						목록가기</button>
					<button type="button" class="btn btn-l">작성하기</button>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty message}">
		<script>
        alert('${message}');
    </script>
	</c:if>

	<c:if test="${not empty error}">
		<script>
        alert('${error}');
    </script>
	</c:if>
	<script>
  document.getElementById("go-back").addEventListener(("click",)=>{window.history.back(); });
   




  </script>
</body>

</html>