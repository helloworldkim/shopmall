<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <!-- slideshow css -->
    <link rel="stylesheet" href="../css/slideshow.css">
    <!-- topMenu css -->
    <link rel="stylesheet" href="../css/Menu/topMenu.css">
    <!-- MainMenu css -->
    <link rel="stylesheet" href="../css/Menu/mainMenu.css">
    <!-- footerMenu css -->
    <link rel="stylesheet" href="../css/Menu/footerMenu.css">
    <!-- bootstrapcss -->
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <!--join css  -->
    <link rel="stylesheet" href="../css/join/join.css">
    <!-- jquery cdn  -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- jquery ui cdn -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous"></script>
    <!--font aswsome cdn  -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
    <!-- join step1 js -->
    <script src="../js/join_step1.js"></script>
</head>
<body>
<!-- 헤더부분 -->
<header >
        <div class="topContainer">
            <!-- 검색부분 -->
            <div class="searchContainer">
                <input type="text" id="SearchInput">
                <i class="fas fa-search" id='btnSearch'></i>
            </div>
            <!-- 쇼핑몰 메인부분 -->
             <div>
                <a href="index.jsp">
                    <h1>ATTRANGS</h1>
                    <p>IT'S FLOWER MOMENT</p>
                </a>
            </div>
            <!-- 상단 nav bar -->
            <nav class="topNavContainer">
                <a href="">로그인</a>
                <a href="join_step1.jsp">회원가입</a>
                <a href="">마이페이지</a>
                <a href="">고객센터</a>
                <a href="">게시판(소통해요)</a>
                <i class="fas fa-shopping-bag"></i>
                <i class="fas fa-heart"></i>
                <i class="fas fa-star"></i>
            </nav>
        </div>
        <!-- top 두번째 nav부분 -->
        <nav class="topSecondNavContainer">
            <ul class="productList">
                <li><a href="#"><span>베스트아이템</span></a></li>
                <li><a href="#"><span>신상품</span></a></li>
                <li><a href="#"><span>드레스</span></a></li>
                <li><a href="#"><span>블라우스</span></a></li>
                <li><a href="#"><span>아우터</span></a></li>
                <li><a href="#"><span>니트/티셔츠</span></a></li>
                <li><a href="#"><span>스커트</span></a></li>
                <li><a href="#"><span>팬츠</span></a></li>
                <li><a href="#"><span>주얼리</span></a></li>
                <li><a href="#"><span>액세서리</span></a></li>
                <li><a href="#"><span>슈즈</span></a></li>
                <li><a href="#"><span>가방</span></a></li>
            </ul>
        </nav>
</header>
<!-- 메인부분 -->
<main>
    <header class='join_header'>
        <div>    
            <h1>회원가입</h1>
        </div>
        <ol class="flexbox">
        	<li class="flex agree">
        		<i class="far fa-clipboard" style="color: #888888;"></i>
        		<span>01</span>이용약관 동의
        	</li>
        	<li class="flex form">
	        	<i class="fas fa-edit"></i>
	        	<span>02</span>회원정보 입력
        	</li>
        </ol>
    </header>
    <!-- 회원가입폼 -->
    <section class="main_section">
        <form action="register.jsp" id='frm' method="post">
            <fieldset>
            <div class="group">
                <label for="userName">이름</label>
                <input type="text" class="formInput" id="userName" name="userName">
            </div>
            <div class="group userIdGroup">
                <label for="userId">아이디</label>
                <div>
                    <input type="text" class="formInput" id='userId' name="userId" placeholder="영문,숫자 조합">
                    <span id="idCheck" class="idCheckBtn">중복체크</span>
                </div>
            </div>
            <!-- 중복체크전까지는 none상태 -->
            <div class="group" id="checkbox"></div>
            <div class="group">
                <label for="userPwd">비밀번호</label>
                <input type="password" class="formInput" id="userPwd" name="userPwd">
            </div>
            <div class="group">
                <label for="userPwdCheck">비밀번호확인</label>
                <input type="password" class="formInput" id="userPwdCheck" name="userPwdCheck">
            </div>
            <div class="group">
                <label for="userPhone">휴대폰</label>
                <input type="text" class="formInput" id="userPhone" name="userPhone" placeholder="ex 010-2222-0000">
            </div>
            <div class="group">
                <label for="userBirth">생년월일</label>
                <input type="date" class="formInput" id="userBirth" name="userBirth">
            </div>
            <div class="group">
                <label for="userEmail">이메일</label>
                <input type="email" class="formInput" id="userEmail" name="userEmail">
            </div>
            <div class="group">
                <label for="userEmail">메일수신</label>
                <div class="innerGroup">
                    <label>
                        <input type="radio" class="formInput" name="EmailAgree" value="동의">
                        <span>동의</span>
                    </label>
                    <label>
                        <input type="radio" class="formInput" name="EmailAgree" value="거부">
                        <span>거부</span>
                    </label>
                </div>
            </div>
            <!-- 일반회원은 0으로 들어감 -->
            <input type="hidden" name='admin' value="0">
            </fieldset>
            <div class="groupBtn">
                <button class="joinBtn" type="button" id="joinBtn">가입</button>
                <input class="joinBtn" type="reset" value="취소">
            </div>
        </form>
            
    </section>
    
</main>
<!-- 풋터부분 -->
<footer class="footerContainer">
    <div class="footerBox">
        <div class="footerInfo">
            <div class="footerInfoDetail">
                <div class="footerInfoDetailRow">
                    <div>
                        <h1>CUSTOMER CENTER</h1>
                        <p>02-1644-3225<br>
			                            월~금 : am 11 ~ pm 5<br>
			                            점심시간 : pm 12 ~ 1<br>
                            (토/일/공휴일은 휴무)
                        </p>
                    </div>
                    <div style="border-right: 1px solid black; width: 1px; height: 97px; position: absolute; top: 25px; left: 170px;"></div>
                    <div>
                        <h1>BANK INFO</h1>
                        <p>
                            국민 000000-00-000000<br>
                            농협 000-0000-0000-00<br>
                            우리 0000-000-000000<br>
                            예금주 : 에스엔패션그룹(주)
                        </p>
                    </div>
                </div>
                    <p>
                        교환/반품주소지(cj택배이용시) :<br>
                        서울특별시 강남구 논현동 208-2 아뜨랑스[학동로 208]<br>
                        교환/반품주소지(타택배이용시) :<br>
                        서울시 구로구 구로동 237-14 지하1층 아뜨랑스담당
                    </p>
                <div>

                </div>
            </div>
        </div>
        <div class="footerInfoShop">
            <h1>Offline Shop</h1>
            <img src="../img/slider1.jfif" alt="임시이미지">
            <p>Open. am 10 ~ pm 6 이용시간 pm 2 ~ 6 (토/일/공휴일 휴무)<br>
            Address. 서울특별시 성동구 하왕십리동 286-2<br>
            (예약방문만 가능합니다 예약은 1:1문의 게시판을 이용해 주세요)
        </div>
        <div class="footerInfoNotice">
            Notice
        </div>
    </div>
</footer>
    
   
    
</body>
</html>