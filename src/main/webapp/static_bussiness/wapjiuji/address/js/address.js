$(document).ready(function (){
    var swiper1 = new Swiper('.swiper-container', {    //内容区域滚动
        scrollbar: '.swiper-scrollbar',
        direction: 'vertical',
        slidesPerView: 'auto',
        mousewheelControl: true,
        freeMode: true
    });

    $(".consignee-address").each(function()   //多行文字超出范围显示省略号
    { var maxwidth=34;
        if($(this).text().length>maxwidth){
            $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'...');
        }
    });

    $(".specific-address").each(function()   //多行文字超出范围显示省略号
    { var maxwidth=30;
        if($(this).text().length>maxwidth){
            $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'...');
        }
    });

    $(".single-address").eq(0).find(".circle-checked-icon").css("display","block");     //收货地址页，点击选择默认地址
    $(".single-address").eq(0).find(".default-address-sign").css("display","inline");
    $(".consignee-mes").each(function(i,o){
        $(o).click(function(){
            $(".single-address").find(".circle-checked-icon").css("display","none");
            $(this).parent(".single-address").find(".circle-checked-icon").css("display","block");
            $(".single-address").find(".default-address-sign").css("display","none");
            $(this).parent(".single-address").find(".default-address-sign").css("display","inline");
        });
    });

})