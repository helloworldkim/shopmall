$(function(){
    var target= $(".productsUl");
    $.ajax({
        type:'GET',
		    url:'/ProductIndex',
		    data:{},
		    success:function(data){
                var noSpaceData= data.trim();
                var result = JSON.parse(noSpaceData);
                var made = result.map(item => createHtml(item)).join("");
                target.append(made);
                //console.log(result);
		    },
		    error:function(e){
		        alert(e);
		    }
    });
});

function createHtml(product){
    return `<li class="productsList">
                <div class="img">
                    <a href="/ProductView?productId=${product.productId}"><img class='imgsize' src="../product/${product.productImg}" alt="임시이미지"></a>
                </div>
                <div class="info">
                    <h2>${product.productName}</h2>
                    <p>${product.shortDetail}</p>
                    <p>기존가격:${product.productPrice}</p>
                    <p>할인(${product.productSalePer}%)할인가:${product.productSalePrice}</p>
                </div>
            </li>`
}