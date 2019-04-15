	    function tijiaoyoujianbutton(){
	    	var biaoti=$("#fayoujianbiaoti").val();
			var neirong=$("#fayoujiantextareaCode").val();
			if(biaoti!=""&&neirong!=""){
				var formData = new FormData();
			    formData.append("upfile", $("#upfile")[0].files[0]);    //生成一对表单属性
			    formData.append("fayoujianselect", $("#fayoujianselect").val());
			    formData.append("fayoujianbiaoti", biaoti);
			    formData.append("fayoujiantextareaCode", neirong);
			    $.ajax({
			        type: "POST",           //因为是传输文件，所以必须是post
			        url: '/user/fayoujiantijiao',         //对应的后台处理类的地址
			        data: formData,
			        processData: false,
			        contentType: false,
			    success:function(data)
		        {  
			    	mizhu.alert('', data.retu,'alert_red');
		        },
		        error: function() {
		        	mizhu.alert('', '异常','alert_red');
		          }
			    });
			}
			else{mizhu.alert('', '标题和内容不能为空！','alert_red'); }
			
	    };