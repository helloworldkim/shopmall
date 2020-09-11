<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 헤더부분 -->
<header>
        <div class="topContainer">
            <!-- 검색부분 -->
            <div class="searchContainer">
                <input type="text" id="searchInput">
                <i class="fas fa-search" id='btnSearch'></i>
            </div>
            <!-- 쇼핑몰 메인부분 -->
            <div>
                <a href="../view/index.jsp">
                    <h1>ATTRANGS</h1>
                    <p>IT'S FLOWER MOMENT</p>
                </a>
            </div>
            <!-- 상단 nav bar -->
            <nav class="topNavContainer" role='navigation_member'>
			<c:if test="${empty sessionScope.userId}">
            	<a href="../view/login.jsp">로그인</a>
            	<a href="../view/join_step1.jsp">회원가입</a>
            </c:if>
			<c:if test="${not empty sessionScope.userId}">
            	<a href="/UserLogout">로그아웃</a>
			</c:if>
                <div class="dropdown">
                <div class="dropdown-toggle dropdown-container" data-toggle="dropdown">마이페이지</div>
                    <div class="dropdown-menu">
                        <a href="/MyProductList" class="dropdown-item">내가 본 상품목록</a>
                        <a href="#" class="dropdown-item">내 정보수정</a>
                    </div>
                </div>
                <a href="">고객센터</a>
                <a href="">게시판(소통해요)</a>
          	<c:if test="${sessionScope.admin==1}">
                <div class="dropdown">
                <div class="dropdown-toggle dropdown-container" data-toggle="dropdown">관리자페이지</div>
                    <div class="dropdown-menu">
                        <a href="/Notice" class="dropdown-item">공지사항</a>
                        <a href="../view/productForm.jsp" class="dropdown-item">상품등록</a>
                        <a href="#" class="dropdown-item">회원관리</a>
                    </div>
                </div>
                

           	</c:if>
                <i class="fas fa-shopping-bag"></i>
                <i class="fas fa-heart"></i>
                <i class="fas fa-star"></i>
            </nav>
            
        </div>
        <!-- top 두번째 nav부분 -->
        <nav class="topSecondNavContainer" role='navigation_menu'>
            <ul class="dropdown productList">
                <li><a href="/ProductList?category=&title=베스트아이템"><span>베스트아이템</span></a></li>
                <li><a href="/ProductList?category=&title=신상품"><span>신상품</span></a></li>
                <li><a href="/ProductList?category=드레스"><span>드레스</span></a></li>
                <li><a href="/ProductList?category=블라우스"><span>블라우스</span></a></li>
                <li><a href="/ProductList?category=아우터"><span>아우터</span></a></li>
                <div class="dropdown">
                    <div class="dropdown-toggle dropdown-container" data-toggle="dropdown">니트/티셔츠</div>
                        <div class="dropdown-menu">
                            <a href="/ProductList?category=니트" class="dropdown-item"><span>니트</span></a>
                            <a href="/ProductList?category=티셔츠" class="dropdown-item"><span>티셔츠</span></a>
                        </div>
                    </div>
                <li><a href="/ProductList?category=스커트"><span>스커트</span></a></li>
                <li><a href="/ProductList?category=팬츠"><span>팬츠</span></a></li>
                <li><a href="/ProductList?category=주얼리"><span>주얼리</span></a></li>
                <li><a href="/ProductList?category=액세서리"><span>액세서리</span></a></li>
                <li><a href="/ProductList?category=슈즈"><span>슈즈</span></a></li>
                <li><a href="/ProductList?category=가방"><span>가방</span></a></li>
            </ul>
        </nav>
    
</header>