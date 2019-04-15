!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/admin/gonggaopagetype?pageIndex=" + pageindex;
});
function ingonggaolistdeletegonggaobyid(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			window.location.href = "/admin/deletegonggao?id=" + id;
			mizhu.alert('', '成功！','alert_red');
		}
	});
};
function  xiugaigonggao(id){
		$.ajax(
			    {
			        url:"/admin/xiugaitonggao",
			        data:{"gonggaoid":id},
			        type:"get",
			        dataType:"json",
			        success:function(data)
			        { 
			        	$("#xiugaigonggaoid").val(id);
			        	$("#xiugaigonggaobiaoti").val(data.biaoti);
			        	$("#xiugaigonggaotypeselect").val(data.type);
			        	$("#textareaCode").val(data.neirong);			        		  
			        	$("#xiugaigonggao").modal();		        	
			        },
			        error: function() {
			        	mizhu.alert('', '获取healthajax下拉框异常！','alert_red');
			          }
			    });
};
function findgonggaosuperadminselectse(){
	$("#findgonggaochildadminselect").val(0);
};
function findgonggaochildadminselectselect(){
	$("#findgonggaosuperadminselect").val(0);
};
function tijiaoxiugaigonggaobutton(){
	var id=$("#xiugaigonggaoid").val();
	var biaoti=$("#xiugaigonggaobiaoti").val();
	var type=$("#xiugaigonggaotypeselect").val();
	var neirong=$("#textareaCode").val();
	$.ajax(
		    {
		        url:"/admin/tijiaoxiugaitonggao",
		        data:{"id":id,"biaoti":biaoti,"type":type,"neirong":neirong},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	mizhu.alert('', data.data,'alert_red');		  
		        	$("#xiugaigonggao").modal('hide');		        	
		        },
		        error: function() {
		        	mizhu.alert('', '获取healthajax下拉框异常！','alert_red');	
		          }
		    });
};
function deletefind(){
	if (window.confirm('你确定删除查询到的数据？数据删除后永久无法恢复！')) {
		$.ajax(
    		    {
    		        url:"/admin/deletefindputongtongzhi",
    		        data:{},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        { 
    		        mizhu.alert('', data.data,'alert_red');		
                    window.location.href = "/admin/gonggaolist";
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');	
    		          }
    		    }); 
		return true;
	} else {
		mizhu.alert('', '取消！','alert_red');	
		return false;
	}
};