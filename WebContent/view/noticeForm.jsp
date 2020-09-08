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
    <!-- noticeList를 동적으로 받아오는 js파일 -->
    <script src="../js/footNoticeList.js"></script> 
</head>
<body>
<%@ include file="include/header.jsp" %>
<!-- 작성 form부분 -->
<main>
	<div class="container">
	    <form action="/NoticeInsert" method="post">
			<table class="table" style="text-align: center">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center; border: 1px solid black">공지사항 작성</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" name="bbsTitle" placeholder="공지사항 제목"></td>
					</tr>
				</tbody>
			</table>
			<textarea class="form-control" style="text-align: left; border: 1px solid black; 
			height:350px"name="bbsContent" placeholder="공지사항 내용" maxlength="2048"></textarea>
			<input type="submit" class="btn btn-primary pull-right" value="작성">
			<input type="reset" class="btn btn-primary pull-right" value="초기화">
			<a href="/Notice" class="btn btn-primary pull-right">게시판</a>
		</form>
	</div>
</main>
<%@ include file="include/footer.jsp" %>

</body>
</html>