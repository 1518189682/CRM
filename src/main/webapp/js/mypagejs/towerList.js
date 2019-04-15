!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/admin/towerpagetype?pageIndex=" + pageindex;
});
function towergengduoxinxi(id){
	$.ajax(
		    {
		        url:"/admin/gettowerxinxi",
		        data:{"towerid":id},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	$("#towerroomnum").val(data.roomnum);
		        	$("#towerstudentnum").val(data.studentnum);
		        	$("#towerzuidastudentnum").val(data.roomnum*6);
		        	$("#towergengduoxinxi").modal();		        	
		        },
		        error: function() {
		        	mizhu.alert('', '获取辅导员信息ajax下拉框异常！','alert_red'); 
		          }
		    }); 
};
function deletetowerbun(id){
	$("#deletetowerid").val(id);
	$("#gengxintowerid").val(id);
	$.ajax(
		    {
		        url:"/admin/gettowerbyid",
		        data:{"towerid":id},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	$("#gengxintowernameinput").val(data.name);	
		        	$("#gengxinchildadminlistselect").val(data.id);
		        },
		        error: function() {
		        	mizhu.alert('', '获取towerajax异常！','alert_red'); 
		          }
		    }); 
}
function tijiaodeletetowerbutton(){
	var mima=$("#deletetowerloginmima").val();
	var towerid=$("#deletetowerid").val();
if(mima==""){
	mizhu.alert('', '请输入密码！','alert_red');
}
else{
	$.ajax(
		    {
		        url:"/superadmin/deletetower",
		        data:{"mima":mima,"towerid":towerid},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	mizhu.alert('', data.data,'alert_red');
		        	$("#deletetower").modal('hide');	        	
		        },
		        error: function() {
		        	mizhu.alert('','删除towerajax异常！','alert_red');
		          }
		    }); 
};
};
function tijiaogengxintowerbutton(){
	var towerid=$("#gengxintowerid").val();
	var name=$("#gengxintowernameinput").val();
	var id=$("#gengxinchildadminlistselect").val();
	if(name==""){
		mizhu.alert('','请输入名字！','alert_red');
	}
	else{
		$.ajax(
			    {
			        url:"/superadmin/gengxintowername",
			        data:{"name":name,"towerid":towerid,"id":id},
			        type:"get",
			        dataType:"json",
			        success:function(data)
			        { 
			        	mizhu.alert('',data.data,'alert_red');
			        	$("#gengxingongyulouxinxi").modal('hide');	        	
			        },
			        error: function() {
			        	mizhu.alert('','更新楼名ajax异常！','alert_red');
			          }
			    }); 
	};
};
function tijiaotianjiatowerbutton(){
	var towername=$("#tianjiatowernameinput").val();
	var floornum=$("#tianjiafloornuminput").val();
	var roomnum=$("#tianjiaroomnuminput").val();
	var childadminid=$("#childadminlistselect").val();
	if(towername!=""&&floornum!=""&&roomnum!=""){
		$.ajax(
			    {
			        url:"/superadmin/tianjiatower",
			        data:{"towername":towername,"floornum":floornum,"roomnum":roomnum,"id":childadminid},
			        type:"get",
			        dataType:"json",
			        success:function(data)
			        { 
			        	mizhu.alert('',data.data,'alert_red');
			        	$("#tianjiatower").modal('hide');	        	
			        },
			        error: function() {
			        	mizhu.alert('','添加楼ajax异常！','alert_red');
			          }
			    }); 
	}
	else{mizhu.alert('','均不能有空值！','alert_red');}
};