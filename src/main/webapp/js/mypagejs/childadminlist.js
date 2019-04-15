!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/superadmin/childadminpagetype?pageIndex=" + pageindex;
});
function tianjiachildadminzhanghao(){
	$.ajax(
		    {
		        url:"/superadmin/tianjiachildadmin",
		        data:{},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	$("#tianjiachildadminnameinput").val(data.zhanghao);
		        	$("#tianjiachildadminmimainput").val(data.mima);
		        	$("#tianjiachildadmin").modal();
		        },
		        error: function() {
		        	mizhu.alert('', '添加childadminajax异常！','alert_red'); 
		          }
		    }); 
};
function deletechildadminbun(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			$.ajax(
				    {
				        url:"/superadmin/deletechildadmin",
				        data:{"id":id},
				        type:"get",
				        dataType:"json",
				        success:function(data)
				        { 
				        	mizhu.alert('', data.data,'alert_red'); 
				        },
				        error: function() {
				        	mizhu.alert('', '删除childadminajax异常！','alert_red');
				          }
				    });
		}
	});
};