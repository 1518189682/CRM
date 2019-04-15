
function onload(size){
	//banner轮播
	im.bannerCarousel('carousel_box .list', 'banner .pointList', 4000, 500);
	//新闻切换
	im.tabs('news_hero .news_tab_btn',
			'news_hero .news_tab_con_box .tab_box', 6, 'av');
	//播放视频
	im.playVideo('videoPlay');
	onload1();
	setTimeout('setwidth("'+size+'")',2000);	
}
function onload1(){
	//友情链接上拉框
	im.loadSelectMedia();
}
function time()
{
setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
}
function setwidth(size){
	var listwidth=(Math.round(size * 10000)/100).toFixed(2) + '%';
	var itemwidth=(Math.round(10000/size)/100).toFixed(2) + '%';
	var list = document.getElementById("list");
	for(var i=1;i<=size;i++){
		var item = document.getElementById("item"+i);
		item.style.setProperty('width',itemwidth);	
	}
	list.style.setProperty('width',listwidth);	
};
function tanchumodal(id){
	$("#homepageupfileinput").val(id);
	$("#homepageupfile").modal();
};
function tijiaoupfilebutton(){
	var formData = new FormData();
    formData.append("file", $("#upfilefile")[0].files[0]);    //生成一对表单属性
    formData.append("id", $("#homepageupfileinput").val());
    $.ajax({
        type: "POST",           //因为是传输文件，所以必须是post
        url: '/superadmin/homepageupfile',         //对应的后台处理类的地址
        data: formData,
        processData: false,
        contentType: false,
    success:function(data)
    { 
    	mizhu.alert('', data.data,'alert_red');
    	$("#homepageupfile").modal('hide');
    },
    error: function() {
    	mizhu.alert('', 'ajax异常！','alert_red');
      }
    });
};
function deletehomepagezujian(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			window.location.href = "/superadmin/deletelunbotu?id=" + id;
		}
	});
};
function genggaiurl(val){
$("#urltijiaobutton"+val).css("display", "block");
$("#urlinput"+val).removeAttr("readonly");
$("#urlinput"+val).focus();
};
function tijiaourl(val,id){
	var  url=$("#urlinput"+val).val();
	if(url!=""){
		$.ajax(
    		    {
    		        url:"/superadmin/changeurl",
    		        data:{"url":url,"id":id},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        { 
    		        mizhu.alert('',data.data,'alert_red');
                     $("#urltijiaobutton"+val).hide();
                     $("#urlinput"+val).attr('readonly','readonly'); 
    		        },
    		        error: function() {
    		        	mizhu.alert('','ajax异常！','alert_red');
    		          }
    		    }); 	
	};
};