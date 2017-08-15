$(document).ready(function (){
    var swiper1 = new Swiper('.swiper-container', {    //内容区域滚动
        scrollbar: '.swiper-scrollbar',
        direction: 'vertical',
        slidesPerView: 'auto',
        mousewheelControl: true,
        freeMode: true
    });
    var swiper2 = new Swiper('.banner-swiper', {       //轮播图
        pagination: '.swiper-pagination',
        paginationClickable: true,
        paginationBulletRender: function (index, className) {
            return '<span class="' + className + '">' + (index + 1) + '</span>';
        },
        loop: true,
        autoplay:5000
    });
})


