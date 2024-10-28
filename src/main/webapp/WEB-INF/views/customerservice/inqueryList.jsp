<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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

	<script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	  crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/customerservice.js"></script>
	<title>OMIYAMI</title>
</head>

<body style="background-color: var(--truegray50)">
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<main class="customer-wrapper" style="margin-top: 70px">
        <section class="customerservice-board" id="customerservice">
            <div class="customerservice">
                <div class="row d-flex">
                    <div class="col section-title-customer">고객센터</div>
                    <button type="button" class="btn btn-pro1"
                        onclick="location.href='/customerservice/inqueryForm'">문의 하기</button>
                	</div>

                <hr class="customer-hr" />

				<nav class="tabs d-flex" style="border-bottom: 2px solid var(--gray600)">
				  <ul class="nav nav-fill w-80">
				    <li class="tabs-item nav-item">
				      <a href="/customerservice/notices" class="tablinks nav-link">
				        <div>공지사항</div>
				      </a>
				    </li>
				
				    <li class="tabs-item nav-item">
				      <span class="divider"></span>
				    </li>
				
				    <li class="tabs-item nav-item">
				      <a href="/customerservice/faqs" class="tablinks nav-link">
				        <div>FAQ</div>
				      </a>
				    </li>
				
				    <li class="tabs-item nav-item">
				      <span class="divider"></span>
				    </li>
				
				    <li class="tabs-item nav-item">
				      <a href="/customerservice/inquery" class="tablinks-active nav-link">
				        <div>1:1 문의</div>
				      </a>
				    </li>
				  </ul>
				</nav>


                <div class="inquiry-list my-5">
                    <table class="table">
                        <thead>
                            <tr style="font-size: var(--size300)">
                                <th scope="col" class="number">번호</th>
                                <th scope="col" class="inquiry-category">문의유형</th>
                                <th scope="col" class="order-number">주문번호</th>
                                <th scope="col" class="inquiry-title">문의제목</th>
                                <th scope="col" class="inquiry-date">등록일자</th>
                                <th scope="col" class="inquiry-status">처리상태</th>
                            </tr>
                        </thead>
                        <tbody style="font-size: 14px">
					    <c:set var="totalSize" value="${fn:length(inqueries)}" /> <!-- 총 크기 저장 -->
					    <c:forEach var="inquery" items="${inqueries}" varStatus="status">
					        <tr class="inquiry-title-row" style="cursor: pointer;" onclick="toggleContent('content${inquery.inquery_id}', 'answer${inquery.inquery_id}');">
					            <td class="number">${totalSize - status.index}</td> <!-- 역순 인덱스 출력 -->
					            <td class="inquiry-category">${inquery.category}</td>
					            <td class="order-number">${inquery.order_id}</td>
					            <td class="inquiry-title">
					                <a href="javascript:void(0);" style="text-decoration: none; cursor: pointer;">
					                    ${inquery.title}
					                </a>
					            </td>
					            <td class="inquiry-date">
					                <fmt:formatDate value="${inquery.write_date}" pattern="yyyy-MM-dd" />
					            </td>
					            <td class="inquiry-status">${inquery.status}</td>
					        </tr>
					
					        <tr class="content-wrapper" id="content${inquery.inquery_id}" style="display: none;">
					            <td class="number" style="border: none"></td>
					            <td class="inquiry-category" style="border: none"></td>
					            <td class="order-number" style="border: none"></td>
					            <td class="inquiry-content" style="border: none">${inquery.content}</td>
					            <td class="inquiry-date" style="border: none"></td>
					            <td class="inquiry-status" style="border: none"></td>
					        </tr>
					
					        <tr class="content-wrapper answer-row" id="answer${inquery.inquery_id}" style="display: none;">
					            <td class="number"></td>
					            <td class="inquiry-category"></td>
					            <td class="order-number"></td>
					            <td class="answer-content" colspan="3">
					                <strong>답변:</strong>${inquery.answer_content}
					            </td>
					        </tr>
					    </c:forEach>
					</tbody>

                    </table>
                </div>

                <p class="kr-600 inquiry-notice">
					도움말<br>
	                <span style="font-size: var(--size100); color: var(--gray600); margin-bottom:100px;">
	                    &middot; 1:1 상담은 24시간 신청 가능하나 상담 시간 (평일 오전 10:00 ~ 오후 6:00  토,일,공휴일 휴무)내에서만 처리가 가능합니다.
	                    <br /> &middot; 접수된 내용은 빠른 시간 내에 답변을 드리도록 하겠습니다.
	                    <br /> &middot; 한번 등록된 상담 내용은 수정이 불가하오니 신중하게 작성해 주십시오.
	                    <br /> &middot; 필요시 고객센터(T.1234-5678)로 연락주시길 바랍니다.
	                </span>
                </p>
            </div>
        </section>
    </main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<script>
	function toggleContent(contentId, answerId) {
	    var contentRow = document.getElementById(contentId);
	    var answerRow = document.getElementById(answerId);

	    var isContentVisible = contentRow.style.display === 'table-row';
	    var isAnswerVisible = answerRow.style.display === 'table-row';

	    // 모든 행을 숨김
	    var allContentRows = document.querySelectorAll('.content-wrapper');
	    for (var i = 0; i < allContentRows.length; i++) {
	        allContentRows[i].style.display = 'none'; 
	    }

	    // 클릭한 내용과 답변이 보이지 않을 때만 보이게 함
	    if (!isContentVisible) {
	        contentRow.style.display = 'table-row'; 
	    }
	    if (!isAnswerVisible) {
	        answerRow.style.display = 'table-row'; 
	    }
	}

</script>
</body>
</html>
