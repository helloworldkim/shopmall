function createLiTag(item){
    return `<a href='/NoticeDetail?bbsId=${item.bbsId}'><li>${item.title}</li></a>`
}
$(function(){
    $.ajax({
        type:"post",
        url:'/Notice',
        data:{},
		    success:function(data){
                var target = $('#noticeListContainer');
                var parsed = JSON.parse(data);
                //console.log(parsed);
                target.html(parsed.map(item => createLiTag(item)).join(''));
		        
		    },
		    error:function(e){
		        alert(e);
		    }
    });

});