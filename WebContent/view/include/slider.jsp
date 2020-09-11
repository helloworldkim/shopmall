<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 슬라이더 부분 -->
    <div class="slideshow">
        <!-- 슬라이더 이미지 부분 -->
        <div class="slideshow_slides">
            <div class="slidebox">
                <a href=""><img id="slide1" src="https://atimg.sonyunara.com/files/attrangs/new_banner/1598580298_0.jpg" alt="slide1"></a>
                <a href=""><img id="slide2" src="https://atimg.sonyunara.com/files/attrangs/new_banner/1592449894_0.jpg" alt="slide2"></a>
            </div>
            <div class="slidebox">
                <a href=""><img id="slide3" src="https://atimg.sonyunara.com/files/attrangs/new_banner/1599218900_0.jpg" alt="slide3"></a>
                <a href=""><img id="slide4" src="https://atimg.sonyunara.com/files/attrangs/new_banner/1599699047_0.jpg" alt="slide4"></a>
            </div>
            <div class="slidebox">
                <a href=""><img id="slide3" src="https://atimg.sonyunara.com/files/attrangs/new_banner/1599525078_0.jpg" alt="slide5"></a>
                <a href=""><img id="slide4" src="https://atimg.sonyunara.com/files/attrangs/new_banner/1598405738_0.jpg" alt="slide6"></a>
            </div>
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
    <c:if test="${sessionScope.admin==1}">
    <div>
        <h1>슬라이더 변경 미리보기</h1>
        <div>슬라이드 번호</div>
        <input type="text" id="slideNumber">
        <div>파일 url주소 또는 경로</div>
        <input type="text" id="slideURL">
        <button id="slideChangeBtn">미리보기</button>
    </div>
    </c:if>