/**
 * Created by huangfahui on 2018/11/5.
 */
$(function(){
    im.init();
});
var im = {
    //判断设备是否支持touch事件
    isTouch:null,
    touchOneByOne:null,
    init:function(){
        var self = this;

    },
    /*首页banner切换*/
    bannerCarousel:function(classname,current,times,speed1){
        var classname = $('.' + classname);
        var current = $('.' + current);

        var i = 1;
        var n = times;
        var le = classname.children('li').length;//获取li长度
        var liWidth = parseInt(classname.children('li').width());//获取li的width      
        //添加小标签
        (function addCurrent(){
            for(var i =0;i<le;i++){
                var dom = '<span class="'+ (i==0?'av':'') +'"></span>';
                current.append(dom);
            }
        })();

        //切换效果函数
        function show(){
            var ml = -1*liWidth*i;
            classname.stop().animate({'marginLeft': ml + 'px'}, speed1);
            current.children('span').eq(i).addClass('av').siblings('span').removeClass('av');
        }
        //自动切换函数
        function zd_show(){
            show();
            i++;
            if(i >= le){i = 0;}
        }
        var timer = setInterval(zd_show,n);
        //鼠标停靠时停止
        classname.hover(function(){
            clearInterval(timer);
        },function(){
            timer = setInterval(zd_show,n);
        });

        //停靠小标签切换
        current.children('span').mouseover(
            function(){
                clearInterval(timer);
                var ind = $(this).index();
                i = ind;
                show();
        });
    },
    /*新闻tab切换*/
    tabs:function(classname,box,num,addclass){
        var classname = $('.' + classname);
        var box = $('.' + box);
        var len = classname.children().length;
        var liWidth = parseInt(box.children().width());

        classname.children().on('mouseover',function (){
            var _index = $(this).index();
            if(_index >= num){return false;}
            classname.children().removeClass(addclass);
            $(this).addClass(addclass);

            box.stop().animate({'marginLeft':-1*_index*liWidth + 'px'}, 500);
        });
    },

    playVideo:function(id){
        var idBtn = $('#' + id);
        var maskbg = $('.maskbg');
        var videoPalyCon = $('.video_cover');
        var videoPalyBox = $('#videoPalyBox');
        var closeVideo = videoPalyCon.children('a');
        var swf = "http://127.0.0.1:8088/resources/gplayer.swf";
        var url = idBtn.attr('url');
        var html ='<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://127.0.0.1:8088/resources/swflash.cab" width="856" height="480" id="f1" align="middle"><param name="allowScriptAccess" value="sameDomain" /><param name="allowFullScreen" value="true" /><param name="movie" value="'+ swf +'"/><param name="bgcolor" value="#000000" /><param name="wmode" value="transparent"><param name="quality" value="high" /><param name="FlashVars" value="getUserComplete=completefuc(' +url+ ')&isDebugShow=false&setAutoPlay=true&isGetUserBand=true&vi&getUserVideoKps=100&getUserTotalTime=90&videoUrl='+url+'" /><embed id="video0" flashvars="isDebugShow=false&amp;setAutoPlay=true&amp;isGetUserBand=true&amp;getUserVideoKps=500&amp;videoUrl='+ url +'&amp;getUserComplete=videoComplete0" src="'+ swf +'" quality="high" width="856" height="480" name="flashResize" align="middle" allowscriptaccess="sameDomain" allowfullscreen="true" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer_cn"  bgcolor="#000000" wmode="transparent" /></object>';

        idBtn.on('click',function(){
            videoPalyCon.show();
            maskbg.show();
            videoPalyBox.append(html);
        });
        closeVideo.on('click',function(){
            videoPalyCon.hide();
            maskbg.hide();
            videoPalyBox.empty();
        });
    },
    //加载合作媒体下拉菜单
    loadSelectMedia:function(){
        $('.cm_select').hover(function(){    
            var $xiala = $(this).find('.cm_xiala')
            var $display = $xiala.css('display');           
            if( $display == 'none' ) {
              $xiala.show();        
            }else if( $display == 'block' ) {       
              $xiala.hide();        
            }
        });
        $(".cm_xiala a").click(function (e) {
            var va = $(this).text();
            $(this).find(".xiala").hide();
        }); 
    }
};
