//empty를 검사하는 함수 null체크 부분
const empty = (value) => { 
    if (value === null) return true 
    if (typeof value === 'undefined') return true 
    if (typeof value === 'string' && value === '') return true 
    if (Array.isArray(value) && value.length < 1) return true 
    if (typeof value === 'object' && value.constructor.name === 'Object' && Object.keys(value).length < 1 && Object.getOwnPropertyNames(value) < 1) return true
    if (typeof value === 'object' && value.constructor.name === 'String' && Object.keys(value).length < 1) return true
     // new String() return false
     }
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
        var userZipcode=$('#userZipcode');
        var userAddress=$('#userAddress');
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
        if(empty(userZipcode.val())){
            alert('우편번호를 조회해주세요');
            userZipcode.focus();
            return;
        }else if(!$.isNumeric(userZipcode.val())){
            alert('우편번호가 잘못되었습니다');
            userZipcode.focus();
            return;
        }
        if(userAddress.val()==""){
            alert('주소를 입력해주세요');
            userAddress.focus();
            return;
        }
        if(emailAgree.length===0){
            alert("수신여부를 선택해주세요");
            return;
        }
        frm.submit();
    });
    //우편번호 팝업 띄우는 부분
    $("#zipcodeCheckBtn").click(function(){
        window.open("zipCheck.jsp","_blank","width=700 height=400")
    });
    var checkbox = $('#checkbox');
    //기본값 로드됬을때 hide상태
    checkbox.hide();
    //아이디 중복체크 부분
    $('#idCheckBtn').click(function(){
        var userId = $('#userId').val();
        $.ajax({
            type:'POST',
		    url:'/UserIdCheck',
		    data:{userId:userId},
		    success:function(data){
                var result= data.trim();
                console.log(result);
		        if(result==1){ //중복된 아이디 있을때
		            checkbox.css("color","red");
                    checkbox.text("중복된 아이디입니다");
                    checkbox.show();
		        }else {//없을때
		            checkbox.css("color","blue");
                    checkbox.text("사용가능합니다");
                    checkbox.show();
		        }
		    },
		    error:function(e){
		        alert(e);
		    }
        });
    });
});