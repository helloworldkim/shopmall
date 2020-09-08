<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 헤더부분 -->
<header>
        <div class="topContainer">
            <!-- 검색부분 -->
            <div class="searchContainer">
                <input type="text" id="SearchInput">
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
            <c:choose>
            <c:when test="${empty sessionScope.userId}">
            	<a href="../view/login.jsp">로그인</a>
           	</c:when>
           	 <c:otherwise>
            	<a href="/UserLogout">로그아웃</a>
           	</c:otherwise>
           	</c:choose>
                <a href="../view/join_step1.jsp">회원가입</a>
                <a href="">마이페이지</a>
                <a href="">고객센터</a>
                <a href="">게시판(소통해요)</a>
          	<c:if test="${sessionScope.admin==1}">
           		<a href="#">관리자페이지</a>
           	</c:if>
                <i class="fas fa-shopping-bag"></i>
                <i class="fas fa-heart"></i>
                <i class="fas fa-star"></i>
            </nav>
            
        </div>
        <!-- top 두번째 nav부분 -->
        <nav class="topSecondNavContainer" role='navigation_menu'>
            <ul class="productList">
                <li><a href="#"><span>베스트아이템</span></a></li>
                <li><a href="#"><span>신상품</span></a></li>
                <li><a href="#"><span>드레스</span></a></li>
                <li><a href="#"><span>블라우스</span></a></li>
                <li><a href="#"><span>아우터</span></a></li>
                <li><a href="#"><span>니트/티셔츠</span></a></li>
                <li><a href="#"><span>스커트</span></a></li>
                <li><a href="#"><span>팬츠</span></a></li>
                <li><a href="#"><span>주얼리</span></a></li>
                <li><a href="#"><span>액세서리</span></a></li>
                <li><a href="#"><span>슈즈</span></a></li>
                <li><a href="#"><span>가방</span></a></li>
            </ul>
        </nav>
    
</header>