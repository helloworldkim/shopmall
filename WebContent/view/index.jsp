<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ATTRANGS</title>
    <!-- slideshow css -->
    <link rel="stylesheet" href="../css/slideshow.css">
    <!-- topMenu css -->
    <link rel="stylesheet" href="../css/Menu/topMenu.css">
    <!-- MainMenu css -->
    <link rel="stylesheet" href="../css/Menu/mainMenu.css">
    <!-- footer css -->
    <link rel="stylesheet" href="../css/Menu/footerMenu.css">
    <!-- bootstrapcss -->
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <!-- jquery cdn  -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- jquery ui cdn -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous"></script>
    <!--font aswsome cdn  -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
    <!-- slider js -->
    <script src="../js/slideshow.js"></script>
    <!-- top fixed Menu js -->
    <script src="../js/topFixedMenu.js"></script>
</head>
<body>
<!-- 헤더부분 -->
<header>
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
            <nav class="topNavContainer" role='navigation_member'>
            <c:choose>
            <c:when test="${empty sessionScope.userId}">
            	<a href="login.jsp">로그인</a>
           	</c:when>
           	 <c:otherwise>
            	<a href="/UserLogout">로그아웃</a>
           	</c:otherwise>
           	</c:choose>
                <a href="join_step1.jsp">회원가입</a>
                <a href="">마이페이지</a>
                <a href="">고객센터</a>
                <a href="">게시판(소통해요)</a>
          	<c:if test="${sessionScope.admin==1}">
           		<a href="#">관리자페이지</a>
           	</c:if>
                <i class="fas fa-shopping-bag"></i>
                <i class="fas fa-heart"></i>
                <i class="fas fa-star"></i>
            
            </nav>
            
        </div>
        <!-- top 두번째 nav부분 -->
        <nav class="topSecondNavContainer" role='navigation_menu'>
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
    <!-- 슬라이더 부분 -->
    <div class="slideshow">
        <!-- 슬라이더 이미지 부분 -->
        <div class="slideshow_slides">
            <a href=""><img src="../img/slider1.jfif" alt="slide1"></a>
            <a href=""><img src="../img/slider2.jfif" alt="slide2"></a>
            <a href=""><img src="../img/slider3.jfif" alt="slide3"></a>
            <a href=""><img src="../img/slider4.jfif" alt="slide4"></a>
        </div>
        <!-- prev,next 버튼부분 -->
        <div class="slideshow_nav">
            <a href="#" class="prev"><i class="fas fa-chevron-left" alt="prev"></i></a>
            <a href="#" class="next"><i class="fas fa-chevron-right" alt="next"></i></a>
        </div>
        <!-- indicator부분 -->
        <div class="indicator">
        <!--indicator는 javascript로 매번 새로그려짐  -->
        <!--
        	<a href="" class="active">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
        -->
        </div>
    </div>
</header>
<!-- 메인부분 -->
<main>
    <header>
        <div class="mainHeader">    
            <h1>Best Item</h1>
        </div>
    </header>
    <!-- 아이템 리스트부분 -->
    <section>
        <div>
            <ul class="productsUl">
                <li class="productsList">
                    <div class="img">
                        <a href="#"><img src="../img/slider1.jfif" alt="임시이미지"></a>
                    </div>
                    <div class="info">
                        <h2>상품명</h2>
                        <p>설명</p>
                        <p>가격</p>
                    </div>
                </li>
                <li class="productsList">
                    <div class="img">
                        <a href="#"><img src="../img/slider1.jfif" alt="임시이미지"></a>
                    </div>
                    <div class="info">
                        <h2>상품명</h2>
                        <p>설명</p>
                        <p>가격</p>
                    </div>
                </li>
                <li class="productsList">
                    <div class="img">
                        <a href="#"><img src="../img/slider1.jfif" alt="임시이미지"></a>
                    </div>
                    <div class="info">
                        <h2>베스트상품 아우터</h2>
                        <p>가격이 가장싼 제품</p>
                        <p>19000원</p>
                    </div>
                </li>
                <li class="productsList">
                    <div class="img">
                        <a href="#"><img src="../img/slider1.jfif" alt="임시이미지"></a>
                    </div>
                    <div class="info">
                        <h2>상품명</h2>
                        <p>설명</p>
                        <p>가격</p>
                    </div>
                </li>
            </ul>         
        </div>
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