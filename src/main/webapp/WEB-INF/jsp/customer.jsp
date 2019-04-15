<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fm" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>君桓 管理中心 - 客户管理 </title>
<meta name="Copyright" content="Douco Design." />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-theme.min.css" />
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap-paginator.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/mypagejs/myloading.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/myloading.css" />
<link href="<%=basePath%>css/style.css" rel="stylesheet" />
<script src="<%=basePath%>js/ui.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<link href="<%=basePath%>css/style.css" rel="stylesheet" />
<script src="<%=basePath%>js/ui.js"></script>
<script type="text/javascript">
	function findCustomer(id) {
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/customerController/selById.action",
			traditional : true,
			data : {
				"id" : id
			},
			dataType:"json",
			scriptCharset: 'UTF-8',
			success:function(data) {
				$("#id3").val(data.id);
				$("#name3").val(data.name);
				$("#sex3").val(data.sex);
				$("#phone3").val(data.phone);
				$("#weixin3").val(data.weixin);
				$("#email3").val(data.email);
				$("#idCard3").val(data.idCard);
				$("#date3").val(data.date);
			},
			error:function(data){
				alert("失败");
			}
		});
	}
	function delCustomer(id) {
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/customerController/delCustomer.action",
			traditional : true,
			data : {
				"id" : id
			},
			dataType:"json",
			scriptCharset: 'UTF-8',
			success:function(data) {
				alert(data);
				$(window).attr("location","${pageContext.request.contextPath}/customerController/showCustomer.action?currentPage=1");
			},
			error:function(data){
				alert(data);
			}
		});
	}
</script>	
<script type="text/javascript">
function checkEmail(){
	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
	　　var obj = document.getElementById("email"); //要验证的对象
	　　if(obj.value === ""){ //输入不能为空
			$("#spinfoemail").html("邮箱格式不正确");
	　　　　return false;
	　　}else if(!reg.test(obj.value)){ //正则验证不通过，格式不对
		  $("#spinfoemail").html("邮箱格式不正确");
	　　　　return false;
	　　}else{
	　　　　$("#spinfoemail").html("邮箱格式正确");
	　　　　return true;
	　　}
	}
		function checkIdCard(){
			  var reg=/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
			  var idCard=$("#idCard").val();
			  if(!reg.test(idCard)){ 
				  $("#spinfoidCard").html("身份证号格式不正确");
				  return false;
			  }else {
				  $("#spinfoidCard").html("身份证号格式正确");
	              return true;  
			  }
	      }
		function checkPhone(){
			var reg = /^1[3|4|5|7|8][0-9]{9}$/;
			var phone=$("#phone").val();
			if(!reg.test(phone)){
				$("#spinfophone").html("手机号格式不正确");
				return false;
			}else {
				$("#spinfophone").html("手机号格式正确");
				return true;
			}
		}
		function checkWeiXin(){
			var reg = /^[a-zA-Z]([-_a-zA-Z0-9]{5,19})+$/;
			var weixin = $("#weixin").val();
			if(!reg.test(weixin)){
				$("#spinfoweixin").html("微信号不正确");
				return false;
			}else {
				$("#spinfoweixin").html("微信号格式正确");
				return true;
			}
		}
		function checkName(){
			var name = $("#name").val();
			var reg = /^[\u4e00-\u9fa5]{1,}((·[\u4e00-\u9fa5]{1,}){0,3})$/;
			if(name.length==1 || !reg.test(name)){
				$("#spinfoname").html("请输入真实姓名");
				return false;
			 }
			 else {  
				 $("#spinfoname").html("姓名格式正确");
				 return true;
			  } 
		}
		function checkSubmit(){
			if(checkEmail()&&checkIdCard()&&checkPhone()&&checkWeiXin()&&checkName()){
				
				return true;
			}else {
				alert("请检查输入内容是否有误");
				return false;
			}
		}
    </script>
<script type="text/javascript">
function checkEmail3(){
	var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$"); //正则表达式
	　　var obj = document.getElementById("email3"); //要验证的对象
	　　if(obj.value === ""){ //输入不能为空
			$("#infoemail").html("邮箱格式不正确");
	　　　　return false;
	　　}else if(!reg.test(obj.value)){ //正则验证不通过，格式不对
		  $("#infoemail").html("邮箱格式不正确");
	　　　　return false;
	　　}else{
	　　　　$("#infoemail").html("邮箱格式正确");
	　　　　return true;
	　　}
	}
		function checkIdCard3(){
			  var reg=/^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
			  var idCard=$("#idCard3").val();
			  if(!reg.test(idCard)){ 
				  $("#infoidCard").html("身份证号格式不正确");
				  return false;
			  }else {
				  $("#infoidCard").html("身份证号格式正确");
	              return true;  
			  }
	      }
		function checkPhone3(){
			var reg = /^1[3|4|5|7|8][0-9]{9}$/;
			var phone=$("#phone3").val();
			if(!reg.test(phone)){
				$("#infophone").html("手机号格式不正确");
				return false;
			}else {
				$("#infophone").html("手机号格式正确");
				return true;
			}
		}
		function checkWeiXin3(){
			var reg = /^[a-zA-Z]([-_a-zA-Z0-9]{5,19})+$/;
			var weixin = $("#weixin3").val();
			if(!reg.test(weixin)){
				$("#infoweixin").html("微信号不正确");
				return false;
			}else {
				$("#infoweixin").html("微信号格式正确");
				return true;
			}
		}
		function checkName3(){
			var name = $("#name3").val();
			var reg = /^[\u4e00-\u9fa5]{1,}((·[\u4e00-\u9fa5]{1,}){0,3})$/;
			if(name.length==1 || !reg.test(name)){
				$("#infoname").html("请输入真实姓名");
				return false;
			 }
			 else {  
				 $("#infoname").html("姓名格式正确");
				 return true;
			  } 
		}
		function checkSubmit3(){
			if(checkEmail3()&&checkIdCard3()&&checkPhone3()&&checkWeiXin3()&&checkName3()){
				
				return true;
			}else {
				alert("请检查修改内容是否有误");
				return false;
			}
		}
</script>
</head>
<body>
<div class="container">
		<div class="col-md-12">
			<div class="dropdown">
				<button class="btn btn-success btn-primary pull-right" data-toggle="modal" data-target="#myModal2">
					添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</button>
			</div>
			<div class="dropdown">
				<button class="btn btn-success btn-primary pull-right" data-toggle="modal" data-target="#myModal">
					查&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;询</button>
			</div>
			<div class="dropdown">
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">员工信息列表</h3>
				</div>
				<div class="panel-body">
					<div class="table table-responsive">
						<table class="table table-bordered table-hover">
							<tr>
								<th class="text-center">#</th>
								<th class="text-center">姓名</th>
								<th class="text-center">性别</th>
								<th class="text-center">手机号</th>
						        <th class="text-center">微信号</th>
						        <th class="text-center">邮箱</th>
						  		<th class="text-center">录入时间</th>
						  		<th class="text-center">身份证号</th>
						  		<th class="text-center">操作</th>
							</tr>
							<tbody>
								<c:forEach items="${customersList}" var="customer" varStatus="C">
									<tr>
										<td class="text-center">${C.count}</td>
										<td class="text-center">${customer.name }</td>
										<td class="text-center">${customer.sex }</td>
										<td class="text-center">${customer.phone }</td>
										<td class="text-center">${customer.weixin }</td>
										<td class="text-center">${customer.email }</td>
										<td class="text-center"><fm:formatDate value="${customer.date}" /></td>
										<td class="text-center">${customer.idCard }</td>
										<td class="text-center">
										<a class="btn btn-success" style="height:22px;line-height: 0.8;"
											data-toggle="modal" data-target="#myModal3" onclick="findCustomer('${customer.id}')">更新</a> 
											<a class="btn btn-danger" style="height:22px;line-height: 0.8;"
											onclick="delCustomer('${customer.id}')">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<ul id="page"></ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$(function() {
		var currentPage = '${page.currentPage}'
		var totalPages = '${page.totalPage }';
		$("#page").bootstrapPaginator({
			bootstrapMajorVersion: 4, //对应的bootstrap版本
			currentPage: currentPage, //当前页数
			numberOfPages: 5, //每次显示页数
			totalPages: totalPages, //总页数
			shouldShowPage: true, //是否显示该按钮
			useBootstrapTooltip: true,
			itemTexts: function (type, page, current) {
                switch (type) {
                    case "first":
                        return "首页";
                    case "prev":
                        return "上一页";
                    case "next":
                        return "下一页";
                    case "last":
                        return "末页";
                    case "page":
                        return page;
                }
            },
			onPageClicked: function(event, originalEvent, type, page) {
				$(window).attr("location","${pageContext.request.contextPath}/customerController/showCustomer.action?currentPage="+page);
			}
		});
	});
</script>
 <!-- 模态框（Modal）增加客户 -->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">添加客户</h4>
					</div>
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<!-- 添加客户 -->
								<form class="form-horizontal"
									method="get" action="${pageContext.request.contextPath }/customerController/addCustomer.action"
									id="studentfindform" onsubmit="return checkSubmit()">
									<input type="hidden" value="1" name="currentPage">
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">姓名</label>
										<div   style="float:left;margin-left:15px;">
											<input id="name" onblur="checkName()" name="name"
												type="text" class="form-control" >
											<span id="spinfoname"></span>	
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">性别</label>
										<div   style="float:left;margin-left:15px;">
										<select style="width: 130px;" class="btn btn-default"
											id="sex" name="sex">
											<option value="男" id="boy">男</option>
											<option value="女" id="girl">女</option>
										</select>
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">手机号</label>
										<div   style="float:left;margin-left:15px;">
											<input id="phone" name="phone"
												type="text" onblur="checkPhone()" class="form-control" >
											<span id="spinfophone"></span>
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">微信号</label>
										<div   style="float:left;margin-left:15px;">
											<input id="weixin" onblur="checkWeiXin()" name="weixin"
												type="text" class="form-control" >
											<span id="spinfoweixin"></span>	
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">邮箱</label>
										<div   style="float:left;margin-left:15px;">
											<input id="email" name="email"
												type="text" onblur="checkEmail()" class="form-control" >
											<span id="spinfoemail"></span>
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">身份证号</label>
										<div   style="float:left;margin-left:15px;">
											<input id="idCard" onblur="checkIdCard()" name="idCard"
												type="text" class="form-control" >
											<span id="spinfoidCard"></span>
										</div>
									</div>
									
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<div class="form-group">
												<div class="col-md-8">
													<!--btn-group-justified 能够让按钮组根据父容器尺寸来设定各自相同的尺寸，采用响应式布局技术从而有利于移动端的用户体验。-->
													<div class="btn-group btn-group-justified">
														<div class="btn-group">
															<button type="submit" class="btn btn-success"
																id="tijiaostudentfind">
																<span class="glyphicon glyphicon-log-in"></span>&nbsp;确认
															</button>
														</div>
														<div class="btn-group">
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">
																<span class="glyphicon glyphicon-edit"></span>&nbsp;关闭
															</button>
														</div>
													</div>	
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>		
<!-- 模态框（Modal）查询客户信息 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">客户查询</h4>
					</div>
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<!-- 按姓名查找客户 -->
								<form class="form-horizontal"
									method="get" action="${pageContext.request.contextPath }/customerController/showFindCustomer.action"
									id="studentfindform">
									<input type="hidden" value="1" name="currentPage">
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">姓名</label>
										<div   style="float:left;margin-left:15px;">
											<input id="cname" name="cname"
												type="text" class="form-control" >
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">性别</label>
										<div   style="float:left;margin-left:15px;">
										<select style="width: 130px;" class="btn btn-default"
											id="sex" name="sex">
											<option value="男" id="boy">男</option>
											<option value="女" id="girl">女</option>
										</select>
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">手机号</label>
										<div   style="float:left;margin-left:15px;">
											<input id="phone" name="phone"
												type="text" class="form-control" >
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">微信号</label>
										<div   style="float:left;margin-left:15px;">
											<input id="wxh" name="wxh"
												type="text" class="form-control" >
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">最新修改日期</label>
										<div   style="float:left;margin-left:15px;">
											<input id="test1" name="test1"
												type="text" placeholder="请选择日期" class="form-control" onFocus="this.blur();WdatePicker({startDate:'%y',readonly:'true',lang:'zh-cn',dateFmt:'yyyy-MM-dd',minDate:'2000-01-02 00:00:00',maxDate:'2020-01-01 00:00:00'})">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<div class="form-group">
												<div class="col-md-8">
													<!--btn-group-justified 能够让按钮组根据父容器尺寸来设定各自相同的尺寸，采用响应式布局技术从而有利于移动端的用户体验。-->
													
														<div class="btn-group btn-group-justified">
														<div class="btn-group">
															<button type="submit" class="btn btn-success"
																id="tijiaostudentfind">
																<span class="glyphicon glyphicon-log-in"></span>&nbsp;查询
															</button>
														</div>
														<div class="btn-group">
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">
																<span class="glyphicon glyphicon-edit"></span>&nbsp;关闭
															</button>
														</div>
													</div>	
													
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>	
<!-- 模态框（Modal）修改客户 -->
		<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改客户</h4>
					</div>
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<!-- 根据id修改客户 -->
								<form class="form-horizontal"
									method="get" onsubmit="return checkSubmit3()" action="${pageContext.request.contextPath }/customerController/updateCustomer.action"
									id="studentfindform">
									<input type="hidden" value="" name="id" id="id3">
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">姓名</label>
										<div   style="float:left;margin-left:15px;">
											<input id="name3" onblur="checkName3()" name="name"
												type="text" class="form-control" >
											<span id="infoname"></span>		
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">性别</label>
										<div   style="float:left;margin-left:15px;">
										<select style="width: 130px;" class="btn btn-default"
											id="sex3" name="sex">
											<option value="男" id="boy">男</option>
											<option value="女" id="girl">女</option>
										</select>
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">手机号</label>
										<div   style="float:left;margin-left:15px;">
											<input id="phone3" onblur="checkPhone3()" name="phone"
												type="text" class="form-control" >
											<span id="infophone"></span>	
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">微信号</label>
										<div   style="float:left;margin-left:15px;">
											<input id="weixin3" onblur="checkWeiXin3()" name="weixin"
												type="text" class="form-control" >
											<span id="infoweixin"></span>	
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">邮箱</label>
										<div   style="float:left;margin-left:15px;">
											<input id="email3" onblur="checkEmail3()" name="email"
												type="text" class="form-control" >
											<span id="infoemail"></span>		
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">身份证号</label>
										<div   style="float:left;margin-left:15px;">
											<input id="idCard3" onblur="checkIdCard3()" name="idCard"
												type="text" class="form-control" >
											<span id="infoidCard"></span>		
										</div>
									</div>
									<div class="form-group">
										<label for="firstname" class="col-sm-3 control-label">录入日期</label>
										<div   style="float:left;margin-left:15px;">
											<input readonly="readonly" id="date3" name="date3"
												type="text" class="form-control" >
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<div class="form-group">
												<div class="col-md-8">
													<!--btn-group-justified 能够让按钮组根据父容器尺寸来设定各自相同的尺寸，采用响应式布局技术从而有利于移动端的用户体验。-->
													<div class="btn-group btn-group-justified">
														<div class="btn-group">
															<button type="submit" class="btn btn-success"
																id="tijiaostudentfind">
																<span class="glyphicon glyphicon-log-in"></span>&nbsp;确认
															</button>
														</div>
														<div class="btn-group">
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">
																<span class="glyphicon glyphicon-edit"></span>&nbsp;关闭
															</button>
														</div>
													</div>	
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>			

</body>
</html>