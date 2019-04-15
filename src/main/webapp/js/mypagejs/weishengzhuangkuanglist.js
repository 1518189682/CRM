!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/admin/Healthpagetype?pageIndex=" + pageindex;
});
!$(function(){
	$("#tijiaotianjiaweisheng").click(function(){
		var floornum=$("#tianjiaweishengfloorselect").val();
		var roomnum=$("#tianjiaweishengroomselect").val();
		var dengji=$("#tianjiaweishengdengjiselect").val();
		if(floornum!="0"&&roomnum!="0"&&dengji!="0"){
			$("#tianjiaweishengform").submit();
		}
		else{mizhu.alert('', '除说明外都不能为空','alert_red');}
	});
});
function deletefind(){
	mizhu.confirm('', '你确定删除查询到的数据？数据删除后永久无法恢复！', function(flag) {
		if(flag) {
			$.ajax(
	    		    {
	    		        url:"/admin/deletefindweishengzhungkuang",
	    		        data:{},
	    		        type:"get",
	    		        dataType:"json",
	    		        success:function(data)
	    		        { 
	    		        	mizhu.alert('', data.data,'alert_red');
	                    window.location.href = "/admin/Healthlist";
	    		        },
	    		        error: function() {
	    		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');	
	    		          }
	    		    }); 
		}
	});
};
function upload(boo){
	if(boo!=0){
		$("#findhealthtowerselect").val(boo);
		$("#tianjiaweishengtowerselect").val(boo);
		findstudenttowerselect(boo);
	};	
}
function deletehealth(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			window.location.href = "/admin/deletehealth?id=" + id;
		}
	});
};
function findstudenttowerselect(val){
	if(val!="0"){
		$.ajax(
    		    {
    		        url:"/admin/getfloor",
    		        data:{"towerid":val},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	$("option").remove(".findhealthflooroption");
    		        for (var i=1;i<=data.floors.length;i++)
    		        {
    		        	$("#tianjiaweishengfloorselect0").after('<option class="findhealthflooroption" value="'+data.floors[i-1]+'">'+data.floors[i-1]+'楼</option>');
    		        	$("#findhealthfloorselect0").after('<option class="findhealthflooroption" value="'+data.floors[i-1]+'">'+data.floors[i-1]+'楼</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'find楼层ajax下拉框异常！','alert_red');
    		          }
    		    }); 	
	};
};

function findstudentfloorselect(val){
	var towerid=$("#findhealthtowerselect").val();
	if(towerid!="0"){
	if(val!="0"){
		$.ajax(
    		    {
    		        url:"/admin/getroom",
    		        data:{"towerid":towerid,"floornum":val},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	$("option").remove(".findhealthroomoption");
    		        for (var i=1;i<=data.rooms.length;i++)
    		        {
    		        	$("#findhealthroomselect0").after('<option class="findhealthroomoption" value="'+data.rooms[i-1]+'">'+data.rooms[i-1]+'号房间</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'find房间ajax下拉框异常！','alert_red');
    		          }
    		    }); 	
	};}
	else{mizhu.alert('', '请先选择楼号！','alert_red');};
};
function tianjiahealshfindstudentfloorselect(val){
	var towerid=$("#findhealthtowerselect").val();
	if(towerid!="0"){
	if(val!="0"){
		$.ajax(
    		    {
    		        url:"/admin/getroom",
    		        data:{"towerid":towerid,"floornum":val},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	$("option").remove(".findhealthroomoption");
    		        for (var i=1;i<=data.rooms.length;i++)
    		        {
    		        	$("#tianjiaweishengroomselect0").after('<option class="findhealthroomoption" value="'+data.rooms[i-1]+'">'+data.rooms[i-1]+'号房间</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'find房间ajax下拉框异常！','alert_red');
    		          }
    		    }); 	
	};}
	else{mizhu.alert('', '请先选择楼号！','alert_red');};
};
function findstudentroomselect(){
	if($("#findhealthfloorselect").val()=="0"){
		mizhu.alert('', '请先选择层号！','alert_red');
	};
};
function tianjiahealshfindstudentroomselect(){
	if($("#tianjiaweishengfloorselect").val()=="0"){
		mizhu.alert('', '请先选择层号！','alert_red');
	};
};
function xiugaihealth(id){
	$.ajax(
		    {
		        url:"/admin/xiugaihealth",
		        data:{"healthid":id},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	$("#xiugaihealthid").val(id);
		        	$("#xiugaihealthdengjiselect").val(data.dengji);
		        	$("#xiugaihealthtime").val(data.riqi);
		        	$("#xiugaihealthshuoming").val(data.shuoming);		  
		        	$("#xiugaihealth").modal();		        	
		        },
		        error: function() {
		        	mizhu.alert('', '获取healthajax下拉框异常！','alert_red');
		          }
		    });
};
function tijiaoxiugaihealthbutton(){
	var healthid=$("#xiugaihealthid").val();
	var dengji=$("#xiugaihealthdengjiselect").val();
	var riqi=$("#xiugaihealthtime").val();
	var shuoming=$("#xiugaihealthshuoming").val();	
	if(dengji!="0"&&riqi!=""){
		$.ajax(
			    {
			        url:"/admin/tijiaoxiugaihealth",
			        data:{"healthid":healthid,"dengji":dengji,"riqi":riqi,"shuoming":shuoming},
			        type:"get",
			        dataType:"json",
			        success:function(data)
			        { 
			        	mizhu.alert('', data.data,'alert_red');		  
			        	$("#xiugaihealth").modal('hide');		        	
			        },
			        error: function() {
			        	mizhu.alert('', '获取healthajax下拉框异常！','alert_red');	
			          }
			    });
	}
	else{
		mizhu.alert('', '日期和等级不能为空！','alert_red');
	}

};