$(function(){
    $("#productSalePer,#productPrice").keyup(function(){
        priceCalc();
    });
});
//할인율 활용해서 가격계산하는 메서드
function priceCalc(){
    var productPrice = $("#productPrice").val(); //17000
    var salePersent = $("#productSalePer").val(); //15퍼
    var salePrice = productPrice*salePersent/100;
    var realPrice = productPrice - salePrice;
    
    var salePriceBox = $("#productSalePrice");
    salePriceBox.val(realPrice);
}