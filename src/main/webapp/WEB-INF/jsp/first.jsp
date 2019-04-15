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
  	<title></title>
  	<meta name="viewport" content="width=device-width,initial-scale=1">
  	<!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body style="background: url('<%=basePath%>images/wallhaven-569548.png');background-size:100% 100%">
    <div class="container-fluid" style="margin-top: 80px;">
      <div class="container" style="text-align: center">
     <img style="width: 500px;height: 250px" src="<%=basePath%>images/logo4.png">
     <h2 style="color:#337ab7">欢迎“${u.u_name}”，使用君桓网络管理系统！</h2>
     </div>
     </div>
  </body>
  </html>