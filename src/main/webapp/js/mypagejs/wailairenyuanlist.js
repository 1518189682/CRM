!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/admin/wailairenyuanpagetype?pageIndex=" + pageindex;
});
function tijiaotianjiawailairenyuanbutton(){
	var name=$("#tianjiawailairenyuannameinput").val();
	var callnum=$("#tianjiawailairenyuancallnuminput").val();
	var mudi=$("#tianjiawailairenyuanmudiinput").val();
	if(callnum!=""&&name!=""&&mudi!=""){
		$.ajax(
    		    {
    		        url:"/admin/tianjiawailairenyuan",
    		        data:{"name":name,"callnum":callnum,"mudi":mudi},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        { 
    		        	mizhu.alert('', data.data,'alert_red');
                    $("#tianjiawailairenyuan").modal('hide');
    		        },
    		        error: function() {
    		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');	
    		          }
    		    }); 	
	}else{mizhu.alert('', "均不能为空！",'alert_red');};
};
function intianjiawailairenyuanlistdeletetianjiawailairenyuanbyid(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			window.location.href = "/admin/deletewailairenyuan?id=" + id;
		}
	});
};
function deletefind(){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			$.ajax(
	    		    {
	    		        url:"/admin/deletefindwailairenyuan",
	    		        data:{},
	    		        type:"get",
	    		        dataType:"json",
	    		        success:function(data)
	    		        { 
	                    window.location.href = "/admin/wailairenyuanlist?success";
	    		        },
	    		        error: function() {
	    		        	mizhu.alert('', 'ajax下拉框异常！','alert_red');	
	    		          }
	    		    });
		}
	});
};