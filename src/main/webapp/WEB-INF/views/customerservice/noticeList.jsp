<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
  <!-- scroll up  -->
  <div class="scroll-top" id="scrollUp">
    <i class="fa-solid fa-cloud kr-700" style="font-size: var(--size900); color: var(--indigo100)"></i>
    <i class="fa-solid fa-plane-up kr-700" style="font-size: var(--size900); color: var(--rose300)"></i>
  </div>

    <!-- header include -->
  	<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<!-- notice start -->
    <main class="customer-wrapper" style="margin-top: 70px">
		<section class="customerservice-board" id="customerservice">
        <div class="customerservice">
			<div class="row">
				<div class="col section-title-customer">고객센터</div>
				<div class="col-3 searchbox">
					<form action="/customerservice/notice/search" method="get" id="notice-searchform">
						<input class="search" type="text" name="keyword"/>
						<div class="search-icon">
							<a class="nav-link" href="javascript:void(0);"
	              				onclick="document.getElementById('notice-searchform').submit();">
								<i class="fa-solid fa-search" style="color: var(--gray700)"></i>
							</a>
						</div>
					</form>
				</div>
			</div>
	
			<hr class="customer-hr" />
	
			<nav class="tabs d-flex" style="border-bottom: 2px solid var(--gray600)">
			  <ul class="nav nav-fill w-80">
			    <li class="tabs-item nav-item">
			      <a href="/customerservice/notices" class="tablinks-active nav-link">
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
			      <a href="/customerservice/inquery" class="tablinks nav-link">
			        <div>1:1 문의</div>
			      </a>
			    </li>
			  </ul>
			</nav>
	
			<!-- content -->
			<div class="notice-list">
				<table class="table">
					<tbody>
						<c:forEach var="notice" items="${noticeList}">
							<tr onclick="openTab('content${notice.notice_id}'); return false;" style="cursor: pointer;">
								<th scope="row">[공지]</th>
								<td class="notice-title">
									<a href="javascript:void(0);" class="faq-link">${notice.title}</a>
								</td>
								<td class="notice-date">
									<fmt:formatDate value="${notice.write_date}" pattern="yyyy.MM.dd" />
								</td>
								<td class="rotate-img">
									<i class="fa-solid fa-circle-down fa-lg" style="color: var(--gray800)"></i>
								</td>
							</tr>
			
							<tr class="content-wrapper" id="content${notice.notice_id}"
								style="display: none;">
								<th scope="row"></th>
								<td class="notice-content">${notice.content}</td>
								<td class="notice-date" colspan="2"></td>
							</tr>
						</c:forEach>
						
						<!-- 검색 결과가 없을 경우 처리 -->
			            <c:if test="${empty noticeList}">
			                <tr>
			                    <td colspan="4" style="text-align:center;">검색 결과가 없습니다</td>
			                </tr>
			            </c:if>
						
					</tbody>
				</table>
			</div>
	
			<!-- pagination -->
			<nav aria-label="Page navigation example" style="margin-bottom: 150px; margin-top: 60px">
			    <ul class="pagination">
			        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
			            <a class="page-link" href="?pageNumber=${currentPage - 1}&keyword=${keyword}">
			                <span aria-hidden="true">&laquo;</span>
			            </a>
			        </li>
			
			        <c:forEach begin="1" end="${totalPages}" var="i">
			            <li class="page-item ${i == currentPage ? 'active' : ''}">
			                <a class="page-link" href="?pageNumber=${i}&keyword=${keyword}">${i}</a>
			            </li>
			        </c:forEach>
			
			        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
			            <a class="page-link" href="?pageNumber=${currentPage + 1}&keyword=${keyword}">
			                <span aria-hidden="true">&raquo;</span>
			            </a>
			        </li>
			    </ul>
			</nav>
	
		</div>
		</section>
	</main>

  <!-- footer include-->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
		// 첫 번째 스크립트: 검색폼 처리
		const searchForm = document.querySelector(".searchform");

		searchForm.addEventListener("input", function() {
			if (searchForm.value.trim() !== "") {
				searchForm.classList.add("has-text");
			} else {
				searchForm.classList.remove("has-text");
			}
		});


		// 두 번째 스크립트: 탭 링크 활성화 처리
		var tablinks = document.querySelectorAll('.tablinks, .tablinks-active');
		var currentPath = window.location.pathname;

		tablinks.forEach(function(link) {
			var linkHref = link.getAttribute('href');

			if (linkHref === currentPath) {
				link.classList.add('tablinks-active');
				link.classList.remove('tablinks'); 
			} else {
				link.classList.add('tablinks'); 
				link.classList.remove('tablinks-active');
			}
		});
</script>

  </body>
</html>
