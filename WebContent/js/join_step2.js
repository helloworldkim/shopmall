// 정규표현식
//var phoneReg = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
var phoneReg = /^\d{3}-\d{3,4}-\d{4}$/;
var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

$(function(){
    //입력form 값입력 확인하는부분
    $('#joinBtn').click(function(){
        var userName=$('#userName');
        var userId=$('#userId');
        var userPwd=$('#userPwd');
        var userPwdCheck=$('#userPwdCheck');
        var userPhone=$('#userPhone');
        var userBirth=$('#userBirth');
        var userEmail=$('#userEmail');
        var emailAgree=$("input[name='emailAgreement']:checked");

        if(userName.val()==""){
            alert("이름을 입력해주세요");
            userName.focus();
            return;
        }
        if(userId.val()==""){
            alert("아이디를 입력해주세요");
            userId.focus();
            return;
        }else{
            if(!userId.val().match(idReg)){
                alert("아이디형식에 맞게 입력해주세요");
                userId.focus();
                return;
            }
        }
       
        if(userPwd.val()==""){
            alert("비밀번호를 입력해주세요");
            userPwd.focus();
            return;
        }
        if(userPwdCheck.val()==""){
            alert("비밀번호를 한번더 입력해주세요");
            userPwdCheck.focus();
            return;
        }
        if(userPwd.val()==""&&userPwdCheck.val()==""){
            if(userPwd.val()!==userPwdCheck.val()){
                alert("비밀번호를 동일하게 입력해주세요");
                userPwdCheck.focus();
                return;
            }
        }
        if(userPhone.val()==""){
            alert("전화번호를 입력해주세요");
            userPhone.focus();
            return;
        }
        if(!userPhone.val().match(phoneReg)){
            alert("휴대폰 형식에 맞게 입력해주세요");
            userPhone.focus();
            return;
        }
        if(userBirth.val()==""){
            alert("생년월일을 입력해주세요");
            return;
        }
        if(userEmail.val()==""){
            alert("이메일을 입력해주세요");
            userEmail.focus();
            return;
        }
        if(!userEmail.val().match(emailReg)){
            alert("이메일을 형식에 맞지않습니다");
            userEmail.focus();
            return;
        }
        if(emailAgree.length===0){
            alert("수신여부를 선택해주세요");
            return;
        }
        frm.submit();
    });
});