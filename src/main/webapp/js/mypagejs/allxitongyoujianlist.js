!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
   window.location.href = "/admin/allxitongyoujianpagetype?pageIndex=" + pageindex;
});
function panduan(){
	if($("#findusertypeselect").val()==0){alert("请先选择人物类型");};
};
function findyoujianselect1onclik(val){
	if(val==0){$("#findshoufatypeselect").val(0);};
};
function inyoujianlistdeleteyoujianbyid(id){
	mizhu.confirm('', '你确定删除？', function(flag) {
		if(flag) {
			window.location.href = "/admin/deleteyoujian?id=" + id;
		}
	});
};
function deletefind(){
	mizhu.confirm('', '你确定删除查询到的数据？数据删除后永久无法恢复！', function(flag) {
		if(flag) {
			$.ajax(
	    		    {
	    		        url:"/admin/deletefindyoujian",
	    		        data:{},
	    		        type:"get",
	    		        dataType:"json",
	    		        success:function(data)
	    		        { 
	                    window.location.href = "/admin/allxitongyoujianlist?success";
	    		        },
	    		        error: function() {
	    		        	mizhu.alert('', 'ajax异常！','alert_red');
	    		          }
	    		    }); 
		}
	});
};