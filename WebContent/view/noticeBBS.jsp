<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
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
    <link rel="stylesheet" media="screen and (min-width: 561px)"  href="../css/Menu/topMenu.css">
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
    <!-- noticeBBS js 파일 -->
    <script src="../js/noticeBBS.js"></script>
    <!-- noticeList를 동적으로 받아오는 js파일 -->
	<script src="../js/footNoticeList.js"></script>
	<!-- 반응형 웹을위한 css파일 max-width 560px 헤더-->
    <link rel="stylesheet" media="screen and (max-width: 560px)" href="../css/media/headerAppCss.css" />
    <!-- 반응형 웹을위한 css파일 max-width 560px 풋터  -->
    <link rel="stylesheet" media="screen and (max-width: 560px)" href="../css/media/footerAppCss.css" />
</head>
<body>
<jsp:include page="include/header.jsp"/>
<!-- 게시판부분 -->
<main>
    <div class="container">
    <h1 style="text-align: center; margin: 20px auto;">공지사항</h1>
		<div class="row">
			<table class="table table-hover"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<c:set value="${param.sort}" var="sort"/>
					<tr>
						<c:choose>
						<c:when test="${sort.equals('numAsc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=numDesc">번호↑</a>
							</th>
						</c:when>
						<c:when test="${sort.equals('numDesc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=numAsc">번호↓</a>
							</th>
						</c:when>
						<c:otherwise>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=numDesc">번호</a>
							</th>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${sort.equals('titleDesc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=titleAsc">제목↓</a>
							</th>
						</c:when>
						<c:when test="${sort.equals('titleAsc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=titleDesc">제목↑</a>
							</th>
						</c:when>
						<c:otherwise>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=titleDesc">제목</a>
							</th>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${sort.equals('adminDesc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=adminAsc">작성자↓</a>
							</th>
						</c:when>
						<c:when test="${sort.equals('adminAsc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=adminDesc">작성자↑</a>
							</th>
						</c:when>
						<c:otherwise>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=adminDesc">작성자</a>
							</th>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${sort.equals('ndateDesc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=ndateAsc">작성일↓</a>
							</th>
						</c:when>
						<c:when test="${sort.equals('ndateAsc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=ndateDesc">작성일↑</a>
							</th>
						</c:when>
						<c:otherwise>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=ndateDesc">작성일</a>
							</th>
						</c:otherwise>
						</c:choose>
						<c:choose>
						<c:when test="${sort.equals('nhitDesc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=nhitAsc">조회수↓</a>
							</th>
						</c:when>
						<c:when test="${sort.equals('nhitAsc')}">
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=nhitDesc">조회수↑</a>
							</th>
						</c:when>
						<c:otherwise>
							<th style="background-color: #eeeeee; text-align: center;">
								<a href="?sort=nhitDesc">조회수</a>
							</th>
						</c:otherwise>
						</c:choose>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="l" items="${noticeList}">
					<tr>
						<td>${l.bbsId}</td>
						<td><a href="./NoticeDetail?bbsId=${l.bbsId}">${l.bbsTitle}</a></td>
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
        <!--페이징 부분  -->
        <c:set var="pageNumber" value="${(empty param.pageNumber)?1:(param.pageNumber)}"/>
        <!--보여질 페이지수 5개  -->
        <c:set var="startNumber" value="${pageNumber-(pageNumber-1)%5}"/>
		<c:set var="lastNumber" value="${lastNumber}"/>
		<input type="hidden" id="pageNumHidden" value="${(empty param.pageNumber)?1:(param.pageNumber)}">
		<div class="container paginationbox">
			<ul class="pagination" id="paginationUl">
				<c:if test="${pageNumber>startNumber}">
					<li class="page-item">
						<a href="?pageNumber=${pageNumber-1}&sort=${sort}" class="page-item">이전</a>
					</li>
				</c:if>
				<c:if test="${pageNumber-1<1}">
					<li class="page-item">
						<a class="page-item" onclick="alert('이전페이지가 없습니다')">이전</a>
					</li>
				</c:if>
				<c:forEach var="i" begin="0" end="4">
					<li class="page-item noticeList"><a href="?pageNumber=${startNumber+i}&sort=${sort}">${startNumber+i}</a>
				</c:forEach>
				<c:if test="${pageNumber+1<=lastNumber}">
					<li class="page-item">
						<a href="?pageNumber=${pageNumber+1}&sort=${sort}" class="page-item">다음</a>
					</li>
				</c:if>
				<c:if test="${pageNumber+1>lastNumber}">
					<li class="page-item">
						<a class="page-item" onclick="alert('다음페이지가 없습니다')">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
        <!--관리자로 로그인된 경우에만 작성가능하도록 설정  -->
        <c:if test="${sessionScope.admin==1}">
        	<!-- 누르면 noticeForm.jsp 파일로 가도록 설정됨 -->
			<button class="btn btn-primary pull-right" type="button" id="noticeBtn">작성하기</button>
       	</c:if>
	</div>
</main>
<jsp:include page="include/footer.jsp"/>

</body>
</html>