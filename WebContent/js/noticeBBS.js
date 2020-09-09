$(function(){
    //작성하기 버튼 누를때 실행되는 메서드
    $('#noticeBtn').click(function(){
        location.href='./view/noticeForm.jsp';
    });
    //게시판 페이징 active 클래스 추가하는 부분
    var pageNum = $("#pageNumHidden").val();
    var pageUl = $('#paginationUl');
    var pageLi = pageUl.find('.noticeList');
    //순서 0 1 2 3 4 eq순서
    if(pageNum%5==0){
        //나눠떨어질경우 마지막 li에 active클래스 추가하면됨
        pageLi.eq(pageLi.length-1).addClass('active');
    }else{
        pageLi.eq(pageNum%5-1).addClass('active');
    }
    
});