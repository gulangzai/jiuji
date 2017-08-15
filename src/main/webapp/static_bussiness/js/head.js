/*閸濅胶澧濋崚妤勩��*/
var brandArea = function () {
    $(".brand_class li").each(function (i) {
        $(this).mouseenter(function () {
            $(this).find("div").stop().animate({ "top": -50 }, 300);
        })
        $(this).mouseleave(function () {
            $(this).find("div").stop().animate({ "top": 0 }, 300);
        })
    });
}


$(function () {
    //閹兼粎鍌�
    $("#btnsch").click(function () {
        window.location = SiteUrl + '/product/search_jump.htm?key=' + encodeURIComponent($("#sch").val());
    });

    //鐠囪褰囩拹顓犲⒖鏉烇附鏆熼柌锟�
    var dd = new Date();
    $("#head_cart_no").load("/ajax/head/shoppingcart.htm?act=getcount&d=" + escape(dd));

    //head 瀵懓鍤懣婊冨礋闁劌鍨�
    var cateMenu = function () {
        var cateLiNum = $(".cateMenu li").length;  
        $(".cateMenu li").each(function (index, element) {
            if (index < cateLiNum ) {
                $(this).mouseenter(function () { 
                	
                    var ty = $(this).offset().top + 483;
                    
                    var obj = $(this).find(".list-item");
                    var sh = document.documentElement.scrollTop || document.body.scrollTop;
                    var oy = ty + (obj.height() + 30 )+483 - sh;
                    var dest = oy - $(window).height()
                    if (oy > $(window).height()) {
                        ty = ty - dest - 10;
                    }
                    if (ty < 0) ty = 0;
                    
                    $(this).addClass("on"); 
                    obj.removeClass("hide");
                    obj.css("display","block");
                    obj.show();
                    ty=0;
                   // console.info(obj);
                    $(".cateMenu li").find(".list-item").stop().animate({ "top": ty });
                    obj.stop().animate({ "top": ty });
                })
                $(this).mouseleave(function () {
                    $(this).removeClass("on");
                    $(this).find(".list-item").hide();
                })
            }
        });

       /* $(".navCon_on").hover(function () { 
        	$(".cateMenu").removeClass("hide");
            $(".cateMenu").show(); 
        },
		function () {
		    $(".cateMenu").hide();
		})  */

    } ();

    var miniMenu = function () {
        /*鐠愵厾澧块崚妤勩��*/
        $(".miniMenu").find(".m1").hover(
			function () {
			    $(this).addClass("on");
			    $(this).find(".mini-cart").show();
			    var dd = new Date();
			    $("#head_cart").load("/ajax/head/shoppingcart.htm?act=getitems&d=" + escape(dd));
			},
			function () {
			    $(this).removeClass("on");
			    $(this).find(".mini-cart").hide();
			}
		)
        /*閻€劍鍩涙稉顓炵妇*/
        $(".miniMenu").find(".m3").hover(
			function () {
			    $(this).addClass("cur");
			    $(this).find(".miniMenu-child").show();
			},
			function () {
			    $(this).removeClass("cur");
			    $(this).find(".miniMenu-child").hide();
			}
		)
    } ();
  
})




/*閹兼粎鍌ㄩ幓鎰仛*/
var searchTips = {
    keyBoo: false,
    currentIndex: -1,
    currentArr: [],
    box: null,
    input: null,
    init: function (obj) {
        var that = this;
        this.input = document.getElementById(obj.inputID);
        this.createContent(obj.listID);
        this.onChange = obj.onChange || null;
        this.onSubmit = obj.onSubmit || null;

        this.addKeyBoardEvent();
        this.change();
        this.addEvent(that.input, "blur", function () {
            that.focusout();
        });

    },
    change: function () {
        var that = this;
        if (that.input.addEventListener) {
            that.input.addEventListener("input", function () {
                that.onChange();
                that.keyBoo = true;
            }, false);
        } else if (that.input.attachEvent) {
            that.input.attachEvent("onpropertychange", function () {
                that.onChange();
                that.keyBoo = true;
            });
        }
    },
    find: function (data) {
        this.box.parentNode.style.display = "block";
        //this.box.style.display = "block";
        var ul = this.box.getElementsByTagName("ul")[0];
        ul.innerHTML = "";
        this.currentArr = [];
        this.currentIndex = -1;
        for (var i = 0; i < data.length; i++) {
            var li = this.getLi();
            li.innerHTML = data[i].keyword;
            ul.appendChild(li);
            this.currentArr.push(li);
        }
    },
    createContent: function (sBox) {
        this.box = document.createElement("div");
        this.box.className = "searchTips";
        document.getElementById(sBox).appendChild(this.box);
        var ul = document.createElement("ul");
        this.box.appendChild(ul);
        //this.box.style.display = "none";
    },
    selectCurrent: function () {
        var len = this.currentArr.length;
        if (this.currentIndex < 0) this.currentIndex = len - 1;
        if (this.currentIndex > len) this.currentIndex = 0;
        for (var i = 0; i < len; i++) {
            this.currentArr[i].className = this.currentIndex == i ? "on" : "";
        }
    },
    addKeyBoardEvent: function () {
        var that = this;
        this.addEvent(document, "keydown", function (e) {
            if (that.keyBoo) {
                var e = e || window.event;
                switch (e.keyCode) {
                    case 40:
                        that.currentIndex++;
                        that.selectCurrent();
                        break;
                    case 38:
                        that.currentIndex--;
                        that.selectCurrent();
                        break;
                    case 13:
                        if (that.currentIndex != -1) {
                            that.input.value = that.currentArr[that.currentIndex].innerHTML;
                        }
                        that.onSubmit();
                        that.focusout();
                        break
                    default: break;
                }

            }
        })
    },
    focusout: function () {
        var that = this;
        setTimeout(function () {
            //that.box.style.display = "none";
            that.box.parentNode.style.display = "none";
            that.keyBoo = false;
        }, 100)
    },
    getLi: function () {
        var that = this;
        var li = document.createElement("li");
        this.addEvent(li, "mouseover", function () { li.className = "on"; });
        this.addEvent(li, "mouseout", function () { li.className = ""; });
        this.addEvent(li, "click", function () { that.input.value = li.innerHTML; that.onSubmit(); });
        return li;
    },
    addEvent: function (obj, type, fn) {
        if (obj.addEventListener) {
            obj.addEventListener(type, fn, false);
        } else if (obj.attachEvent) {
            obj.attachEvent("on" + type, fn);
        }
    }

}// JavaScript Document