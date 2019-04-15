<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://itheima.com/common/"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门管理</title>
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
<script type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-12">
			<div class="dropdown">
				<button class="btn btn-success pull-right " data-toggle="modal"
					data-target="#addDepartment" onclick="clearaddDepartment()">
					添&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;加</button>
			</div>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">部门信息列表</h3>
				</div>
				<div class="panel-body">
					<div class="table table-responsive">
						<table class="table table-bordered table-hover">
							<tr>
								<th class="text-center">部门编号</th>
								<th class="text-center">部门名称</th>
								<th class="text-center">部门人数</th>
								<th class="text-center">操作</th>
							</tr>
							<tbody>
								<c:forEach items="${list}" var="row">
									<tr>
										<td class="text-center">${row.d_no}</td>
										<td class="text-center">${row.d_name}</td>
										<td class="text-center">${row.d_number}</td>
									
										<td class="text-center"><a class="btn btn-success " data-toggle="modal"
					data-target="#updateDepartment" onclick= "editDepartment(${row.id})" style="height:22px;line-height: 0.8;">修改</a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a class="btn btn-danger  " onclick="deleteDepartment(${row.id})" style="height:22px;line-height: 0.8;">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 添加部门modal -->
<div class="modal fade" id="addDepartment" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="text-align:center">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">添加部门</h4>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<!--  -->
							<form class="form-horizontal" id="addDepartmentFrom">
                               <div class="form-group">
									<label class="col-sm-4 control-label">部门编号：</label>
											<div class="col-sm-5">
												<input class="form-control" placeholder="编号" type="text"
														name="addDepartment_no" id="addDepartment_no" />
											</div>
				                 </div>
                               <div class="form-group">
									<label class="col-sm-4 control-label">部门名称：</label>
											<div class="col-sm-5">
												<input class="form-control" placeholder="名称" type="text"
														name="addDepartment_name" id="addDepartment_name" />
											</div>
				                 </div>
                               <div class="form-group">
									<label class="col-sm-4 control-label">部门人数：</label>
											<div class="col-sm-5">
												<input class="form-control" placeholder="人数" type="text"
														name="addDepartment_num" id="addDepartment_num" readonly unselectable="on"/>
											</div>
				                 </div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="form-group">
											<div class="col-md-8">
												<div class="btn-group btn-group-justified">
													<div class="btn-group">
														<button type="button" class="btn btn-success"
															id="addDepartmentButton" onclick="createDepartment()">
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
	
	<!-- 修改部门modal -->
<div class="modal fade" id="updateDepartment" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="text-align:center">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">更新部门</h4>
				</div>
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<!--  -->
						<form class="form-horizontal" id="updateDepart">
							<input class="form-control"  type="text" style="display:none"
														name="update_id" id="update_id" />
                               <div class="form-group">
									<label class="col-sm-4 control-label">部门编号：</label>
											<div class="col-sm-5">
												<input class="form-control" placeholder="编号"  type="text"
														name="update_no" id="update_no" />
											</div>
				                 </div>
				                 <div class="form-group">
									<label class="col-sm-4 control-label">部门名称：</label>
											<div class="col-sm-5">
												<input class="form-control" placeholder="名称" type="text"
														name="update_name" id="update_name" />
											</div>
				                 </div>
				                 <div class="form-group">
									<label class="col-sm-4 control-label">部门人数：</label>
											<div class="col-sm-5">
												<input class="form-control" placeholder="人数" type="text"
														name="update_num" id="update_num"  readonly unselectable="on"/>
											</div>
				                 </div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<div class="form-group">
											<div class="col-md-8">
												<div class="btn-group btn-group-justified">
													<div class="btn-group">
														<button type="button" class="btn btn-success"
															id="updateButton" onclick="updateDepartment()">
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
	
	<!-- 编写js代码 -->
<script type="text/javascript">
//清空新建窗口中的数据
	function clearaddDepartment() {
	    $("#addDepartment_no").val("");
	    $("#addDepartment_name").val("");
	    $("#addDepartment_num").val("0");
	 
	}
	// 通过id获取修改的部门信息
	function editDepartment(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>department/getDepartmentById.action",
	        data:{"id":id},
	        success:function(data) {
	        	$("#update_id").val(data.id);
	            $("#update_no").val(data.d_no);
	            $("#update_name").val(data.d_name);
	            $("#update_num").val(data.d_number)
	        }
	    });
	}
	/* //将long类型时间戳转换为date时间表示
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
	} */
    // 执行修改部门操作
	function updateDepartment() {
		$.post("<%=basePath%>department/update.action",$("#updateDepart").serialize(),function(data){
			if(data =="OK"){
				alert("部门信息修改成功！");
				window.location.reload();
			}else{
				alert("部门信息修改失败！");
				window.location.reload();
			}
		});
	}
	// 创建部门，使用js
	function createDepartment() {
		var no=$("#addDepartment_no").val();
	    var name=$("#addDepartment_name").val();
	    var msg = "";
	    if ($.trim(no) == "") {
	    	msg += "请输入编号！";
		}else if ($.trim(name) == "") {
			msg += "请输入部门名称!";
		};
		if (msg != "") {
			alert(msg);
		} else {
	$.post("<%=basePath%>department/create.action",
	$("#addDepartmentFrom").serialize(),function(data){
	        if(data =="OK"){
	            alert("添加成功！");
	            window.location.reload();
	        }else{
	            alert("失败！");
	            window.location.reload();
	        }
	    });};
	}
	// 删除部门
	function deleteDepartment(id) {
	    if(confirm('确实要删除该部门吗?')) {
	$.post("<%=basePath%>department/delete.action",{"id":id},
	function(data){
	            if(data =="OK"){
	                alert("部门删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除部门失败！");
	                window.location.reload();
	            }
	        });
	    }
	}
</script>
</body>
</html>