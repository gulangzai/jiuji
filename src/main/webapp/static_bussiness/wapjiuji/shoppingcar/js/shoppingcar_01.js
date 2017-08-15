$(document).ready(function (){
    var swiper1 = new Swiper('.swiper-container', {    //内容区域滚动
        scrollbar: '.swiper-scrollbar',
        direction: 'vertical',
        slidesPerView: 'auto',
        mousewheelControl: true,
        freeMode: true
    });


    //$(".goods").each(function(i,o){
    //    var moveObj=document.getElementById("goods"+i);            //侧滑效果
    //    moveObj.addEventListener('touchstart',function(event){
    //        if (event.targetTouches.length == 1) {
    //            event.preventDefault();// 阻止浏览器默认事件，重要
    //            startX = event.changedTouches[0].pageX;
    //        }
    //    },false);
    //    moveObj.addEventListener('touchmove', function(event) {
    //        // 如果这个元素的位置内只有一个手指的话
    //        if (event.targetTouches.length == 1) {
    //            event.preventDefault();// 阻止浏览器默认事件，重要
    //            //var touch = event.targetTouches[0];// 把元素放在手指所在的位置
    //            moveEndX = event.changedTouches[0].pageX;
    //            X = moveEndX - startX;
    //            if(X<0){
    //                $(moveObj).animate({
    //                    right:'3.5rem'
    //                },80);
    //            }else if(X>=0){
    //                $(moveObj).animate({
    //                    right:'0'
    //                },80);
    //            }
    //        }
    //    }, false);
    //});


    $(".shop .circle-icon").each(function(i,o){
        $(o).toggle(function(){
            $(this).parentsUntil(".shopping-list").find(".circle-icon").addClass("circle-checked-icon").removeClass("circle-icon");
        },function(){
            $(this).parentsUntil(".shopping-list").find(".circle-checked-icon").addClass("circle-icon").removeClass("circle-checked-icon");
        });
    });

    $(".goods .circle-icon").each(function(i,o){
        $(o).toggle(function(){
            $(this).addClass("circle-checked-icon").removeClass("circle-icon");
        },function(){
            $(this).addClass("circle-icon").removeClass("circle-checked-icon");
            //$(this).parent().prev().find("circle-checked-icon").addClass("circle-icon").removeClass("circle-checked-icon");
        });
    });

    $(".edit").toggle(function(){    //点击右上角编辑按钮时的效果
        $(this).html('完成');
        $(".shoppingcar-action-block").css("visibility","visible");
    },function(){
        $(this).html('编辑');
        $(".shoppingcar-action-block").css("visibility","hidden");
    });

})