function createLiTag(item){
    return `<a href='/NoticeDetail?bbsId=${item.bbsId}'>
			<li class='noticeList'>${item.title}</li>
			</a>`
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
                console.log(data);
                target.html(parsed.map(item => createLiTag(item)).join(''));
		    },
		    error:function(e){
		        alert(e);
		    }
    });

});