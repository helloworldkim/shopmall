$(function(){
    $('#deleteBtn').click(function(e){
        e.preventDefault();
        //삭제원하는지 다시 물어보고 결과값이 true인경우 실행
        if(!confirm('정말로 삭제하시겠습니까?')){
            return;
        }
        var bbsId=$('#bbsId').text();
        
        $.ajax({
            type:'GET',
		    url:'/NoticeDelete',
		    data:{bbsId:bbsId},
		    success:function(data){
                var result= data.trim();
                console.log(result);
		        if(result==1){ //정상적으로 삭제되었을때
                    alert('해당글이 삭제 되었습니다');
                    location.href='/Notice';
                    return;
		        }else {//삭제안된경우
		            alert('오류가 발생했습니다');
                    return;
		        }
		    },
		    error:function(e){
		        alert(e);
		    }
        });
    });
});