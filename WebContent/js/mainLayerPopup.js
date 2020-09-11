$(function () {
    if(getCookie("layerPopup") !="Y"){
        $(".layerContainer").show();
    }
    //일반 닫기버튼 누를시 레이어팝업 display none
    $('#closeBtn').click(function () {
        $('.layerContainer').hide();
    });
    //오늘하루 안보기!
    $('#todayCloseBtn').click(function () {
        setCookie('layerPopup', 'Y' , 1 );
        $('.layerContainer').hide();
    });
});
function setCookie(name, value, expiredays)
{
    var todayDate = new Date();
    todayDate.setDate(todayDate.getDate() + expiredays);
    document.cookie = name + '=' + escape(value) + '; path=/; expires=' + todayDate.toGMTString() + ';'
}
//쿠키 불러오기
function getCookie(name)
{
    var obj = name + "=";
    var x = 0;
    while (x <= document.cookie.length)
    {
        var y = (x + obj.length);
        if (document.cookie.substring(x, y) == obj)
        {
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1)
                endOfCookie = document.cookie.length;
            return unescape(document.cookie.substring(y, endOfCookie));
        }
        x = document.cookie.indexOf(" ", x) + 1;
        if (x == 0)
            break;
    }
    return "";
}