<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

  <link href="${pageContext.request.contextPath}/resources/img/logo/logo1.png" rel="icon" />
  
  <link href="${pageContext.request.contextPath}/resources/css/style/main.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/bootstrap/css/bootstrap.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/fonts/fonts.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/variables/colors.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/variables/round.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/style/btn.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/css/style/mypageMain.css" rel="stylesheet" />

  <script src="https://kit.fontawesome.com/efcc08af8c.js" crossorigin="anonymous"></script>
  <script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/main.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="${pageContext.request.contextPath}/resources/css/bootstrap/js/zipcode.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
   
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


    <div class="mypage-wrapper my-5">
      <!-- content start -->
      <div class="container mt-5">
        <div class="section-title-in kr-700" style="font-size: var(--size800)">마이페이지</div>
        <hr style="border: 1px solid var(--gray900);transform: scaleY(1.1);opacity: 1;"/>

        <div class="row">
		<!-- sidebar include  -->
		<%@ include file="/WEB-INF/views/common/sidebar.jsp" %>

          <!-- form start -->
          <div class="col-10" style="margin-bottom: 100px">
           <form action="/userModify" method="post" id="getUserInfoForm">
            <div class="d-flex justify-content-between">
              <div class="text-left mt-2">회원정보 수정</div>
              <div class="d-flex">
                <button class="login btn-pro-gr me-5" type="submit">
                  	회원정보 수정
                </button>
                <button class="login btn-pro-gr" type="reset">취소</button>
              </div>
            </div>
            <hr style="border: 1px solid var(--gray600); opacity: 1" />

            <table class="my-4 mt-5">
              <tr>
                <td>아이디</td>
                <td width="600px">
                  <input
                    class="form-control-add ms-4 mb-3"
                    type="text"
                    style="width: 250px; background-color: var(--gray200);"
                    readonly
                    name="username"
                    value="${user.username}"
                    
                  />
                </td>
              </tr>
              <tr>
                <td>비밀번호</td>
                <td>
                  <input
                    class="form-control-add ms-4 mb-3"
                    type="password"
                    style="width: 250px"
                    name="password"
                    id="user_password" 
                  />
                </td>
              </tr>
              <tr>
                <td>비밀번호 확인</td>
                <td>
                  <input
                    class="form-control-add ms-4 mb-3"
                    type="password"
                    style="width: 250px"
                     name="passwordConfirm"
                     id="user_passwordConfirm"
                  />
           
                <span id="passwordCheckMessage" class="ms-4 pb-4"></span>
                 <br>
                </td>
                
              </tr>
              <tr>
                <td width="200px">이름</td>
                <td>
                  <input name="name" value="${user.name}"
                    class="form-control-add ms-4 mb-3"
                    type="text" style="width: 250px; background-color: var(--gray200);" readonly />
                </td>
              </tr>

              <tr>
                <td width="200px">이메일</td>
                <td>
                  <input
                    class="form-control-add ms-4 mb-3"
                    type="text"
                    style="width: 250px"
                    name="email"
                    value="${user.email}"
                  />
                </td>
              </tr>

              <tr>
                <td>우편번호</td>
                <td>
                  <input name="post_num" value="${user.post_num}"
                    class="form-control-add ms-4 mb-3"
                    type="text" placeholder="우편번호"
                    id="sample6_postcode" style="width: 150px" />
                  <input
                    class="btn"
                    style="
                      background: #d1d5db50;
                      font-size: 13.5px;
                      margin-left: 3px;
                    "
                    type="button"
                    onclick="searchZipcode()"
                    value="우편번호찾기"
                  />
                </td>
              </tr>

              <tr>
                <td>주소</td>
                <td class="address">
                  <input
                    type="text"
                    class="form-control-add ms-4"
                    id="sample6_address"
                    style="width: 265px; margin-right: 10px"
                     name="address1"
                     value="${address1}"
                  />
                  <input
                    type="text"
                    class="form-control-add mb-2"
                    id="sample6_extraAddress"
                    placeholder="(비고)"
                    style="width: 120px"
                    name="address2"
                    value="${address2}"
                  />
                  <input
                    type="text"
                    class="form-control-add ms-4"
                    id="sample6_detailAddress"
                    placeholder="상세주소"
                    style="width: 400px"
                    name="address3"
                    value="${address3}"
                  />
                </td>
              </tr>
            </table>
            </form>
          </div>
        </div>
      </div>
	
      <!-- form end -->
    </div>
    <!-- content end -->

    <!-- footer start -->
     <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- FOOTER END-->
    <script type="text/javascript">
    $(document).ready(function() {
        // 비밀번호 확인 일치 여부 확인
        $("#user_passwordConfirm").on("input", function() {
            var password = $("#user_password").val();
            var passwordConfirm = $(this).val();

            if (password === "" || passwordConfirm === "") {
                $("#passwordCheckMessage").text("비밀번호를 입력해주세요").css("color", "var(--warning)").removeClass("success").addClass("error");
            } else if (password === passwordConfirm) {
                $("#passwordCheckMessage").text("비밀번호가 일치합니다").css("color", "var(--success)").removeClass("error").addClass("success");
            } else {
                $("#passwordCheckMessage").text("비밀번호가 일치하지 않습니다").css("color", "var(--error)").removeClass("success").addClass("error");
            }
        });

        // 폼 제출 시 비밀번호 일치 여부 확인
        $("#getUserInfoForm").on("submit", function(event) {
            var password = $("#user_password").val();
            var passwordConfirm = $("#user_passwordConfirm").val();

            if (password === "" || passwordConfirm === "") {
                alert("비밀번호를 입력해주세요.");
                event.preventDefault();  // 제출을 막음
            } else if (password !== passwordConfirm) {
                alert("비밀번호가 일치하지 않습니다.");
                event.preventDefault();  // 제출을 막음
            }
        });
    });
    </script>
    
  </body>
</html>
