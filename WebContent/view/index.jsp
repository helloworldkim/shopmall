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
    <!-- item을 동적으로 받아오는 js! -->
    <script src="../js/index.js"></script>
    <!--레이어팝업 css -->
    <link rel="stylesheet" href="../css/Menu/mainLayerPopup.css">
    <!--레이어팝업 js  -->
    <script src="../js/mainLayerPopup.js"></script>
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
                <!-- 리스트는 db에서 받아오는중 -->
            </ul>         
        </div>
    </section>
</main>
<!--레이어 팝업부분  -->
<div class="layerContainer">
    <div class="popupBox">
        <div>
            <a><img src="https://atimg.sonyunara.com/files/attrangs/popup/1599715439_0.jpg" alt="레이어이미지"></a>
        </div>
        <div class="closeBtnContainer">
            <div id="todayCloseBtn">오늘하루 그만보기</div>
            <div id="closeBtn">닫기</div>
        </div>
    </div>    
</div>
<%-- <%@ include file="include/footer.jsp" %>   --%>
<jsp:include page="include/footer.jsp"/>
   
    
</body>
</html>