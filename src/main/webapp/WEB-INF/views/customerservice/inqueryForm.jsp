<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<link href="${pageContext.request.contextPath}/resources/css/style/customerservice.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/css/style/review.css" rel="stylesheet" />


<script src="https://kit.fontawesome.com/efcc08af8c.js"
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/customerservice.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>
<title>OMIYAMI</title>
</head>
<body style="background-color: var(--truegray50)">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<div class="mypage-wrapper" style="margin-top: 70px">
		<div class="container">
			<div class="section-title-in kr-700"
				style="font-size: var(--size800)">1:1 문의 작성</div>
				
			<hr class="customer-hr" />

			<section class="customerservice-board" id="customerservice">
				<div class="customerservice">
					<form action="/customerservice/registerInquery"
						method="post">
						<table class="review-table table mx-auto mt-5" id="review-tab">
							<tr>
								<td valign="middle">문의유형</td>
								<td><select name="category" class="form-select" required>
										<option value="" hidden selected>선택하세요</option>
										<option value="주문 관련">주문 관련</option>
										<option value="상품 관련">상품 관련</option>
										<option value="기타 문의">기타 문의</option>
								</select></td>
							</tr>

							<tr class="table-section">
								<td valign="middle">주문번호</td>
								<td><input type="text" name="order_id"
									class="form-control mt-2" placeholder="주문 번호 입력" required /></td>
							</tr>

							<tr>
								<td valign="middle">문의제목</td>
								<td><input type="text" name="title" class="form-control"
									placeholder="제목을 입력해주세요" required /></td>
							</tr>

							<tr class="table-section">
								<td valign="middle">이메일</td>
								<td><input type="email" name="email" class="form-control"
									placeholder="답변받으실 이메일을 입력해주세요" /></td>
							</tr>

							<tr class="table-section">
								<td>문의 내용</td>
							</tr>
						</table>

						<textarea name="content" class="form-control w-75 mx-auto"
							rows="10" style="resize: none" required></textarea>


						<div class="d-flex justify-content-center"
							style="margin-bottom: 100px">
							<button class="btn-pro" type="button"
								onclick="location.href='/customerservice/inquery'">목록보기</button>
							<button class="btn-pro" type="submit">작성하기</button>
						</div>
					</form>
				</div>
			</section>
		</div>
	</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
        function prepareContent() {
            var textarea = document.getElementById('content');
            // 줄바꿈을 <br>로 변환
            textarea.value = textarea.value.replace(/\n/g, "<br>");
            return true; // 폼이 제출되도록 true 반환
        }
    </script>


</body>
</html>
