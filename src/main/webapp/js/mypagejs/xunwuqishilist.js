!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/user/Xunwuqishipagetype?pageIndex=" + pageindex;
});
function deletefind(){
	mizhu.confirm('', '你确定删除查询到的数据？数据删除后永久无法恢复！', function(flag) {
		if(flag) {
			$.ajax(
	    		    {
	    		        url:"/user/deletefindxunwuqishi",
	    		        data:{},
	    		        type:"get",
	    		        dataType:"json",
	    		        success:function(data)
	    		        {
	    		        //mizhu.alert('', data.data,'alert_red'); 
	                    window.location.href = "/user/Xunwuqishilist?success";
	    		        },
	    		        error: function() {
	    		        	mizhu.alert('', 'ajax异常！','alert_red'); 
	    		          }
	    		    });
		}
	});
};
function inXunwuqishilistdeleteXunwuqishibyid(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			window.location.href = "/user/deleteXunwuqishi?id=" + id;
		}
	});
};
function  xiugaiXunwuqishi(id){
	$.ajax(
		    {
		        url:"/student/xiugaixunwuqishi",
		        data:{"id":id},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	$("#xiugaixunwuqishiid").val(id);
		        	$("#xiugaixunwuqishibiaoti").val(data.biaoti);
		        	$("#xiugaixunwuqishitextareaCode").val(data.neirong);			        		  
		        	$("#xiugaixunwuqishi").modal();		        	
		        },
		        error: function() {
		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');
		          }
		    });
};
function tijiaoxiugaixunwuqishibutton(){
	var id=$("#xiugaixunwuqishiid").val();
	var biaoti=$("#xiugaixunwuqishibiaoti").val();
	var neirong=$("#xiugaixunwuqishitextareaCode").val();
	$.ajax(
		    {
		        url:"/student/tijiaoxiugaixunwuqishi",
		        data:{"id":id,"biaoti":biaoti,"neirong":neirong},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        { 
		        	mizhu.alert('', data.data,'alert_red');	  
		        	$("#xiugaixunwuqishi").modal('hide');		        	
		        },
		        error: function() {
		        	mizhu.alert('', '获取healthajax下拉框异常！','alert_red');	  
		          }
		    });
};