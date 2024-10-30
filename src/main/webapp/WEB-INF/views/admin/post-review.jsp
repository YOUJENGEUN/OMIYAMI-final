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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/efcc08af8c.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/admin.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/bootstrap.js"></script>

<title>OMIYAMI - 리뷰관리</title>

<script>
function selectAll(selectAll) {
    const checkboxes = document.getElementsByName('select-item'); // 'select-item'이 체크박스의 name 속성으로 설정되어야 합니다.
    checkboxes.forEach((checkbox) => {
        checkbox.checked = selectAll.checked; // 전체 선택 체크박스 상태에 따라 개별 체크박스 상태를 설정
    });
}
        
        function deleteSelectedReviews() {
            const selectedReviews = [];
            const checkboxes = document.getElementsByName('select-item');
            
            checkboxes.forEach((checkbox) => {
                if (checkbox.checked) {
                    selectedReviews.push(checkbox.value);
                }
            });
            
            if (selectedReviews.length === 0) {
                alert('삭제할 리뷰를 선택해주세요.');
                return;
            }
            
            if (confirm('선택한 리뷰를 삭제하시겠습니까?')) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/reviews/delete',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(selectedReviews),
                    success: function(response) {
                        if (response.status === 'success') {
                            alert(response.message);
                            location.reload();
                        } else {
                            alert(response.message);
                        }
                    },
                    error: function() {
                        alert('서버와의 통신 중 오류가 발생했습니다.');
                    }
                });
            }
        }
    </script>
</head>

<body style="background-color: var(- -bluegray100)">
	<div class="main-wrapper row">
		<div class="sidebar col-lg-2 px-0">
			<div class="d-flex justify-content-center my-5 logo">
				<a href="/main"> <img class="logo-img"
					src="${pageContext.request.contextPath}/resources/img/logo/logo.png"
					alt="logo" />
				</a>
			</div>
			<div class="nav-items" id="sidebarMenu">
				<a href="admin.html" class="nav-item kr-500" id="menu1"> <i
					class="fa-solid fa-store"></i> OMIYAMI
				</a> <a href="/Product-main" class="nav-item kr-500" id="menu2"> <i
					class="fa-solid fa-tags"></i>상품관리
				</a> <a href="/order-main" class="nav-item kr-500" id="menu3"> <i
					class="fa-solid fa-receipt"></i>주문관리
				</a> <a href="member-main.html" class="nav-item kr-500" id="menu4">
					<i class="fa-solid fa-users"></i>회원관리
				</a> <a href="post-main.html" class="nav-item active kr-500" id="menu5">
					<i class="fa-solid fa-list-check"></i>게시물관리
				</a> <a href="Inquiry-main.html" class="nav-item kr-500" id="menu6">
					<i class="fa-solid fa-pen-to-square"></i>문의관리
				</a>
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
					<div class="col section-title kr-700">리뷰 관리</div>
					<button type="button" class="btn btn-l"
						onclick="deleteSelectedReviews()">삭제</button>
				</div>
				<hr class="admin-boder" />

				<!-- 메시지 표시 -->
				<c:if test="${not empty message}">
					<div class="alert alert-warning" role="alert">${message}</div>
				</c:if>

				<!-- 에러 메시지 표시 -->
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>

				<!-- 리뷰 데이터가 있을 경우에만 테이블 표시 -->
				<c:if test="${not empty reviews}">
					<div class="order-section mt-3" style="margin-bottom: 30px">
						<div class="tab-content">
							<table>
								<thead class="table-head">
									<tr class="rw-text">
										<th><input type="checkbox" name="selectAll-item"
											onclick="selectAll(this)" /></th>
										<th>No</th>
										<th colspan="2" style="width: 25%">상품명</th>
										<th style="width: 7%">평점</th>
										<th colspan="3" style="width: 40%">내용</th>
										<th style="width: 10%">작성자</th>
										<th style="width: 10%">작성일</th>
									</tr>
								</thead>
								<tbody class="table-body" style="text-align: center">
									<c:forEach items="${reviews}" var="review" varStatus="status">
										<tr>
											<td><input type="checkbox" name="select-item"
												value="${review.userId}" /></td>
											<td>${status.count}</td>
											<td style="width: 10%"><img class="pr-or-img ms-4"
												src="${review.productImage}" alt="상품사진" /></td>
											<td class="order-text" style="text-align: left"><span
												class="kr-700" style="font-size: var(- -size400)">${review.productName}</span>
											</td>
											<td>${review.status}</td>
											<td colspan="3" style="text-align: left">${review.content}</td>
											<td>${review.writer}</td>
											<td style="font-size: var(- -size200)"><fmt:formatDate
													value="${review.writeDate}" pattern="yyyy.MM.dd" /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</c:if>
			</div>
</body>
</html>