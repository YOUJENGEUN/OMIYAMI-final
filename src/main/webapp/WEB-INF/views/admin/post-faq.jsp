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
					alt="logo" /></a>
			</div>
			<div class="nav-items" id="sidebarMenu">
				<a href="admin.html" class="nav-item kr-500" id="menu1"><i
					class="fa-solid fa-store"></i> OMIYAMI</a> <a href="Product-main.html"
					class="nav-item  kr-500" id="menu2"><i class="fa-solid fa-tags"></i>상품관리</a>
				<a href="order-main.html" class="nav-item kr-500" id="menu3"><i
					class="fa-solid fa-receipt"></i>주문관리</a> <a href="member-main.html"
					class="nav-item kr-500" id="menu4"><i class="fa-solid fa-users"></i>회원관리</a>
				<a href="post-main.html" class="nav-item active kr-500" id="menu5"><i
					class="fa-solid fa-list-check"></i>게시물관리</a> <a
					href="Inquiry-main.html" class="nav-item kr-500" id="menu6"><i
					class="fa-solid fa-pen-to-square"></i>문의관리</a>
			</div>
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
				<div class="col section-title kr-700">FAQ 관리</div>

				<button type="button" class="btn btn-l"
					onclick="location.href='${pageContext.request.contextPath}/post-faq-form'">작성하기</button>
				<button type="button" class="btn btn-l" onclick="modifyFaq()">수정하기</button>
				<button type="button" class="btn btn-l" onclick="deleteFaqs()">삭제</button>
				<form id="faqForm" method="post">
					<hr class="admin-boder" />
					<div class="order-section mt-3" style="margin-bottom: 30px">
						<div class="tab-content">
							<table>
								<thead class="table-head">
									<tr>
										<th style="width: 5%"><input type="checkbox"
											id="selectAll" onclick="toggleAll(this)" /></th>
										<th style="width: 5%">No</th>
										<th style="width: 35%">제목</th>
										<th style="width: 15%">작성자</th>
										<th style="width: 15%">작성일</th>
									</tr>
								</thead>
								<tbody class="table-body">
									<c:forEach var="faq" items="${faqs}">
										<tr class="order-item" style="text-align: center">
											<td><input type="checkbox" name="faqIds"
												value="${faq.faqId}" /></td>
											<td>${faq.faqId}</td>
											<td><a
												href="${pageContext.request.contextPath}/post-faq-form-modify?faqId=${faq.faqId}"
												style="color: #000000;"> ${faq.title != null ? faq.title : '제목 없음'}
											</a></td>
											<td>관리자</td>
											<td><fmt:formatDate value="${faq.writeDate}"
													pattern="yyyy.MM.dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>

	<script>
		function toggleAll(source) {
			const checkboxes = document.getElementsByName('faqIds');
			for (let i = 0; i < checkboxes.length; i++) {
				checkboxes[i].checked = source.checked;
			}
		}

		function deleteFaqs() {
			const form = document.getElementById('faqForm');
			const checkedBoxes = document
					.querySelectorAll('input[name="faqIds"]:checked');

			if (checkedBoxes.length === 0) {
				alert('삭제할 FAQ를 선택해주세요.');
				return;
			}

			if (confirm('선택한 FAQ를 삭제하시겠습니까?')) {
				form.action = '${pageContext.request.contextPath}/post-faq/delete';
				form.submit();
			}
		}

		function modifyFaq() {
			const checkedBoxes = document
					.querySelectorAll('input[name="faqIds"]:checked');

			if (checkedBoxes.length === 0) {
				alert('수정할 FAQ를 선택해주세요.');
				return;
			}

			if (checkedBoxes.length > 1) {
				alert('수정은 하나의 FAQ만 선택할 수 있습니다.');
				return;
			}

			const faqId = checkedBoxes[0].value;
			location.href = '${pageContext.request.contextPath}/post-faq-form-modify?faqId='
					+ faqId;
		}
	</script>
</body>

</html>