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
<title>个人信息</title>
<link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=basePath%>css/style.css" />
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/easyUI/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath%>js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>js/easyUI/easyui.css">
<script type="text/javascript"
	src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
<link href="<%=basePath%>css/style.css" rel="stylesheet" />
<script src="<%=basePath%>js/ui.js"></script>
</head>
<body>
	<div class="container">
		<div class="row info-content">
			<form id="updateSelfForm" class="form-horizontal" method="post"
				style="margin-top: 20px;">
				<div class="form-group">
					<label class="col-sm-2 control-label">id</label>
					<div class="col-sm-3">
						<input name="person_id" id="person_id" readonly unselectable="on" style="border:none"
							value="${staff.id}" class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">登录账号</label>
					<div class="col-sm-3">
						<input readonly unselectable="on" id="person_username" name="person_username" style="border:none"
							value="${staff.username}" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">岗位</label>
					<div class="col-sm-3">
						<input readonly unselectable="on" id="person_job" name="person_job" style="border:none"
							value="${staff.jobs.j_name}" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">部门</label>
					<div class="col-sm-3">
						<input readonly unselectable="on" id="person_department" name="person_department" style="border:none"
							value="${staff.department.d_name}" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-3">
						<input type="text" id="person_name" name="person_name"
							value="${staff.u_name}" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-3">
						<select class="btn btn-default" id="person_sex" name="person_sex">
							<option ${staff.u_sex eq '男'?'selected':''} value="男">男</option>
							<option ${staff.u_sex eq '女'?'selected':''} value="女">女</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">出生日期:</label>
					<div class="col-sm-3">
						<input class="form-control" id="person_date" name="person_date"
							value="<fmt:formatDate value="${staff.date}" pattern="yyyy-MM-dd " />"
							onFocus="this.blur();WdatePicker({startDate:'%y',readonly:'true',lang:'zh-cn',dateFmt:'yyyy-MM-dd',minDate:'1900-01-02 00:00:00',maxDate:'2020-01-01 00:00:00'})" />
					</div>
				</div>
				
				
				<div class="form-group">
					<label class="col-sm-2 control-label">身份证号</label>
					<div class="col-sm-3">
						<input id="person_idcard" name="person_idcard" type="text"
							value="${staff.u_idcard}" class="form-control"
							placeholder="请输入您的身份证号">
					</div>

				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">电话</label>
					<div class="col-sm-3">
						<input id="person_phone" name="person_phone" type="text"
							value="${staff.u_phone}" class="form-control"
							placeholder="请输入您的联系方式">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">微信</label>
					<div class="col-sm-3">
						<input id="person_weixin" name="person_weixin" type="text"
							value="${staff.u_weixin}" class="form-control"
							placeholder="请输入您的微信">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">邮箱</label>
					<div class="col-sm-3">
						<input id="person_email" name="person_email" type="text"
							value="${staff.u_email}" class="form-control"
							placeholder="请输入您的邮箱">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"></label>
					<div class="col-sm-3">
						<button type="button" id="btn_submit" class="btn btn-success" onclick="updatestaff()">
							<span class="glyphicon glyphicon-edit"> 提交修改</span>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
		<!-- 编写js代码 -->
	<script type="text/javascript">
	// 修改员工，使用js
	function updatestaff() {
		// 对表单中所有字段做校验
		var  name= $("#person_name").val();
		var  date= $("#person_date").val();
		var  idcard= $("#person_idcard").val();
		var  phone= $("#person_phone").val();
		var  weixin= $("#person_weixin").val();
		var  email= $("#person_email").val();
		var msg = "";
		if ($.trim(name) == "") {
			msg += "请输入姓名！";
			$("#person_name").focus();
		} else if ($.trim(idcard) == "") {
			msg += "请输入身份证号!";
			$("#person_idcard").focus();
		} else if ($.trim(idcard).length != 18) {
			msg += "身份证号位数:"+$.trim(idcard).length+",不正确!";
			$("#person_idcard").focus();
		} else if ($.trim(date) == "") {
			msg += "请输入日期!";
			$("#person_date").focus();
		} else if ($.trim(weixin) == "") {
			msg += "请输入微信!";
			$("#person_weixin").focus();
		} else if ($.trim(phone) == "") {
			msg += "请输入手机号码!";
			$("#person_phone").focus();
		} else if (!/^1[3|5|8]\d{9}$/.test(phone)) {
			msg += "手机号码格式不正确!";
			$("#person_phone").focus();
		}else if ($.trim(email) == "") {
			msg += "请输入邮箱！!";
			$("#person_email").focus();
		}
		// 直接提交
		if (msg != "") {
         alert(msg);
		} else {
	$.post("<%=basePath%>staff/updatepersoninfo.action",
	$("#updateSelfForm").serialize(),function(data){
	        if(data =="OK"){
	        	mizhu.alert('', "修改成功！", 'alert_red');
	        }else{
	        	mizhu.alert('', "修改失败！", 'alert_red');
	        }
	    });};
	}

</script>
</body>
</html>