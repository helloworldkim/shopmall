$(function(){
    $(joinBtn).click(function(){
        var userAgree = $("input[type='radio']:checked");
        //console.log(userAgree);
        if(userAgree.length==0){
            alert("가입진행을 원하시면 약관에 동의해주세요");
            return;
        }
        if(userAgree.length==1){
            alert("모든 약관에 동의하셔야합니다");
            return;
        }
        //2개 모두 동의했을시
        if(userAgree.length==2){
            location.href="join_step2.jsp";
        }
    });
});