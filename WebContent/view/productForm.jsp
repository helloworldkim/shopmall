<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록 Form</title>
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
    <!-- footer css -->
    <link rel="stylesheet" href="../css/Menu/footerMenu.css">
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
	<!-- productForm js파일 -->
	<script src="../js/productForm.js"></script>
</head>
<body>
<jsp:include page="include/header.jsp"/>
<!-- 작성 form부분 -->
<main>
	<div class="container">
	    <form action="/ProductInsert" method="post" enctype="multipart/form-data">
			<table class="table" style="text-align: center">
				<thead>
					<tr>
						<th colspan="2" style="text-align: center; border: 1px solid black">상품등록</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>상품명</th>
						<td><input type="text" class="form-control" id="productName" name="productName" required="required"></td>
					</tr>
					<tr>
						<th>상품카테고리(한글)</th>
						<td><input type="text" class="form-control" id="productCategory" name="productCategory" placeholder="ex) 티셔츠 or 아우터 등등" required="required"></td>
					</tr>
					<tr>
						<th>간단설명</th>
						<td><input type="text" class="form-control" id="shortDetail" name="shortDetail" required="required"></td>
					</tr>
					<tr>
						<th>등록 가격</th>
						<td><input type="text" class="form-control" id="productPrice" name="productPrice" required="required"></td>
					</tr>
					<tr>
						<th>적용할인율(%제외)</th>
						<td><input type="text" class="form-control" id="productSalePer" name="productSalePer" required="required" placeholder="숫자만입력해주세요"></td>
					</tr>
					<tr>
						<th>할인된 가격</th>
						<td><input type="text" class="form-control" id="productSalePrice" name="productSalePrice" required="required" readonly></td>
					</tr>
					<tr>
						<th>상품 이미지</th>
						<td><input type="file" class="form-control" name="productImg"></td>
					</tr>
				</tbody>
			</table>
			<textarea class="form-control" style="text-align: left; border: 1px solid black; 
			height:350px"name="productDetail" placeholder="상품상세설명" maxlength="2048"></textarea>
			<input type="submit" class="btn btn-primary pull-right" value="작성">
			<input type="reset" class="btn btn-primary pull-right" value="초기화">
			<a href="/Notice" class="btn btn-primary pull-right">게시판</a>
		</form>
	</div>
</main>
<jsp:include page="include/footer.jsp"/>

</body>
</html>