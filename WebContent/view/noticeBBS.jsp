<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <!-- top fixed Menu js -->
    <script src="../js/topFixedMenu.js"></script>
    <!-- noticeBBS js 파일 -->
    <script src="../js/noticeBBS.js"></script>
    <!-- noticeList를 동적으로 받아오는 js파일 -->
    <script src="../js/footNoticeList.js"></script>
</head>
<body>
<%@ include file="include/header.jsp" %>
<!-- 게시판부분 -->
<main>
    <div class="container">
    <h1 style="text-align: center; margin: 20px auto;">공지사항</h1>
		<div class="row">
			<table class="table table-hover"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="l" items="${noticeList}">
					<tr>
						<td>${l.bbsId}</td>
						<td><a href="./NoticeDetail?bbsId=${l.bbsId}">${l.bbsTitle}</a>
						</td>
						<%-- <td>${l.bbsDate}</td> --%>
						<c:set var="date" value="${l.bbsDate}" scope="page"></c:set>
						<td>${l.bbsAdminId}</td>
						<td>${fn:substring(date,0,11)}</td>	
						<td>${l.bbsHit}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
        </div>
        <!--관리자로 로그인된 경우에만 작성가능하도록 설정  -->
        <c:if test="${sessionScope.admin==1}">
        <!-- 누르면 noticeForm.jsp 파일로 가도록 설정됨 -->
			<button class="btn btn-primary pull-right" type="button" id="noticeBtn">작성하기</button>
       	</c:if>
	</div>
</main>
<%@ include file="include/footer.jsp" %>

</body>
</html>