<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 검색</title>
<!-- 제이쿼리 cdn -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 우편번호 api script -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- js파일 -->
<script src="../js/zipcodeAPI.js"></script>
</head>
<body>
    <input type="text" id="sample6_postcode" placeholder="우편번호">
    <input type="button" id="zipSearchBtn" value="우편번호 찾기"><br>
    <input type="text" id="sample6_address" placeholder="주소"><br>
    <input type="text" id="sample6_detailAddress" placeholder="상세주소">
    <input type="text" id="sample6_extraAddress" placeholder="참고항목">
    <input type="button" id="sendBtn" value="확인">

</body>
</html>