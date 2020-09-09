<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ATTRANGS</title>
    <!--bootsrtap dropdown 적용을 위해 가져온코드  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
   	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <!-- bootstrapcss -->
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <!-- slideshow css -->
    <link rel="stylesheet" href="../css/slideshow.css">
    <!-- topMenu css -->
    <link rel="stylesheet" href="../css/Menu/topMenu.css">
    <!-- MainMenu css -->
    <link rel="stylesheet" href="../css/Menu/mainMenu.css">
    <!-- footer css -->
    <link rel="stylesheet" href="../css/Menu/footerMenu.css">
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
    <!-- noticeList를 동적으로 받아오는 js파일 -->
    <script src="../js/footNoticeList.js"></script>
</head>
<body>
<%-- <%@ include file="include/header.jsp" %>
<%@ include file="include/slider.jsp" %> --%>
<jsp:include page="include/header.jsp"/>
<jsp:include page="include/slider.jsp"/>
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
<%-- <%@ include file="include/footer.jsp" %>   --%>
<jsp:include page="include/footer.jsp"/>
   
    
</body>
</html>