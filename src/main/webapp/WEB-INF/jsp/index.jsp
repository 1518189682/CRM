<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html lang="zh-CN">
  <head>
  	<meta charset="UTF-8">
  	<title>管理页面</title>
  	<meta name="viewport" content="width=device-width,initial-scale=1">
  	<!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/bootstrap/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>easyui/themes/icon.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>easyui/jquery.easyui.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/easyUItest.css">
  </head>
 
  <body class="easyui-layout" id="cc">
    <div data-options="region:'north',border:false" class="navbar-top">
    	 <nav class="navbar navbar-default" style="border:0px;margin-bottom: 0px;background: #2daebf">
          <div class="container top">
          <!-- nav img -->
          <div class="navbar-header">
            <a class="navbar-brand loge-left" style="padding:0px;padding-left: 30px" href="javascript:void(0)">
      	    <img class="loge-img" src="<%=basePath%>images/loge-t.png" ></a>
          </div>
          <!-- nav text -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
              <ul class="nav navbar-nav">
                <li style="cursor:pointer;"><a onclick="first()"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;系统首页<span class="sr-only">(current) </span></a></li>
                <li style="cursor:pointer;"><a onclick="closeAll()"><span class="glyphicon glyphicon-floppy-remove" aria-hidden="true"></span>&nbsp;清空面板</a></li>
              </ul>
        
              <ul class="nav navbar-nav navbar-right">
               <li><a style="cursor: pointer" onclick="westClick('<%=basePath%>staff/personinfo.action','个人信息')"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;${staff.u_name}</a></li>
               <li ><a  href="javascript:void(0)" id="mb" class="easyui-menubutton top-right"data-options="menu:'#mm',iconCls:'icon-setting',plain:false" style="padding:10px 20px 0 0;border:0px;background: #2daebf">设置</a>
                 <div id="mm" style="width:150px;">
                 <div>----</div>
                 <div class="menu-sep"></div>
                 <a href="<%=basePath%>logout.action"><div><span class="glyphicon glyphicon-log-out" style="margin-left:7px" aria-hidden="true"></span>&nbsp;退出登陆</div></a>
                 </div>
               </li>
              </ul>
            </div>
           </div><!-- /.container-fluid -->
        </nav>
    </div>

    <div data-options="region:'center',border:false">
		<div class="easyui-layout" data-options="fit:true,border:false">
		<div data-options="region:'west',title:' ',border:true" class="west" id="westClick">
		  <c:forEach items="${modules}" var="m">
		   <div class="west-model" onclick="westClick('${m.url}','${m.name}')">${m.name}</div>
		  </c:forEach>
		</div>
		<div data-options="region:'center'" >
				 <div id="tt" class="easyui-tabs" data-options="fit:true,border:false" >
                    
                 </div>
		</div>
		</div>
    </div>

    <div data-options="region:'south'" class="south">
    	<ol class="breadcrumb">
          <li><a href="#">关于我们</a></li>
          <li><a href="#">联系我们</a></li>
          <li class="active">--------------</li>
          <li><a href="#">获取帮助</a></li>
          <li><a href="#">服务条款</a></li>
        </ol>
    </div>

     <script type="text/javascript">
    $(function(){
    	westClick('<%=basePath%>index.action','系统首页');
    }) 
    function first(){
    	 westClick('<%=basePath%>index.action','系统首页');
    }
        var list = new Array();
        function westClick(url,name){
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
        			title: name,
        			content: '<div style="width:100%;height:100%;"><iframe class="page-iframe" src="'+url+'" frameborder="no"   border="no" height="100%" width="100%" scrolling="auto"></iframe></div>',
        			closable: true
        		});
        	}
     	}
     	
     	function RefreshTab(currentTab) {
     		          var url = $(currentTab.panel('options')).attr('href');
     		         $('#tt').tabs('update', {
     		              tab: currentTab,
     		              options: {
     		                  href: url
     		              }
     		          });
     		         currentTab.panel('refresh');
     		   }
     	
    	$('#tt').tabs({
    	    onClose:function(title,index){
    	    	list.indexOf(title);
    	    	list.splice(index,1);
    	    }
    	});
    	function flush(){
    		location.reload();
    	}
    	function closeAll(){
    		var tiles = new Array();
    		  var tabs = $('#tt').tabs('tabs');    
    		  var len =  tabs.length;		  
    		  if(len>0){
    			for(var j=0;j<len;j++){
    				var a = tabs[j].panel('options').title;	
    				tiles.push(a);
    			}
    			for(var i=0;i<tiles.length;i++){				
    				$('#tt').tabs('close', tiles[i]);
    			}
    		  }
    		  list=new Array();
    	}

     </script>
</body>
  </html>