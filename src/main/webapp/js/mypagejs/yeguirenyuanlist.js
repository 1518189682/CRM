!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/admin/yeguirenyuanpagetype?pageIndex=" + pageindex;
});
function tijiaotianjiayeguirenyuanbutton(){
	var xuehao=$("#tianjiayeguirenyuannameinput").val();
	if(xuehao!=""){
		$.ajax(
    		    {
    		        url:"/admin/tianjiayeguirenyuan",
    		        data:{"xuehao":xuehao},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {
    		        	mizhu.alert('', data.data,'alert_red');   		
                    alert(data.data);
                    $("#tianjiayeguirenyuan").modal('hide');
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');   		
    		          }
    		    }); 	
	}else{	mizhu.alert('', '请输入学号！','alert_red');};
};
function inyeguirenyuanlistdeleteyeguirenyuanbyid(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			window.location.href = "/admin/deleteyeguirenyuan?id=" + id;
		}
	});
};
function deletefind(){
	mizhu.confirm('', '你确定删除查询到的数据？数据删除后永久无法恢复！', function(flag) {
		if(flag) {
			$.ajax(
	    		    {
	    		        url:"/admin/deletefindyeguirenyuan",
	    		        data:{},
	    		        type:"get",
	    		        dataType:"json",
	    		        success:function(data)
	    		        { 
	    		        //mizhu.alert('',data.data,'alert_red');
	                    window.location.href = "/admin/yeguirenyuanlist?success";
	    		        },
	    		        error: function() {
	    		        	mizhu.alert('','ajax异常！','alert_red');	
	    		          }
	    		    }); 
		}
	});
};