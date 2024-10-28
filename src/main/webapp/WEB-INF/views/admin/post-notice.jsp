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
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/admin.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/bootstrap.js"></script>

<title>OMIYAMI</title>
</head>

<body style="background-color: var(--bluegray100)">
	<div class="main-wrapper row">
		<div class="sidebar col-lg-2 px-0">
			<div class="d-flex justify-content-center my-5 logo">
				<a href="/main.html"> <img class="logo-img"
					src="${pageContext.request.contextPath}/resources/img/logo/logo.png"
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
			<div class="product-container">
				<div class="row d-flex">
					<div class="col section-title kr-700">공지사항 관리</div>
					<button type="button" class="btn btn-l"
						onclick="location.href='../${pageContext.request.contextPath}/post-notice-form'">
						작성하기</button>
					<button type="button" class="btn btn-l" id="modifyBtn"
						onclick="modifySelectedNotice()">수정하기</button>
					<button type="button" class="btn btn-l" id="deleteBtn"
						onclick="deleteSelectedNotices()">삭제</button>
				</div>
				<hr class="admin-boder" />


				<div class="order-section mt-3" style="margin-bottom: 30px">
					<div class="tab-content">
						<div>
							<table>
								<thead class="table-head">
									<tr>
										<th style="width: 5%"><input type="checkbox"
											name="selectAll-item" id="checkbtn" onclick="selectAll(this)" />
										</th>
										<th style="width: 5%">No</th>
										<th colspan="4" style="width: 35%">제목</th>
										<th style="width: 15%">작성자</th>
										<th style="width: 15%">작성일</th>
									</tr>
								</thead>


								<tbody class="table-body" style="line-height: 2;">
									<c:forEach items="${notices}" var="notice">
										<tr class="order-item" style="text-align: center">
											<td style="width: 5%"><input type="checkbox"
												name="select-item" value="${notice.noticeId}"
												onclick="selectItem()" /></td>
											<td colspan="4">${notice.noticeId}</td>
											<td style="font-size: var(- -size300)"><a
												href="../${pageContext.request.contextPath}/post-notice-form-modify?noticeId=${notice.noticeId}">
													${notice.title} </a></td>
											<td>관리자</td>
											<td style="font-size: var(- -size300)"><fmt:formatDate
													value="${notice.writeDate}" pattern="yyyy.MM.dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<nav aria-label="Page navigation" style="margin-bottom: 150px">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>

	<!-- 공지사항 삭제를 위한 JavaScript -->
	<script>
    function deleteSelectedNotices() {
        const selectedCheckboxes = document.querySelectorAll('input[name="select-item"]:checked');
        if (selectedCheckboxes.length === 0) {
            alert('삭제할 공지사항을 선택해주세요.');
            return;
        }
        
        if (confirm('선택한 공지사항을 삭제하시겠습니까?')) {
            const noticeIds = Array.from(selectedCheckboxes).map(cb => cb.value);
            
            // form을 생성하여 POST 요청 전송
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = '${pageContext.request.contextPath}/deleteNotices';
            
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'noticeIds';
            input.value = noticeIds.join(',');
            
            form.appendChild(input);
            document.body.appendChild(form);
            form.submit();
        }
    }
    function modifySelectedNotice() {
        const selectedCheckboxes = document.querySelectorAll('input[name="select-item"]:checked');
        
        // 선택된 항목이 없는 경우
        if (selectedCheckboxes.length === 0) {
            alert('수정할 공지사항을 선택해주세요.');
            return;
        }
        
        // 여러 개가 선택된 경우
        if (selectedCheckboxes.length > 1) {
            alert('수정은 하나의 공지사항만 선택해주세요.');
            return;
        }
        
        // 선택된 공지사항의 ID를 가져와서 수정 페이지로 이동
        const noticeId = selectedCheckboxes[0].value;
        location.href = '${pageContext.request.contextPath}/post-notice-form-modify?noticeId=' + noticeId;
    }
    </script>
</body>
</html>