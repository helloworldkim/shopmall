<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 Form</title>
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
    <link rel="stylesheet" media="screen and (min-width: 561px)" href="../css/Menu/topMenu.css">
    <!-- footer css -->
    <link rel="stylesheet" media="screen and (min-width: 561px)"  href="../css/Menu/footerMenu.css">
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
    <!-- 반응형 웹을위한 css파일 max-width 560px 헤더-->
    <link rel="stylesheet" media="screen and (max-width: 560px)" href="../css/media/headerAppCss.css" />
    <!-- 반응형 웹을위한 css파일 max-width 560px 풋터  -->
    <link rel="stylesheet" media="screen and (max-width: 560px)" href="../css/media/footerAppCss.css" />
</head>
<body>
<jsp:include page="include/header.jsp"/>
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
<jsp:include page="include/footer.jsp"/>

</body>
</html>