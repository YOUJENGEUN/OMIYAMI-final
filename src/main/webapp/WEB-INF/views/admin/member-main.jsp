<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<body style="background-color: var(- -bluegray100)">
	<div class="main-wrapper row">
		<div class="sidebar col-lg-2 px-0">
			<div class="d-flex justify-content-center my-5 logo">
				<a href="/main.html"> <img class="logo-img"
					src="..${pageContext.request.contextPath}/resources/img/logo/logo.png"
					alt="logo" /></a>
			</div>
			<div class="nav-items" id="sidebarMenu">
				<a href="admin.html" class="nav-item kr-500" id="menu1"><i
					class="fa-solid fa-store"></i> OMIYAMI</a> <a href="Product-main.html"
					class="nav-item active kr-500" id="menu2"><i
					class="fa-solid fa-tags"></i>상품관리</a> <a href="order-main.html"
					class="nav-item kr-500" id="menu3"><i
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
		<!-- 메인 컨텐츠 영역 -->
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

			<div class="dashboard-container">
				<!-- 회원 통계 카드 섹션 -->
				<div class="card-section">
					<div class="card1">
						<div class="kr-600">
							<div>신규 회원</div>
							<p>
								<span class="card-title kr-900">${stats.newMemberCount}</span>명
							</p>
						</div>
					</div>
					<div class="card1">
						<div class="kr-600">
							<div>탈퇴 회원</div>
							<p>
								<span class="card-title kr-900">${stats.withdrawnMemberCount}</span>명
							</p>
						</div>
					</div>
					<div class="card1">
						<div class="kr-600">
							<div>Total</div>
							<p>
								<span class="card-title kr-900">${stats.totalMemberCount}</span>명
							</p>
						</div>
					</div>
				</div>

				<!-- 최신 회원 목록 섹션 -->
				<div class="order-section" style="margin-bottom: 150px">
					<div class="d-flex justify-content-between"
						style="margin: 0px 10px">
						<div class="kr-700 mb-2" style="font-size: var(- -size700)">최신회원</div>
						<div class="see-more mb-2"
							onclick="location.href='/admin/member-list'">더보기</div>
					</div>
					<table>
						<thead class="table-head">
							<tr>
								<th style="width: 5%">No</th>
								<th style="width: 10%">이름</th>
								<th style="width: 15%">아이디</th>
								<th style="width: 20%">이메일</th>
								<th style="width: 15%">연락처</th>
								<th style="width: 35%">주소</th>
							</tr>
						</thead>
						<tbody class="table-body">
							<c:forEach var="member" items="${latestMembers}" varStatus="status">
								<tr class="member-list kr-500">
									<td class="ps-4">${status.count}</td>
									<td>${member.name}</td>
									<td>${member.userId}</td>
									<td>${member.email}</td>
									<td>${member.phone}</td>
									<td>${member.address}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="member-text mt-3">
						<p class="kr-600" style="font-size: var(- -size300)">&#42;최근
							가입 회원</p>
						<p style="font-style: var(- -size200)">
							&#149;최근 가입일시 순으로 회원 5명까지 표기됩니다<br /> &#149;회원의 가입일시, 아이디, 이름을
							확인할 수 있습니다
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
    // 더보기 페이지 이동 함수
    function goToMemberList() {
        location.href = '/admin/member/list';
    }
    
    // 페이지 로드 시 실행되는 함수
    document.addEventListener('DOMContentLoaded', function() {
        // 활성 메뉴 표시
        document.querySelectorAll('.nav-item').forEach(item => {
            item.classList.remove('active');
        });
        document.getElementById('menu4').classList.add('active');
    });
    </script>
</body>
</html>

