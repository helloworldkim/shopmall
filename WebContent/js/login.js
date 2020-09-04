$(function(){
    $('#joinBtn').click(function(){
        var userId = $('#userId').val();
        var userPwd = $('#userPwd').val();
        if(userId==""||userPwd==""){
            alert("아이디 또는 비밀번호를 입력해주셔야합니다");
            return;
        }
        frm.submit();
    });
});