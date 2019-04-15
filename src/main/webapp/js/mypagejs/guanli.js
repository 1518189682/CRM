
function tijiaoxinmimabutton(){
	var jiuxinmima = $("#jiuxinmima").val();
	var formxinmima = $("#formxinmima").val();
	var formxinmima2 = $("#formxinmima2").val();
	if(jiuxinmima!=""&&formxinmima!=""&&formxinmima2!=""){
    if(formxinmima==formxinmima2){
    	loadingshow();
    	$.ajax(
    		    {
    		        url:"/user/xiugaimima",
    		        data:{"jiuxinmima":jiuxinmima,
    		        	"formxinmima":formxinmima},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	setTimeout('loadinghide("success","'+data.data+'")',1500);
    		        	$("#xiugaimima").modal('hide');
    		        },
    		        error: function() {
    		        	loadinghide("error","修改密码ajax异常！");
    		          }
    		    });
    }
      else{$.messager.alert('错误提示', '两次输入的新密码不一致', 'error')}}
	else{$.messager.alert('错误提示', '不能有空值', 'error')}
};
function tijiaoxinyonghumingbutton(){
	var xinyonghuming = $("#formxinyonghuming").val();
	if(xinyonghuming!=""){
    	loadingshow();
    	$.ajax(
    		    {
    		        url:"/user/xiugaiyonghuming",
    		        data:{"xinyonghuming":xinyonghuming},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	setTimeout('loadinghide("success","'+data.data+'")',1500);
    		        	$("#xiugaiyonghuming").modal('hide');
    		        	setTimeout('exit();',2500);   		        	
    		        },
    		        error: function() {
    		        	loadinghide("error","修改用户名ajax异常！");
    		          }
    		    });
     }
	else{$.messager.alert('错误提示', '不能有空值', 'error')}
};
!$(function(){
		$('#tt').tabs({
		    	  tabHeight: 40,
			      onSelect:function(title,index){
			    	  //refreshpage();
			      }
		 });
	})
function refreshpage(){
	var currentTab = $('#tt').tabs("getSelected");
	if(currentTab.find("iframe") && currentTab.find("iframe").size()){
		//currentTab.find("iframe").parents("[class='tabs-panels']").prev("div").children("[class='tabs-wrap']").children().children("[class='tabs-selected']").click(function(){alert();});
    	//点击tab刷新
        currentTab.find("iframe").attr("src",currentTab.find("iframe").attr("src"));
    }
};
function closemianban(){
	var ul=$("[class=tabs-close]");
	if(ul.size()>0){
	for(var ii=0;ii<ul.size();ii++){
		ul.eq(ii).trigger("click");
	};};
}	

     // 写一个方法往easyUI中添加面板 
	function addPanel(url,name){
    	name = name.replace(/-/g,"");
    	// 判断之前是否已经存在该面板存在就不创建新的面板 
    	var exist = $('#tt').tabs('exists',name);
    	if(exist){
    		// 已经存在就将该面板选中  exist
    		$('#tt').tabs('select',name);
    		var currentTab =  $('#tt').tabs('getTab',name);
    		// 刷新一下界面 
    		if(currentTab.find("iframe") && currentTab.find("iframe").size()){
	            currentTab.find("iframe").attr("src",currentTab.find("iframe").attr("src"));
	        }
    	}else{
    		$('#tt').tabs('add',{
    			id:"666",
    			title: name,
    			content: '<div style="width:100%;height:100%;padding:10px 5px 5px 10px;"><iframe class="page-iframe" src="'+url+'" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe></div>',
    			closable: true
    		});
    	}
	}
	   
	    !$(window).resize(function(){
	          $('.tabs-panels').height($("#pf-page").height()-46);
	          $('.panel-body').height($("#pf-page").height()-76)
	    }).resize();

	    var page = 0,
	        pages = ($('.pf-nav').height() / 70) - 1;

	    if(pages === 0){
	      $('.pf-nav-prev,.pf-nav-next').hide();
	    }
	    !$(document).on('click', '.pf-nav-prev,.pf-nav-next', function(){
			    	
	      if($(this).hasClass('disabled')) return;
	      if($(this).hasClass('pf-nav-next')){
	        page++;
	        !$('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
	        if(page == pages){
	          $(this).addClass('disabled');
	          $('.pf-nav-prev').removeClass('disabled');
	        }else{
	          $('.pf-nav-prev').removeClass('disabled');
	        }
	      }else{
	        page--;
	        $('.pf-nav').stop().animate({'margin-top': -70*page}, 200);
	        if(page == 0){
	          $(this).addClass('disabled');
	          $('.pf-nav-next').removeClass('disabled');
	        }else{
	          $('.pf-nav-next').removeClass('disabled');
	        }
	        
	      }
	    })
	    
	    function exit(){
	    	window.location.href = "/user/logout";
	    }
	    function yonghuxinxi(){
	    	addPanel("/user/gerenxinxi","个人信息");    	
	    }
	    function tijiaotouxiangbutton(){
			loadingshow();
			var formData = new FormData();
		    formData.append("file", $("#uptouxiangfile")[0].files[0]);    //生成一对表单属性
		    $.ajax({
		        type: "POST",           //因为是传输文件，所以必须是post
		        url: '/user/uptouxiang',         //对应的后台处理类的地址
		        data: formData,
		        processData: false,
		        contentType: false,
		    success:function(data)
	        {  
		    	setTimeout('loadinghide("success","'+data.retu+'")',1500);
	        	$("#uptouxiangmodal").modal('hide');
	        },
	        error: function() {
	        	loadinghide("error","提交头像异常，请检查文件是否为空！");
	          }
		    });
	    };
	    function tabaddclos(){
	    	var element = document.getElementById("tabs-panels");
	    	element.style.cssText = "height: 796px; width: 1700px;background-color: #ffffff;";
	    }
	    !$(function() {	
	    	var width=document.body.clientWidth-120-270-10;
	    	$("[class=pf-nav-ww]").css("width",width);
	    	addPanel("/user/gerenyoujian","收件箱");
	    	});
	    function tanchu(f){
	    	setTimeout(f,500);   	
	    };
	    function baoxiu(){
	    	addPanel("/student/baoxiupage","报修");
	    };
	    function xunwu(){
	    	addPanel("/student/fabuxunwuqishi","发布寻物启事");
	    };
	    function health(){
	    	addPanel("/student/qinshiweisheng","寝室卫生");
	    };