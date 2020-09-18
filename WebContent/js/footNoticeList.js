function createLiTag(item){
    return `<a href='/NoticeDetail?bbsId=${item.bbsId}'>
			<li class='noticeList'>${item.bbsTitle}</li>
			</a>`
}
$(function(){
    $.ajax({
        type:"post",
        url:'/Notice',
        data:{},
		    success:function(data){
                var target = $('#noticeListContainer');
				var noSpaceData = data.trim();
                var parsed = JSON.parse(noSpaceData); //parse하는부분
                var result = parsed.jarr;	//해당데이터 불러오는 키값 arr
                //console.log(result);
                target.html(result.map(item => createLiTag(item)).join(''));
		    },
		    error:function(e){
		        alert(e);
		    }
    });

});