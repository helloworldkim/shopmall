$(function(){
    var container = $('.slideshow');
    var slideGroup = container.find('.slideshow_slides');
    var slides = slideGroup.find('a');
    var nav = container.find('.slideshow_nav');
    var indicator = container.find('.indicator');
    var slideCount = slides.length; //이미지 a의 갯수
    var indicatorHTML = "";
    var currentIndex = 0%slideCount;
    var duration = 500;
    var easing = 'easeInOutExpo';
    var interval = 3000; //
    //슬라이드마다 할일 slides, left 0%, 100% , 200%, 300% 옆으로 나열하는부분
    slides.each(function(i){
        var newLeft = i*100+'%';
        $(this).css({left:newLeft});
        indicatorHTML += '<a href="">'+(i+1)+'</a>';
    })
    //indicator 기본값 넣음
    indicator.html(indicatorHTML);
    indicator.find('a').eq(0).addClass('active');
    
    //슬라이드 이동함수
    function goToSlide(index){
        //i =0 left=0%, i=1 left=-100%, i=2 left=-200%
        slideGroup.animate({left:-100*index+'%'},duration,easing);
        currentIndex=index;
        //모든요소에서 active클래스 제거 후 원하는 곳에만 추가
        // indicator.find('a').removeClass('active');
        // indicator.find('a').eq(currentIndex).addClass('active');
        indicator.find('a').eq(currentIndex).addClass('active').siblings().removeClass('active');

    }
    //처음인지 마지막인지 검사하는메서드
    //처음이면 currentIndex = 0; 마지막이면 slideCount-
    
    //인디케이터로 이동함수
    indicator.find('a').click(function(e){
        e.preventDefault();
        //인덱스 구하기
        var idx= $(this).index();
        goToSlide(idx);
    });
    /*
    //이전버튼 클릭으로 이동
    nav.find('.prev').click(function(e){
        e.preventDefault();
        goToSlide(curre;ntIndex-1)
    });
    //다음버튼 클릭으로 이동
    nav.find('.next').click(function(e){
        e.preventDefault();
        goToSlide(currentIndex+1);
    });*/

    //한개로 합친버전
    nav.find('a').click(function(e){
        e.preventDefault();
        if($(this).hasClass('prev')){
            if(currentIndex==0){
                goToSlide(slideCount-1);
                return;
            }
            goToSlide(currentIndex-1)
        }else{
            if(currentIndex==slideCount-1){
                goToSlide(0);//첫번째로
                return;
            }
            goToSlide(currentIndex+1);
        }
    });
    //자동슬라이드 함수
    function startTimer(){
        timer = setInterval(function(){
            var nextIndex = (currentIndex+1)%slideCount;
            goToSlide(nextIndex);
        },interval);
    }
    startTimer();
    //멈춤 함수
    function stopTimer(){
        clearInterval(timer);
    }

    container.mouseenter(function(){
        stopTimer();
    }).mouseleave(function(){
        startTimer();
    });

});