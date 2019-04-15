<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/bootstrap-theme.min.css" />
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/mypagejs/myloading.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/myloading.css" />
<link href="<%=basePath%>css/style.css" rel="stylesheet" />
<script src="<%=basePath%>js/ui.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<link href="<%=basePath%>css/style.css" rel="stylesheet" />
<script src="<%=basePath%>js/ui.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-12">
			<div class="dropdown">
				<button class="btn btn-success btn-primary pull-right" data-toggle="modal"
					data-target="#addstaff" onclick="clearaddstaffmodal()" style="display: ${ishidden}">
					添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</button>
			</div>
			<div class="dropdown">
				<button class="btn btn-success btn-primary pull-right" data-toggle="modal" style="display: ${ishidden}"
					data-target="#findstaff">
					查&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;询</button>
			</div>
			<div class="dropdown">
			<a  style="display: ${mainishidden}" hidden="hidden" href="${pageContext.request.contextPath }/staff/find.action" class="btn btn-success btn-primary pull-right">
			主&nbsp;&nbsp;列&nbsp;&nbsp;表
		    </a>
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
								<th class="text-center">身份证号</th>
								<th class="text-center">手机号</th>
								<th class="text-center">微信号</th>
								<th class="text-center">邮箱</th>
								<th class="text-center">账号</th>
								<th class="text-center">岗位</th>
								<th class="text-center">部门</th>
								<th class="text-center">入职日期</th>
								<th class="text-center">操作</th>
							</tr>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="C">
									<tr>
										<td>${C.count}</td>
										<td>${row.u_name}</td>
										<td>${row.u_sex}</td>
										<td>${row.u_idcard}</td>
										<td>${row.u_phone}</td>
										<td>${row.u_weixin}</td>
										<td>${row.u_email}</td>
										<td>${row.username}</td>
										<td>${row.jobs.j_name}</td>
										<td>${row.department.d_name}</td>
										<td><fmt:formatDate value="${row.date}"
												pattern="yyyy-MM-dd " /></td>
										<!-- HH:mm:ss -->
										<td class="text-center"><a class="btn btn-success"
											data-toggle="modal" data-target="#updatestaff" style="height:22px;line-height: 0.8;"
											onclick="editstaff(${row.id})">更新</a> <a
											class="btn btn-danger" style="height:22px;line-height: 0.8;"
											onclick="deletestaff(${row.id})">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
						<itheima:page url="${pageContext.request.contextPath }/staff/find.action" />
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加员工modal -->
	<div class="modal fade" id="addstaff" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加员工</h4>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-12"> 
							<!--  -->
							<form class="form-horizontal" id="addstafffrom">
								<div class="form-group">
									<label class="col-sm-4 control-label">姓名：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="姓名" type="text"
											name="addstaff_name" id="addstaff_name" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">性别：</label>
									<div class="col-sm-5">
										<select class="form-control" id="sexselect"
											name="addstaff_sex">
											<option value="男">----男----</option>
											<option value="女">----女----</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">身份证号：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="身份证号" type="text"
											name="addstaff_idcard" id="addstaff_idcard" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">手机号：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="手机号" type="text"
											name="addstaff_phone" id="addstaff_phone" /> 
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">微信号：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="微信号" type="text"
											name="addstaff_weixin" id="addstaff_weixin" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">邮箱：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="邮箱" type="text"
											name="addstaff_email" id="addstaff_email" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">账号(6位)：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="账号(初始密码：123456)"
											type="text" name="addstaff_username" id="addstaff_username" />
									</div>
								</div>
								<input class="form-control" type="text" style="display: none"
									name="addstaff_password" id="addstaff_password" />
								<div class="form-group">
									<label class="col-sm-4 control-label">岗位:</label>
									<div class="col-sm-5">
										<select class="form-control" id="addstaff_jobs" 
											name="addstaff_jobs">
											<option value="0">..岗位..</option>
											<c:forEach items="${jobslist}" var="item">
												<option value="${item.id}">${item.j_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">部门:</label>
									<div class="col-sm-5">
										<select class="form-control" id="addstaff_department"
											name="addstaff_department">
											<option value="0">..部门..</option>
											<c:forEach items="${departmentlist}" var="item">
												<option value="${item.id}">${item.d_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">权限:</label>
									<div class="col-sm-5">
										<select class="form-control" id="addstaff_permission"
											name="addstaff_permission">
											<option value="0">..权限..</option>
											<c:forEach items="${permissionlist}" var="item">
												<option value="${item.id}">${item.p_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">入职日期:</label>
									<div class="col-sm-5">
										<input class="form-control" id="addstaff_date"
											name="addstaff_date"
											onFocus="this.blur();WdatePicker({startDate:'%y',readonly:'true',lang:'zh-cn',dateFmt:'yyyy-MM-dd',minDate:'2000-01-02 00:00:00',maxDate:'2020-01-01 00:00:00'})" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="form-group">
											<div class="col-md-8">
												<div class="btn-group btn-group-justified">
													<div class="btn-group">
														<button type="button" class="btn btn-success"
															id="addstaffbutton" onclick="createstaff()">
															<span class="glyphicon glyphicon-log-in"></span>&nbsp;提交
														</button>
													</div>
													<div class="btn-group">
														<button type="button" class="btn btn-danger"
															data-dismiss="modal">
															<span class="glyphicon glyphicon-edit"></span>&nbsp;取消
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

	<!-- 更新员工modal -->
	<div class="modal fade" id="updatestaff" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">更新员工</h4>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<!--  -->
							<form class="form-horizontal" id="updatestafffrom">
								<input class="form-control" type="text" style="display: none"
									name="update_id" id="update_id" />
								<div class="form-group">
									<label class="col-sm-4 control-label">姓名：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="姓名" type="text"
											name="update_name" id="update_name" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">性别：</label>
									<div class="col-sm-5">
										<select class="form-control" id="update_sexselect"
											name="update_sex">
											<option value="男">----男----</option>
											<option value="女">----女----</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">身份证号：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="身份证号" type="text"
											name="update_idcard" id="update_idcard" /> 
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">手机号：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="手机号" type="text"
											name="update_phone" id="update_phone" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">微信号：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="微信号" type="text"
											name="update_weixin" id="update_weixin" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">邮箱：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="邮箱" type="text"
											name="update_email" id="update_email" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">账号(6位)：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="账号" type="text"
											name="update_username" id="update_username" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">密码(6位)：</label>
									<div class="col-sm-5">
										<input class="form-control" placeholder="密码" type="password"
											name="update_password" id="update_password" />
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">岗位:</label>
									<div class="col-sm-5">
										<select class="form-control" id="update_jobs"
											name="update_jobs">
											<option value="0">..岗位..</option>
											<c:forEach items="${jobslist}" var="item">
												<option value="${item.id}">${item.j_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">部门:</label>
									<div class="col-sm-5">
										<select class="form-control" id="update_department"
											name="update_department">
											<option value="0">..部门..</option>
											<c:forEach items="${departmentlist}" var="item">
												<option value="${item.id}">${item.d_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">权限:</label>
									<div class="col-sm-5">
										<select class="form-control" id="update_permission"
											name="update_permission">
											<option value="0">..权限..</option>
											<c:forEach items="${permissionlist}" var="item">
												<option value="${item.id}">${item.p_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">入职日期:</label>
									<div class="col-sm-5">
										<input class="form-control" id="update_date"
											name="update_date"
											onFocus="this.blur();WdatePicker({startDate:'%y',readonly:'true',lang:'zh-cn',dateFmt:'yyyy-MM-dd',minDate:'2000-01-02 00:00:00',maxDate:'2020-01-01 00:00:00'})" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="form-group">
											<div class="col-md-8">
												<div class="btn-group btn-group-justified">
													<div class="btn-group">
														<button type="button" class="btn btn-success"
															id="updatebutton" onclick="updatestaff()">
															<span class="glyphicon glyphicon-log-in"></span>&nbsp;提交
														</button>
													</div>
													<div class="btn-group">
														<button type="button" class="btn btn-danger"
															data-dismiss="modal">
															<span class="glyphicon glyphicon-edit"></span>&nbsp;取消
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

	<!-- 查询模态框（Modal） -->
	<div class="modal fade" id="findstaff" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">查询</h4>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<!--  -->
							<form class="form-horizontal" method="get" 
				      action="${pageContext.request.contextPath }/staff/find.action">
								<div class="form-group">
									<label class="col-sm-4 control-label">姓名:</label>
									<div class="col-sm-5">
										<input id="findstaff_name"
											name="findstaff_name" type="text"
											class="form-control" placeholder="姓名">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">手机号:</label>
									<div class="col-sm-5">
										<input id="findstaff_phone"
											name="findstaff_phone" type="text"
											class="form-control" placeholder="手机号">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">部门:</label>
									<div class="col-sm-5">
										<select class="form-control" id="findstaff_department"
											name="findstaff_department">
											<option value="0">..部门..</option>
											<c:forEach items="${departmentlist}" var="item">
												<option value="${item.id}">${item.d_name }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">性别：</label>
									<div class="col-sm-5">
										<select class="form-control" id="findstaff_sexselect"
											name="findstaff_sex">
											<option value="0">----性别----</option>
											<option value="男">----男----</option>
											<option value="女">----女----</option>
										</select>
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
															id="findstaffbutton">
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

	<!-- 编写js代码 -->
	<script type="text/javascript">
//清空新建窗口中的数据
	function clearaddstaffmodal() {
	    $("#addstaff_name").val("");
	    $("#addstaff_idcard").val("")
	    $("#addstaff_phone").val("")
	    $("#addstaff_weixin").val("")
	    $("#addstaff_email").val("");
	    $("#addstaff_username").val("");
	    $("#addstaff_password").val("123456");
	    $("#addstaff_jobs").val(0);
	    $("#addstaff_department").val(0);
	    $("#addstaff_permission").val(0);
	    $("#addstaff_date").val("");
	}
	// 通过id获取修改的员工信息
	function editstaff(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>staff/getstaffById.action",
	        data:{"id":id},
	        success:function(data) {
	            $("#update_id").val(id);
	            $("#update_name").val(data.u_name);
	            $("#update_sexselect").val(data.u_sex)
	            $("#update_idcard").val(data.u_idcard)
	            $("#update_phone").val(data.u_phone)
	            $("#update_weixin").val(data.u_weixin);
	            $("#update_email").val(data.u_email);
	            $("#update_username").val(data.username);
	            $("#update_password").val(data.password);
	            $("#update_jobs").val(data.jobs.id);
	            $("#update_department").val(data.department.id);
	            $("#update_permission").val(data.permission.id);
	            $("#update_date").val(timestampToTime(data.date));
	        }
	    });
	}
	//将long类型时间戳转换为date时间表示
	function timestampToTime(timestamp) {
	    var date = new Date(timestamp);//时间戳为10位需*1000，时间戳为13位的话不需乘1000
	    Y = date.getFullYear() + '-';//此时为四位数字表示 getYear()的话为两位数字表示
	    M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';//当前月份(0-11,0代表1月)
	    D = date.getDate() + ' ';//当前日(1-31)
	    h = date.getHours() + ':';
	    m = (date.getMinutes() < 10 ? '0' + date.getMinutes() : date.getMinutes()) +':'; 
	    s = date.getSeconds() +':';
	    ms = date.getMilliseconds();//毫秒值
	    
	    return Y+M + D;//此处可以自定义需要的显示类型
	}
    // 执行修改员工操作
	function updatestaff() {
		var  name= $("#update_name").val();
		var  sex= $("#update_sexselect").val();
		var  idcard= $("#update_idcard").val();
		var  phone= $("#update_phone").val();
		var  weixin= $("#update_weixin").val();
		var  email= $("#update_email").val();
		var  username= $("#update_username").val();
		var  password= $("#update_password").val();
		var  jobs= $("#update_jobs").val();
		var  department= $("#update_department").val();
		var  permission= $("#update_permission").val();
		var  date= $("#update_date").val();
		var msg = "";
		if ($.trim(name) == "") {
			msg += "请输入姓名！";
		} else if ($.trim(idcard) == "") {
			msg += "请输入身份证号!";
		} else if ($.trim(idcard).length != 18) {
			msg += "身份证号位数:"+$.trim(idcard).length+",不正确!";
		} else if ($.trim(username) == "") {
			msg += "请输入账号!";
		} else if ($.trim(username).length != 6) {
			msg += "账号位数:"+$.trim(username).length+",不正确!";
		} else if ($.trim(password).length != 6) {
			msg += "密码位数:"+$.trim(password).length+",不正确!";
		}else if ($.trim(weixin) == "") {
			msg += "请输入微信!";
		} else if ($.trim(phone) == "") {
			msg += "请输入手机号码!";
		} else if (!/^1[3|5|8]\d{9}$/.test(phone)) {
			msg += "手机号码格式不正确!";
		} else if ($.trim(jobs) == "0") {
			msg += "请选择岗位!";
		} else if ($.trim(department) == "0") {
			msg += "请选择部门！";
		} else if ($.trim(permission) == "0") {
			msg += "请选择权限！";
		}else if ($.trim(date) == "") {
			msg += "请输入日期！";
		}
		// 直接提交
		if (msg != "") {
			mizhu.alert('', msg, 'alert_red');
		} else {
		$.post("<%=basePath%>staff/update.action",$("#updatestafffrom").serialize(),function(data){
			if(data =="OK"){
				mizhu.alert('', "员工信息修改成功！", 'alert_red');
				$("#updatestaff").modal("hide");
			}else{
				mizhu.alert('', "员工信息修改失败！", 'alert_red');
				//window.location.reload();//刷新
			}
		});}
	}
	// 创建员工，使用js
	function createstaff() {
		// 对表单中所有字段做校验
		var  name= $("#addstaff_name").val();
		var  sex= $("#sexselect").val();
		var  idcard= $("#addstaff_idcard").val();
		var  phone= $("#addstaff_phone").val();
		var  weixin= $("#addstaff_weixin").val();
		var  email= $("#addstaff_email").val();
		var  username= $("#addstaff_username").val();
		var  jobs= $("#addstaff_jobs").val();
		var  department= $("#addstaff_department").val();
		var  permission= $("#addstaff_permission").val();
		var  date= $("#addstaff_date").val();
		var msg = "";
		if ($.trim(name) == "") {
			msg += "请输入姓名！";
		} else if ($.trim(idcard) == "") {
			msg += "请输入身份证号!";
		} else if ($.trim(idcard).length != 18) {
			msg += "身份证号位数:"+$.trim(idcard).length+",不正确!";
		} else if ($.trim(username) == "") {
			msg += "请输入账号!";
		} else if ($.trim(username).length != 6) {
			msg += "账号位数:"+$.trim(username).length+",不正确!";
		} else if ($.trim(weixin) == "") {
			msg += "请输入微信!";
		} else if ($.trim(phone) == "") {
			msg += "请输入手机号码!";
		} else if (!/^1[3|5|8]\d{9}$/.test(phone)) {
			msg += "手机号码格式不正确!";
		} else if ($.trim(jobs) == "0") {
			msg += "请选择岗位!";
		} else if ($.trim(department) == "0") {
			msg += "请选择部门！";
		} else if ($.trim(permission) == "0") {
			msg += "请选择权限！";
		}else if ($.trim(date) == "") {
			msg += "请输入日期！";
		}
		// 直接提交
		if (msg != "") {
			mizhu.alert('', msg, 'alert_red');
		} else {
	$.post("<%=basePath%>staff/create.action",
	$("#addstafffrom").serialize(),function(data){
	        if(data =="OK"){
	        	mizhu.alert('', "添加成功！", 'alert_red');
	        	$("#addstaff").modal("hide");
	        }else{
	        	if(data =="existing"){
	        		mizhu.alert('', "账号已存在！", 'alert_red');
	        	}
	        	else{
	        	mizhu.alert('', "失败！", 'alert_red');
	            //window.location.reload();
	            }
	        }
	    });};
	}
	// 删除员工
	function deletestaff(id) {
		mizhu.confirm('', '确实要删除该员工吗?', function(flag) {
	    if(flag) {
	$.post("<%=basePath%>staff/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	            	mizhu.alert('', "删除员工成功！", 'alert_red');
	            }else{
	                mizhu.alert('',"删除员工失败！", 'alert_red');
	            }
	        });
	    }
	});}
</script>
</body>
</html>