<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
  	<meta charset="UTF-8">
  	<title>登陆页面</title>
  	<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="http://libs.cdnjs.net/jquery-validate/1.14.0/jquery.validate.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css">
  </head>
  <body>
  	
     
 <nav class="navbar navbar-default" style="background: #2daebf">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="navbar-brand navbar-top"> <img class="img" src="<%=basePath%>/images/loge-t.png" ></div>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle">关于</a>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
     
<div class="container-fluid main" style="background-image:url('<%=basePath%>images/home_top_bg.jpg');">
	<div class="container">
		<div class="col-md-4 loge">
			<img src="<%=basePath%>/images/logo4.png">
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-6 right">
			<form class="form-horizontal" action="<%=basePath%>login.action" method="post" id="loginForm" onsubmit="return checkText()">
              <div class="form-group">
               <label  class="col-sm-2 control-label">账号：</label>
                <div class="col-sm-8">
                <input type="Text" class="form-control" id="username" name="username" placeholder="请输入账号....." style= "background-color:transparent;color:white;">
              </div>
              </div>
             <div class="form-group">
              <label  class="col-sm-2 control-label">密码：</label>
              <div class="col-sm-8">
               <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码....." style= "background-color:transparent;color:white;">
              </div>
              </div>

                <div class="form-group">
                    <label  class="col-sm-2 control-label">验证码:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="input" name="input"
                               placeholder="不区分大小写" style= "background-color:transparent;color:white;"><span class="test"></span>
                    </div>
                    <div class="col-sm-3 canvasBox" >
                        <div class="imgBox">
                            <canvas id="myCanvas" width=100 height=30></canvas>
                        </div>
                        <span class="glyphicon glyphicon-refresh refresh" aria-hidden="true"></span>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default btn">登陆</button>
                    </div>
                </div>
        </form>
		</div>
	</div>
</div>

<nav class="navbar navbar-default navbar-fixed-bottom" style="background:#2daebf ">
  <div class="container navbar-buttom">
    <ol class="breadcrumb" style="background:#2daebf ">
     <li><a href="#">关于我们</a></li>
     <li><a href="#">联系我们</a></li>
     <li class="active">Data</li>
      <li><a href="#">获取帮助</a></li>
     <li><a href="#">服务条款</a></li>
    </ol>
  </div>
</nav>
<script type="text/javascript" src="<%=basePath%>js/login.js">
</script>
  </body>
</html>