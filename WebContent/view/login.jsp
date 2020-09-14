<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <!--bootsrtap dropdown 적용을 위해 가져온코드  -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
   	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <!-- bootstrapcss -->
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <!-- topMenu css -->
    <link rel="stylesheet" media="screen and (min-width: 561px)"  href="../css/Menu/topMenu.css">
    <!-- MainMenu css -->
    <link rel="stylesheet" href="../css/Menu/mainMenu.css">
    <!-- footerMenu css -->
    <link rel="stylesheet" media="screen and (min-width: 561px)"  href="../css/Menu/footerMenu.css">
    <!--join css  -->
    <link rel="stylesheet" href="../css/join/join.css">
    <!-- jquery cdn  -->
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- jquery ui cdn -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous"></script>
    <!--font aswsome cdn  -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
    <!-- login js -->
    <script src="../js/login.js"></script>
    <!-- noticeList를 동적으로 받아오는 js파일 -->
    <script src="../js/footNoticeList.js"></script>
    <!-- 반응형 웹을위한 css파일 max-width 560px 헤더-->
    <link rel="stylesheet" media="screen and (max-width: 560px)" href="../css/media/headerAppCss.css" />
    <!-- 반응형 웹을위한 css파일 max-width 560px 풋터  -->
    <link rel="stylesheet" media="screen and (max-width: 560px)" href="../css/media/footerAppCss.css" />
</head>
<body>
<jsp:include page="include/header.jsp"/>
<!-- 메인부분 -->
<main>
    <header class='join_header'>
        <div>    
            <h1>로그인</h1>
        </div>
    </header>
    <section class="main_section">
        <form action="/UserLogin" id='frm' method="post">
            <div class="form-group">
                <label for="userid">아이디:</label>
                <input type="text" class="form-control" id='userId' name="userId">
            </div>
            <div class="form-group">
                <label for="">비밀번호:</label>
                <input type="password" class="form-control" id="userPwd" name="userPwd">
            </div>
            <div class="loginBtnContainer">
                <button class="joinBtn" type="button" id="joinBtn">로그인</button>
                <input type="reset" class="joinBtn" value="취소">
            </div>
        </form>
            
    </section>
    
</main>
<jsp:include page="include/footer.jsp"/>%>
    
   
    
</body>
</html>