!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/admin/baoxiupagetype?pageIndex=" + pageindex;
});
function inbaoxiulistdeletebaoxiubyid(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			window.location.href = "/admin/deletebaoxiu?id=" + id;
			mizhu.alert('', '成功');
		}
	});
};
function deletefind(){
	mizhu.confirm('', '你确定删除查询到的数据？数据删除后永久无法恢复！', function(flag) {
		if(flag) {
			$.ajax(
	    		    {
	    		        url:"/admin/deletefindbaoxiu",
	    		        data:{},
	    		        type:"get",
	    		        dataType:"json",
	    		        success:function(data)
	    		        {
	    		        	mizhu.alert('', data.data,'alert_red');
	                    window.location.href = "/admin/baoxiulist";
	    		        },
	    		        error: function() {
	    		        	mizhu.alert('', 'ajax异常！','alert_red');
	    		          }
	    		    }); 
		};
	});
};