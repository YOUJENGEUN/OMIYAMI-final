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

    <title>OMIYAMI</title>
  </head>

  <body style="background-color: var(--bluegray100)">
    <div class="main-wrapper row">
      <div class="sidebar col-lg-2 px-0">
        <div class="d-flex justify-content-center my-5 logo">
          <a href="/main.html">
            <img class="logo-img" src="../img/logo/logo.png" alt="logo"
          /></a>
        </div>
        <div class="nav-items" id="sidebarMenu">
          <a href="admin.html" class="nav-item kr-500" id="menu1"
            ><i class="fa-solid fa-store"></i> OMIYAMI</a
          >
          <a href="Product-main.html" class="nav-item active kr-500" id="menu2"
            ><i class="fa-solid fa-tags"></i>상품관리</a
          >
          <a href="order-main.html" class="nav-item kr-500" id="menu3"
            ><i class="fa-solid fa-receipt"></i>주문관리</a
          >
          <a href="member-main.html" class="nav-item kr-500" id="menu4"
            ><i class="fa-solid fa-users"></i>회원관리</a
          >
          <a href="post-main.html" class="nav-item kr-500" id="menu5"
            ><i class="fa-solid fa-list-check"></i>게시물관리</a
          >
          <a href="Inquiry-main.html" class="nav-item kr-500" id="menu6"
            ><i class="fa-solid fa-pen-to-square"></i>문의관리</a
          >
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
            style="
              border: 1px solid var(--gray900);
              transform: scaleY(1.1);
              opacity: 1;
            "
          />
        </div>

        <div class="product-container">
          <div class="row d-flex">
            <div class="col section-title kr-700">리뷰 관리</div>

            <button type="button" class="btn btn-l">삭제</button>
          </div>
          <hr class="admin-boder" />

          <div class="order-section mt-3" style="margin-bottom: 30px">
            <div class="tab-content">
              <table>
                <thead class="table-head">
                  <tr class="rw-text">
                    <th>
                      <input
                        type="checkbox"
                        name="selectAll-item"
                        id="checkbtn"
                        onclick="selectAll(this)"
                      />
                    </th>
                    <th>No</th>
                    <th colspan="2" style="width: 25%">상품명</th>
                    <th style="width: 7%">평점</th>
                    <th colspan="3" style="width: 40%">내용</th>
                    <th style="width: 10%">작성자</th>
                    <th style="width: 10%">작성일</th>
                  </tr>
                </thead>
                <tbody class="table-body" style="text-align: center">
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>불만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                  <tr>
                    <td>
                      <input
                        type="checkbox"
                        name="select-item"
                        onclick="selectItem()"
                      />
                    </td>

                    <td>1</td>

                    <td>
                      <img
                        class="rw-img"
                        src="../img/product/1/1-2.jpg"
                        alt="상품사진"
                      />
                    </td>
                    <td class="order-text" style="text-align: left">
                      <span class="kr-700" style="font-size: var(--size400)"
                        >롯카노츠유 미니캔</span
                      >
                      <span style="font-size: var(--size300)">롯카노츠유</span>
                    </td>
                    <td>만족</td>
                    <td colspan="3" style="text-align: left">
                      정말 맛있어요! 겉은 바삭하고 속은 부드럽고 달콤하네요.
                      포장도 깔끔해서 선물용으로 딱 좋습니다. 꼭 다시
                      구매할게요!
                    </td>
                    <td>가길동</td>
                    <td style="font-size: var(--size200)">2024.09.14</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>

          <nav
            aria-label="Page navigation example "
            style="margin-bottom: 150px"
          >
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </body>
</html>
