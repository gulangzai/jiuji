$(function(){
    $(".unchecked-icon").toggle(function(){     //复选框点击切换样式
        $(this).addClass("checked-icon").removeClass("unchecked-icon");
    },function(){
        $(this).addClass("unchecked-icon").removeClass("checked-icon");
    });

    $(".eye-hidden-icon").toggle(function(){
        $(this).addClass("eye-show-icon").removeClass("eye-hidden-icon");
    },function(){
        $(this).addClass("eye-hidden-icon").removeClass("eye-show-icon");
    });


    //获取验证码倒计时JS
    var clock = '';
    var nums = 60;
    var btn;
    function sendCode(thisBtn)
    {
        btn = thisBtn;
        btn.disabled = true; //将按钮置为不可点击
        btn.value='重新发送('+nums+')';
        btn.className="get-code no-click";
        clock = setInterval(doLoop, 1000); //一秒执行一次
    }
    function doLoop()
    {
        nums--;
        if(nums > 0){
            btn.value='重新发送('+nums+')';
            btn.className="get-code no-click";
        }else{
            clearInterval(clock); //清除js定时器
            btn.disabled = false;
            btn.value = '获取验证码';
            nums = 60; //重置时间
            btn.className="get-code";
        }
    }
    var thisButton=document.getElementById("get-code-btn");
    thisButton.addEventListener("click",function(){
        event.preventDefault();
        sendCode(this);
    });



})