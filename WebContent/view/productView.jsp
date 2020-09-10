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
    <!-- top fixed Menu js -->
    <script src="../js/topFixedMenu.js"></script>
    <!-- noticeList를 동적으로 받아오는 js파일 -->
    <script src="../js/footNoticeList.js"></script>
    <!-- productView css파일 -->
    <link rel="stylesheet" href="../css/product/productView.css">
</head>
<body>
<%-- <%@ include file="include/header.jsp" %>
<%@ include file="include/slider.jsp" %> --%>
<jsp:include page="include/header.jsp"/>
<!-- 메인부분 -->
<main>
   <section class="container my-5">
   <c:set var="p" value="${product}"/>
        <div class="productContainer">
            <div class="imgBox">
                <img src="../product/${p.productImg}"alt="상품이미지">
            </div>
            <div class="productBuyInfo">
                <div>
                    <h3 class="productName">${p.productId} ${p.productName}</h1>
                </div>
                <div class="priceBox">
                    <p>
                        <span class="salePersent">${p.productSalePer}%</span>
                        <span class="salePrice">${p.productSalePrice}</span>원
                        <span class="price">${p.productPrice}원</span>
                    </p>
                </div>
                <div>
                    <table>
                        <tbody>
                        <tr>
                            <th>혜택</th>
                            <td>구매혜택</td> 
                            <td>무이자할부</td> 
                            <td>적립금 지급</td> 
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <th>지원색상</th>
                            <td>red</td> 
                            <td>white</td> 
                            <td>black</td> 
                        </tr>
                    </table>
                </div>
                <div>
                    <table>
                        <tr>
                            <th>사이즈</th>
                            <td>Free</td> 
                            <td>small</td>
                            <td>XL</td> 
                            <td>XLL</td> 
                        </tr>
                    </table>
                </div>
                <div>상품수량 및 사이즈 색상 설정등</div>
                <div>총금액</div>
                <div class="buyingBox"><a href="#" class="productBuyBtn">구매하기</a></div>
            </div>
        </div>
    </section>
    <!--${p.productId},${p.productName},${p.shortDetail}  -->
</main>
<%-- <%@ include file="include/footer.jsp" %>   --%>
<jsp:include page="include/footer.jsp"/>
   
    
</body>
</html>