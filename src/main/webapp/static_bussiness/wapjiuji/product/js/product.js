$(document).ready(function (){
    var swiper1 = new Swiper('.swiper-container', {    //内容区域滚动
        scrollbar: '.swiper-scrollbar',
        direction: 'vertical',
        slidesPerView: 'auto',
        mousewheelControl: true,
        freeMode: true,
        onScroll:function(e){
            if(e.pageY>100){
                $(".return-top").fadeIn(500);
            }else{
                $(".return-top").fadeOut(500);
            }
        }
    });

    var swiper2 = new Swiper('.banner-swiper', {     //图片轮播
        pagination: '.banner-swiper .swiper-pagination',
        paginationClickable: true,
        paginationBulletRender: function (index, className) {
            return '<span class="' + className + '">' + (index + 1) + '</span>';
        },
        loop: true
    });

    var swiper3 = new Swiper('.related-swiper', {    //猜你喜欢
        pagination: '.related-swiper .swiper-pagination',
        paginationClickable: true,
        paginationBulletRender: function (index, className) {
            return '<span class="' + className + '">' + (index + 1) + '</span>';
        },
        loop:true
    });

    $(".product-intro").each(function()   //多行文字超出范围显示省略号
    { var maxwidth=38;
        if($(this).text().length>maxwidth){
            $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'...');
        }
    });


    $(".return-top").hide();
    //$(window).scroll(function(){
    //   if($(window).scrollTop()>100){
    //       $(".return-top").fadeIn(500);
    //   }else{
    //       $(".return-top").fadeOut(500);
    //   }
    //});
    $(".return-top").click(function(){
        $("body,html").animate({
           scrollTop:0
        },100);
        return false;
    });


});