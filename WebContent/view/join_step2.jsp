<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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
    <script src="../js/join_step2.js"></script>
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
        <form action="/UserRegister" id='frm' method="post">
            <fieldset>
            <div class="group">
                <label for="userName">이름</label>
                <input type="text" class="formInput" id="userName" name="userName">
            </div>
            <div class="group">
                <label for="userId">아이디</label>
                <div class="input-group mb-3">
                    <input type="text" class="formInput input-group-append" id='userId' name="userId" placeholder="영문,숫자 조합">
                    <span id="idCheckBtn" class="checkBtn input-group-append">중복체크</span>
                </div>
            </div>
            <!-- 중복체크전까지는 none상태 -->
            <div id="checkbox"></div>
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
                <label for="userZipcode">우편번호</label>
                <div class="input-group mb-3">
                     <input type="email" class="formInput" id="userZipcode" name="userZipcode">
                     <span id="zipcodeCheckBtn" class="checkBtn input-group-append">조회하기</span>
                </div>
            </div>
            <div class="group">
                <label for="userAddress">주소</label>
                <input type="email" class="formInput" id="userAddress" name="userAddress">
            </div>
            
            <div class="group">
                <label for="userEmail">메일수신</label>
                <div class="innerGroup">
                    <label>
                        <input type="radio" class="formInput" name="emailAgreement" value="Y">
                        <span>동의</span>
                    </label>
                    <label>
                        <input type="radio" class="formInput" name="emailAgreement" value="N">
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
<jsp:include page="include/footer.jsp"/>
    
   
    
</body>
</html>