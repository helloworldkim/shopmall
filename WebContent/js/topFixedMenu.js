$(function(){
    // 반응형으로 560px이상일경우에만 상단 fix하도록 설정
    if(screen.width>560){
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
    }
    
});