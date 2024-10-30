<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<title>OMIYAMI</title>
</head>

<body style="background-color: var(--bluegray100)">
	<div class="main-wrapper row">
		<div class="sidebar col-lg-2 px-0">
			<div class="d-flex justify-content-center my-5 logo">
				<a href="/main.html"> <img class="logo-img" src="${pageContext.request.contextPath}/resources/css/bootstrap/logo/logo.png"
					alt="logo" />
				</a>
			</div>
			<div class="nav-items" id="sidebarMenu">
				<a href="/admin" class="nav-item kr-500" id="menu1"> <i
					class="fa-solid fa-store"></i> OMIYAMI
				</a> <a href="/Product-main" class="nav-item kr-500" id="menu2"> <i
					class="fa-solid fa-tags"></i>상품관리
				</a> <a href="/order-main" class="nav-item kr-500" id="menu3"> <i
					class="fa-solid fa-receipt"></i>주문관리
				</a> <a href="/member-main" class="nav-item kr-500" id="menu4"> <i
					class="fa-solid fa-users"></i>회원관리
				</a> <a href="/post-main" class="nav-item active kr-500" id="menu5">
					<i class="fa-solid fa-list-check"></i>게시물관리
				</a> <a href="/Inquiry-main" class="nav-item kr-500" id="menu6"> <i
					class="fa-solid fa-pen-to-square"></i>문의관리
				</a>
			</div>
			<footer>
				<p class="copyright">© 2024 OMIYAMI. All Rights Reserved.</p>
			</footer>
		</div>

		<script>
document.addEventListener('DOMContentLoaded', function() {
    // 모든 메뉴 아이템의 active 클래스 제거
    document.querySelectorAll('.nav-item').forEach(item => {
        item.classList.remove('active');
    });
    
    // 게시물관리 메뉴에 active 클래스 추가
    document.getElementById('menu5').classList.add('active');
});
</script>
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
					style="border: 1px solid var(--gray900); transform: scaleY(1.1); opacity: 1;" />
			</div>

			<div class="dashboard-container">
				<!-- 공지사항 테이블 부분 -->
				<div class="order-section">
					<div class="d-flex justify-content-between"
						style="margin: 0px 10px">
						<div class="kr-700 mb-2" style="font-size: var(- -size700)">
							공지사항</div>
						<div class="see-more mb-2" onclick="location.href='/post-notice'">
							더보기</div>
					</div>
					<table>
						<thead class="table-head">
							<tr>
								<th>No</th>
								<th colspan="2">제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="table-body">
							<c:forEach items="${notices}" var="notice" varStatus="status">
								<tr class="post-list-text">
									
									<td>${notice.noticeId}</td>
									<td colspan="2"  class="text-start"><a
										href="post-notice-form-modify?noticeId=${notice.noticeId}"
										style="color: #000000;"> ${notice.title} </a></td>
									<td>관리자</td>
									<td><fmt:formatDate value="${notice.writeDate}"
											pattern="yyyy.MM.dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- FAQ 테이블 부분 -->
				<div class="order-section">
					<div class="d-flex justify-content-between"
						style="margin: 0px 10px">
						<div class="kr-700 mb-2" style="font-size: var(--size700)">
							FAQ</div>
						<div class="see-more mb-2" onclick="location.href='/post-faq'">
							더보기</div>
					</div>
					<table>
						<thead class="table-head">
							<tr>
								<th>No</th>
								<th colspan="2">제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="table-body">
							<c:forEach var="faq" items="${faqs}" varStatus="status">
								<tr class="post-list-text">
									<td>${status.count}</td>
									<td colspan="2">${faq.title}</td>
									<td>관리자</td>
									<td style="font-size: var(- -size300)"><fmt:formatDate
											value="${faq.writeDate}" pattern="yyyy.MM.dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- 최신리뷰 테이블 부분 -->
				<div class="order-section" style="margin-bottom: 150px">
					<div class="d-flex justify-content-between"
						style="margin: 0px 10px">
						<div class="kr-700 mb-2" style="font-size: var(- -size700)">
							최신리뷰</div>
						<div class="see-more mb-2" onclick="location.href='/post-review'">
							더보기</div>
					</div>
					<table>
						<thead class="table-head">
							<tr>
								<th>No</th>
								<th colspan="2">상품명</th>
								<th colspan="2">내용</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody class="table-body">
							<c:forEach var="review" items="${reviews}" varStatus="status">
								<tr class="post-list-text">
									<td>${status.count}</td>
									<td style="width: 10%"><img class="pr-or-img ms-4"
										src="${review.productImage}" alt="상품사진" /></td>
									<td class="order-text"
										style="line-height: 1.3; text-align: left; margin-left: 5px">
										<span class="kr-700" style="font-size: var(- -size500)">${review.productName}</span>
									</td>
									<td class="kr-700" colspan="2">${review.content}</td>
									<td>${review.writer}</td>
									<td style="font-size: var(- -size300)"><fmt:formatDate
											value="${review.writeDate}" pattern="yyyy.MM.dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

</html>