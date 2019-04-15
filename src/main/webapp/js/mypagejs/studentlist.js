!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/admin/studentpagetype?pageIndex=" + pageindex;
});
function tijiaotianjiayeguirenyuanbutton(){
	var xuehao=$("#tianjiayeguirenyuannameinput").val();
	if(xuehao!=""){
		$.ajax(
    		    {
    		        url:"/childadmin/childadamintuisu",
    		        data:{"xuehao":xuehao},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        mizhu.alert('', data.data,'alert_red');
                    $("#tianjiayeguirenyuan").modal('hide');
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');	
    		          }
    		    }); 	
	}else{	mizhu.alert('', '请输入学号！','alert_red');};
};
function studenttowerselect(val){
	if(val!="0"){
		$.ajax(
    		    {
    		        url:"/admin/getfloor",
    		        data:{"towerid":val},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	$("option").remove(".flooroption");
    		        for (var i=1;i<=data.floors.length;i++)
    		        {
    		        	$("#floorselect0").after('<option class="flooroption" value="'+data.floors[i-1]+'">'+data.floors[i-1]+'楼</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', '楼层ajax下拉框异常！','alert_red');
    		          }
    		    }); 	
	};
};

function upload(boo){
	if(boo!=0){
		$("#findshifoufenpeiselect").val(2);
		$("#findtowerselect").val(boo);
		findstudenttowerselect(boo);
	};	
}
function studentgengxin(id){
	$.ajax(
		    {
		        url:"/admin/getstudent",
		        data:{"studentid":id},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	$("#studentid").val(data.id);
		        	$("#studentchuanghao").val(data.chuanghao);
		        	$("#shifouzaixiao").val(data.atshool);
		        	$("#beizhuqingkuang").val(data.beizhu);
		        	$("#towerselect").val(data.towerid);
		        	studenttowerselect(data.towerid);
		        	setTimeout('$("#floorselect").val("'+data.floornum+'")',200);
		        	setTimeout('studentfloorselect("'+data.floornum+'")',200);
		        	setTimeout('$("#roomselect").val("'+data.roomnum+'")',500);
		        	$("#gengxinxueshengxinxi").modal();		        	
		        },
		        error: function() {
		        	mizhu.alert('', '获取studentajax下拉框异常！','alert_red');
		          }
		    }); 	
};
function studentroomselect(){
	if($("#floorselect").val()=="0"){
		mizhu.alert('', '请先选择层号！','alert_red');	
	};
};
function studentfloorselect(val){
	var towerid=$("#towerselect").val();
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
    		        	$("option").remove(".roomoption");
    		        for (var i=1;i<=data.rooms.length;i++)
    		        {
    		        	$("#roomselect0").after('<option class="roomoption" value="'+data.rooms[i-1]+'">'+data.rooms[i-1]+'号房间</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', '房间ajax下拉框异常！','alert_red');	
    		          }
    		    }); 	
	};}
	else{mizhu.alert('', '请先选择楼号！','alert_red');};
};
function tijiaogengxinxueshengxinxibutton(){
	var id=$("#studentid").val();
	var towerselect=$("#towerselect").val();
	var floorselect=$("#floorselect").val();
	var roomselect=$("#roomselect").val();
	var studentchuanghao=$("#studentchuanghao").val();
	var shifouzaixiao=$("#shifouzaixiao").val();
	var beizhuqingkuang=$("#beizhuqingkuang").val();
if(towerselect!="0"&&floorselect!="0"&&roomselect!="0"&&studentchuanghao!=""&&shifouzaixiao!=""){
	$.ajax(
		    {
		        url:"/admin/genggaistudentxinxi",
		        data:{"id":id,"towerselect":towerselect,"floorselect":floorselect,
		        	"roomselect":roomselect,"studentchuanghao":studentchuanghao,
		        	"shifouzaixiao":shifouzaixiao,"beizhuqingkuang":beizhuqingkuang},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        {  
		        	mizhu.alert('', '数据修改成功！请点击本页页码刷新页面！','alert_red');
		        	$("#gengxinxueshengxinxi").modal('hide');
		        },
		        error: function(data) {
		        	mizhu.alert('', '更改学生信息ajax下拉框异常！','alert_red');
		          }
		    }); 
}
else{mizhu.alert('', '除备注之外均不能为空值！','alert_red');};
};
function findstudentshifoufenpeiselect(val){
	if($("#findshifoufenpeiselect").val()!="2"){
		$("#findtowerselect").val(0);
		$("#findfloorselect").val(0);
		$("#findroomselect").val(0);
	};
};
function findstudenttowerselect(val){
	if($("#findshifoufenpeiselect").val()=="2"){
	if(val!="0"){
		$.ajax(
    		    {
    		        url:"/admin/getfloor",
    		        data:{"towerid":val},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	$("option").remove(".findflooroption");
    		        for (var i=1;i<=data.floors.length;i++)
    		        {
    		        	$("#findfloorselect0").after('<option class="findflooroption" value="'+data.floors[i-1]+'">'+data.floors[i-1]+'楼</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'find楼层ajax下拉框异常！','alert_red');
    		          }
    		    }); 	
	};}
	else{mizhu.alert('', '请先选择已分配！','alert_red');};
};
function ruzhufindstudentfloorselect(val,towerid){
	if(val!="0"){
		$.ajax(
    		    {
    		        url:"/admin/getroom",
    		        data:{"towerid":towerid,"floornum":val},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	$("option").remove(".findroomoption1");
    		        for (var i=1;i<=data.rooms.length;i++)
    		        {
    		        	$("#findroomselect1").after('<option class="findroomoption1" value="'+data.roomids[i-1]+'">'+data.rooms[i-1]+'号房间</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'find房间ajax下拉框异常！','alert_red');
    		          }
    		    }); 	
	};
};
function findstudentfloorselect(val){
	var towerid=$("#findtowerselect").val();
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
    		        	$("option").remove(".findroomoption");
    		        for (var i=1;i<=data.rooms.length;i++)
    		        {
    		        	$("#findroomselect0").after('<option class="findroomoption" value="'+data.rooms[i-1]+'">'+data.rooms[i-1]+'号房间</option>');
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
	if($("#findfloorselect").val()=="0"){
		mizhu.alert('', '请先选择层号！','alert_red');
	};
};
function ruzhufindstudentroomselect(val){
	if($("#ruzhufindfloorselect").val()=="0"){
		mizhu.alert('', '请先选择层号！','alert_red');
	}else{
		if(val!="0"){
		$.ajax(
    		    {
    		        url:"/childadmin/getchuanghao",
    		        data:{"val":val},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	$("#ruzhuxueshengchuanghaoinput").val(data.data);
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');
    		          }
    		    });};
		};
};
function tijiaoruzhuxueshengbutton(){
	var studentnum=$("#ruzhuxueshengnameinput").val();
	var roomid=$("#ruzhufindroomselect").val();
	var chuanghao=$("#ruzhuxueshengchuanghaoinput").val();
	if(studentnum!=""&&roomid!=0&&chuanghao!=""){
		$.ajax(
    		    {
    		        url:"/childadmin/studentruzhuroom",
    		        data:{"studentnum":studentnum,"roomid":roomid,"chuanghao":chuanghao},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	mizhu.alert('', data.data,'alert_red');
    		    		$("#ruzhuxuesheng").modal('hide');
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');
    		          }
    		    });
	}
	else{mizhu.alert('', '不能有空！','alert_red');};
};
function findbanjimingchengselect(){
	if($("#findnianjiselect").val()=="0"){
		mizhu.alert('', '请先选择级别！','alert_red');
	};
};
function findnianjimingchengselect(val){
	if(val!="0"){
		$.ajax(
    		    {
    		        url:"/admin/getbanji",
    		        data:{"nianjiid":val},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	$("option").remove(".banjioption");
    		        for (var i=1;i<=data.Grades.length;i++)
    		        {
    		        	$("#findbanjiselect0").after('<option class="banjioption" value="'+data.Grades[i-1]+'">'+data.Grades[i-1]+'</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', '年级ajax下拉框异常！','alert_red');
    		          }
    		    }); 	
	};
};
function duqustudentxinxi(id){
	$.ajax(
		    {
		        url:"/admin/getstudent",
		        data:{"studentid":id},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	$("#readuserId").val(data.id);
		        	$("#readyonghuming").val(data.username);
		        	$("#readdizhi").val(data.dizhi);
		        	$("#readshenfenzhenghao").val(data.shenfenzhenghao);
		        	$("#readchushengtime").val(data.chuashengriqi);
		        	$("#readzhongzhu").val(data.zhongzhu);
		        	$("#readjianhurenname").val(data.jianhuren);
		        	$("#readjianhurendianhua").val(data.jianhurencall);
		        	$("#Studentxiangxixinxi").modal();		        	
		        },
		        error: function() {
		        	mizhu.alert('', '获取studentajax下拉框异常！','alert_red');
		          }
		    }); 
};
function duqufudaoyuanxinxi(id){
	$.ajax(
		    {
		        url:"/admin/getfudaoyuan",
		        data:{"fudaoyuanid":id},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	$("#readfudaoyuanname").val(data.name);
		        	$("#readfudaoyuansex").val(data.xingbie);
		        	$("#readfudaoyuanzhongzu").val(data.zhongzu);
		        	$("#readfudaoyuandianhua").val(data.dianhua);
		        	$("#fudaoyuanxiangxixinxi").modal();		        	
		        },
		        error: function() {
		        	mizhu.alert('', '获取辅导员信息ajax下拉框异常！','alert_red');
		          }
		    }); 
};