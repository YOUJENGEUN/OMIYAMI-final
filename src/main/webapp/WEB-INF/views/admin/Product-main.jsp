<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

  <link href="../resources/img/logo/logo1.png" rel="icon" />

  <link href="../resources/css/bootstrap/css/bootstrap.css" rel="stylesheet" />
  <link href="../resources/css/fonts/fonts.css" rel="stylesheet" />
  <link href="../resources/css/variables/round.css" rel="stylesheet" />
  <link href="../resources/css/style/btn.css" rel="stylesheet" />
  <link href="../resources/css/style/admin.css" rel="stylesheet" />
  <link href="../resources/css/variables/colors.css" rel="stylesheet" />

  <script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
  <script src="../resources/css/bootstrap/js/admin.js"></script>
  <script src="../resources/css/bootstrap/js/bootstrap.js"></script>

  <title>OMIYAMI</title>
</head>

<body style="background-color: var(--bluegray100)">
  <div class="main-wrapper row">
    <div class="sidebar col-lg-2 px-0">
      <div class="d-flex justify-content-center my-5 logo">
        <a href="/main.html">
          <img class="logo-img" src="../img/logo/logo.png" alt="logo" /></a>
      </div>
     <div class="nav-items" id="sidebarMenu">
				<a href="admin.html" class="nav-item   active kr-500" id="menu1"><i
					class="fa-solid fa-store"></i> OMIYAMI</a>
					
					 <a href="/Product-main"
					class="nav-item kr-500" id="menu2"><i class="fa-solid fa-tags"></i>상품관리</a>
				
				<a href="/order-main" class="nav-item kr-500" id="menu3"><i
					class="fa-solid fa-receipt"></i>주문관리</a>
					
					 <a href="member-main.html"
					class="nav-item kr-500" id="menu4"><i class="fa-solid fa-users"></i>회원관리</a>
				
				<a href="post-main.html" class="nav-item kr-500" id="menu5"><i
					class="fa-solid fa-list-check"></i>게시물관리</a> 
					
					<a
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
        <hr style="
              border: 1px solid var(--gray900);
              transform: scaleY(1.1);
              opacity: 1;
            " />
      </div>

      <div class="product-container">
        <div class="row d-flex">
          <div class="col section-title kr-700">상품관리</div>
          <button type="button" class="btn btn-l " onclick="location.href='Product-form'">
            작성하기
          </button>
          <button type="button" class="btn btn-l" onclick="location.href='Product-form-modify'">
            수정하기
          </button>
          <button type="button" class="btn btn-l" onclick="stopSellingProducts()">판매중지</button>
        </div>
        <hr class="admin-boder" />

        <ul class="nav nav-pills" id="myTab" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link ${selectedStatus == 'all' ? 'active' : ''}" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button"
              role="tab" aria-controls="all" aria-selected="true" onclick="location.href='Product-main?status=all&currentPage=1'">
              전체
              <span class="kr-600 mx-1" style="color: var(--bluegray900)">
                ${allProducts}
              </span>
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link ${selectedStatus == 'on' ? 'active' : ''}" id="on-tab" data-bs-toggle="tab" data-bs-target="#on" type="button" role="tab"
              aria-controls="on" aria-selected="false" onclick="location.href='Product-main?status=on&currentPage=1'">
              판매중
              <span class="kr-600 mx-1" style="color: var(--bluegray900)">
                ${availableProducts}
              </span>
            </button>
          </li>

          <li class="nav-item" role="presentation">
            <button class="nav-link ${selectedStatus == 'out' ? 'active' : ''}" id="out-tab" data-bs-toggle="tab" data-bs-target="#out" type="button" role="tab"
              aria-controls="out" aria-selected="false" onclick="location.href='Product-main?status=out&currentPage=1'">
              판매중지<span class="kr-600 mx-1" style="color: var(--bluegray900)">
                ${stoppedProducts}</span>
            </button>
          </li>

          <li class="nav-item" role="presentation">
            <button class="nav-link ${selectedStatus == 'soldout' ? 'active' : ''}" id="soldout-tab" data-bs-toggle="tab" data-bs-target="#soldout" type="button"
              role="tab" aria-controls="soldout" aria-selected="false" onclick="location.href='Product-main?status=soldout&currentPage=1'">
              품절<span class="kr-600 mx-1" style="color: var(--bluegray900)">
                ${outOfStockProducts}</span>
            </button>
          </li>
        </ul>

        <div class="order-section mt-3" style="margin-bottom: 30px">
          <div class="tab-content">
            <div class="tab-pane active" id="all" role="tabpanel" aria-labelledby="all-tab" tabindex="1">
              <table>
                <thead class="table-head">
                  <tr>
                    <th>
                      <input type="checkbox" name="selectAll-item" id="checkbtn" onclick="selectAll(this)" />
                    </th>
                    <th>No</th>
                    <th colspan="2" style="width: 35%">상품명</th>
                    <th style="width: 15%">가격</th>
                    <th style="width: 15%">카테고리</th>
                    <th style="width: 15%">상태</th>
                    <th style="width: 15%">재고</th>
                  </tr>
                </thead>
                <tbody class="table-body">
                
                <c:choose>
    			<c:when test="${empty products}">
        		  <tr class="order-item" style="height: 60px;">
            		<td class="kr-700" colspan="8" style="text-align: center;">목록이 없습니다.</td>
        		  </tr>
    			</c:when>
    			<c:otherwise>
                <c:forEach var="product" items="${products}">
                  <tr class="order-item">
                    <td>
                      <input class="ms-2" type="checkbox" name="select-item" value="${product.product_id}" onclick="selectItem()" />
                    </td>

                    <td class="kr-700" style="text-align: center">${product.product_id}</td>

                    <td style="width: 10%">
                      <img class="pr-or-img ms-4" src="../${product.img_url}" alt="상품사진" />
                    </td>
                    <td class="order-text">
                      <span class="kr-700" style="font-size: var(--size520)">${product.product_name}</span>
                      <span style="font-size: var(--size400)">${product.brand_name}</span>
                    </td>
                    <td class="kr-700" style="text-align: center">${product.price}원</td>
                    <td class="kr-700" style="text-align: center">${product.area}</td>
                    <td class="kr-700" style="text-align: center">${product.status}</td>
                    <td class="kr-700" style="text-align: center">${product.stock}</td>
                  </tr>
                </c:forEach>
                </c:otherwise>
                </c:choose>
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <nav aria-label="Page navigation example " style="margin-bottom: 150px">
          <ul class="pagination">
            <li class="page-item">
		      <a class="page-link" href="?page=${previousPage}" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
   			  </a>
    		</li>
            
            <c:forEach var="page" begin="${startPage}" end="${endPage}">
            <li class="page-item ${page == currentPage ? 'active' : ''}">
                <a class="page-link" href="?page=${page}">${page}</a>
            </li>
        	</c:forEach>
        	  
            <li class="page-item">
      		  <a class="page-link" href="?page=${nextPage}" aria-label="Next">
        	  	<span aria-hidden="true">&raquo;</span>
      		  </a>
    		</li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</body>

<script>
function stopSellingProducts() {
	// 선택된 상품 체크박스 요소들을 가져옴
    const checkboxes = document.querySelectorAll('input[name="select-item"]:checked');
 	// 선택된 체크박스의 value를 배열로 변환
    const productIds = Array.from(checkboxes).map(checkbox => parseInt(checkbox.value));

    if (productIds.length === 0) {
        alert("판매 중지할 상품을 선택해 주세요.");
        return; // 선택된 상품이 없을 경우 함수를 종료합니다.
    }

    if (!confirm('선택한 상품을 판매 중지하시겠습니까?')) {
        return; // 확인하지 않았으면 함수를 종료합니다.
    }
    
    // 서버로 해당 상품 판매 중지 요청을 보내는 코드
    fetch('/admin/Product-main', {
    	method: 'POST',
    	headers: {
        	'Content-Type': 'application/json'
    	},
    	body: JSON.stringify(productIds)
	})
	.then(response => {
    	if (response.ok) {
        	return response.json(); // JSON 형태로 응답을 받음
    	} else {
        	return response.text().then(text => { throw new Error(text); }); // 에러 메시지를 가져옴
    	}
	})
	.then(data => {
    	alert("선택한 상품이 판매 중지되었습니다.");
    	location.reload();
	})
	.catch((error) => {
    	alert('판매 중지에 실패했습니다: ' + error.message); // 에러 메시지 표시
    	console.error('Error:', error);
	});
}
</script>

</html>