<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

  <link href="../img/logo/logo1.png" rel="icon" />

  <link href="/css/bootstrap/css/bootstrap.css" rel="stylesheet" />
  <link href="/css/fonts/fonts.css" rel="stylesheet" />
  <link href="/css/variables/round.css" rel="stylesheet" />
  <link href="/css/style/btn.css" rel="stylesheet" />
  <link href="/css/style/admin.css" rel="stylesheet" />
  <link href="/css/variables/colors.css" rel="stylesheet" />

  <script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
  <script src="/css/bootstrap/js/admin.js"></script>
  <script src="/css/bootstrap/js/bootstrap.js"></script>

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
        <a href="admin.html" class="nav-item kr-500" id="menu1"><i class="fa-solid fa-store"></i> OMIYAMI</a>
        <a href="Product-main.html" class="nav-item active kr-500" id="menu2"><i class="fa-solid fa-tags"></i>상품관리</a>
        <a href="order-main.html" class="nav-item kr-500" id="menu3"><i class="fa-solid fa-receipt"></i>주문관리</a>
        <a href="member-main.html" class="nav-item kr-500" id="menu4"><i class="fa-solid fa-users"></i>회원관리</a>
        <a href="post-main.html" class="nav-item kr-500" id="menu5"><i class="fa-solid fa-list-check"></i>게시물관리</a>
        <a href="Inquiry-main.html" class="nav-item kr-500" id="menu6"><i class="fa-solid fa-pen-to-square"></i>문의관리</a>
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
          <div class="col section-title kr-700">공지사항 작성</div>
        </div>
        <hr class="admin-boder" />

        <div class="product-info-container">
          <div class="card-section">
            <div class="card3">
              <div class="kr-600">
                <p>공지사항 제목</p>
                <input class="form-control" type="text" placeholder="제목을 입력해주세요" />
              </div>
            </div>
            <div class="card2">
              <div class="kr-600">
                <p>공지사항 목록</p>
                <select class="form-select" style="width: 150px" name="announc-list" id="announc-List">
                  <option value="1">선택해주세요</option>
                  <option value="&#91;일반 공지&#93;">
                    &#91;일반 공지&#93;
                  </option>
                  <option value="[이벤트공지]">[이벤트공지]</option>
                  <option value="[시스템공지]">[시스템공지]</option>
                </select>
              </div>
            </div>
          </div>

          <div class="card2">
            <div class="kr-600">
              <p>공지 내용</p>
              <textarea class="form-control" id="product-description" rows="20" style="resize: none"></textarea>
            </div>
          </div>
        </div>
        <div class="d-flex justify-content-center" style="margin-bottom: 100px">
          <button type="button" class="btn btn-l me-5" id="go-back">
            목록가기
          </button>
          <button type="button" class="btn btn-l">작성하기</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    document.getElementById("go-back").addEventListener("click", () => {
      window.history.back();
    });
  </script>
</body>

</html>