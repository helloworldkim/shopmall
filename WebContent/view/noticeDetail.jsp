<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상세보기</title>
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
    <!-- noticeDetle js파일 -->
    <script src="../js/noticeDelete.js"></script>
</head>
<body>
<jsp:include page="include/header.jsp"/>
<!-- NoticeDetail부분 -->
<main>
<div class="container">
    <h1 style="text-align: center; border: 1px solid black">공지사항 게시글</h1>
		<div class="row">
		<table class="table table-hover" style="text-align: center">
			<tbody>
				<tr>
					<%-- <td>글번호<br><%=request.getAttribute("bbsId")%></td> --%>
                    <th>글번호</th>
                    <td id="bbsId" colspan="3" style="text-align: left;">${bbsId}</td>
				</tr>
				<tr>
					<%-- <td>조회수<br><%=request.getAttribute("bbsHit")%></td> --%>
                    <th>조회수</th>
                    <td colspan="3" style="text-align: left;">${bbsHit}</td>
				</tr>
				<tr>
				<%-- 	<td>작성자<br><%=request.getAttribute("bbsUserId")%></td> --%>
                    <th>작성자</th>
                    <td colspan="3" style="text-align: left;">${bbsAdminId}</td>
				</tr>
				<tr>
					<%-- <td>게시글<br><%=request.getAttribute("bbsTitle")%></td> --%>
                    <th>게시글</th>
                    <td colspan="3" style="text-align: left;">${bbsTitle}</td>
				</tr>
				<tr>
				<%-- 	<td>작성시간<br><%=request.getAttribute("bbsDate")%></td> --%>
                        <c:set var="date" value="${bbsDate}" scope="page"></c:set>
                        <th>작성시간</th>
						<td colspan="3" style="text-align: left;">${fn:substring(date,0,11)} ${fn:substring(date,11,13)}시 ${fn:substring(date,14,16)}분</td>
					<%-- <td>작성시간<br>${bbsDate}</td> --%>
                </tr>
                <!-- textarea 내용 출력부분 -->
				<tr>
				<%-- <td colspan="2" style="min-height: 200px; text-align: left;"><%=request.getAttribute("bbsContent")%></td> --%>
					<td colspan="2" style="min-height: 500px; border: 1px solid black; text-align: left;">${bbsContent}</td>
                </tr>
                <tr>
                    <th>이전글</th>
                    <td colspan="3" style="text-align: left;"><a href="/NoticeDetail?bbsId=${prevNotice.bbsId}">${prevNotice.bbsTitle}</a></td>
                </tr>
                <tr>
                    <th>다음글</th>
                    <td colspan="3" style="text-align: left;"><a href="/NoticeDetail?bbsId=${nextNotice.bbsId}">${nextNotice.bbsTitle}</a></td>
                </tr>
			</tbody>
			</table>
		<c:if test="${sessionScope.admin==1}">
			<a href="#" class="btn btn-primary pull-right">수정</a>
			<a href="" id='deleteBtn' class="btn btn-primary pull-right">삭제</a>
		</c:if>
			<a href="/Notice" class="btn btn-primary pull-right">게시판</a>
		</div>
	</div>
</main>
<jsp:include page="include/footer.jsp"/>
</body>
</html>