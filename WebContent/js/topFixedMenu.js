$(function(){
    var win = $(window);
    var header = $('.topSecondNavContainer');
    var headerOffsetTop = header.offset().top;

    //console.log(headerOffsetTop);
    //win.scrollTop() = 스크롤 되는 양
    //스크롤 될때 실행될 메서드
    win.scroll(function(){
        if(win.scrollTop() >= headerOffsetTop){
            header.addClass('sticky');
        }else{
            header.removeClass('sticky');
        }

    });
});