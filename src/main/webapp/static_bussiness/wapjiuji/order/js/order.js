$(document).ready(function (){
    var swiper1 = new Swiper('.swiper-container', {    //内容区域滚动
        scrollbar: '.swiper-scrollbar',
        direction: 'vertical',
        slidesPerView: 'auto',
        mousewheelControl: true,
        freeMode: true
    });

    $(".options").find("i").each(function(i,o){   //勾选发票内容选项
        $(o).click(function(){
            if($(this).attr("class")=="circle-icon"){
                $(".options").find("i").removeClass("circle-checked-icon").addClass("circle-icon");
                $(this).addClass("circle-checked-icon");
            }else if($(this).attr("class")=="circle-checked-icon"){
                $(".options").find("i").removeClass("circle-icon").addClass("circle-checked-icon");
                $(this).addClass("circle-icon");
            }
        });
    });

    $(".no-invoice").click(function(){     //点击发票抬头，出现相关内容
        $(this).css("display","none");
        $(".invoice").css("display","block");
        swiper1.update(true);
    })

    $(".product-name").each(function()   //多行文字超出范围显示省略号
    { var maxwidth=61;
        if($(this).text().length>maxwidth){
            $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'...');
        }
    });

})