$(document).ready(function () {
    var swiper1 = new Swiper('.swiper-container', {    //内容区域滚动
        scrollbar: '.swiper-scrollbar',
        direction: 'vertical',
        slidesPerView: 'auto',
        mousewheelControl: true,
        freeMode: true
    });

    $(".mes-con").each(function()   //多行文字超出范围显示省略号
    { var maxwidth=30;
        if($(this).text().length>maxwidth){
            $(this).text($(this).text().substring(0,maxwidth));
            $(this).html($(this).html()+'...');
        }
    });

    $(".toggle-on-icon").toggle(function(){       //是否接受推送的开关按钮切换
        $(this).removeClass("toggle-on-icon");
        $(this).addClass("toggle-off-icon");
    },function(){
        $(this).removeClass("toggle-off-icon");
        $(this).addClass("toggle-on-icon");
    });

    var wordCount = $("#word-count"),            //意见反馈页，控制输入字数
        textArea = wordCount.find("textarea"),
        word = wordCount.find(".word");
        //调用
    statInputNum(textArea,word);
    function statInputNum(textArea,numItem) {
        var max = numItem.text(),
            curLength;
        textArea[0].setAttribute("maxlength", max);
        curLength = textArea.val().length;
        numItem.text(curLength);
        textArea.on('input propertychange', function () {
            numItem.text($(this).val().length);
        });
    }



})