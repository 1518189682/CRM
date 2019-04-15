function huifuyoujian(id){
	var formData = new FormData();
    formData.append("upfile", $("#huifuyoujianupfile")[0].files[0]);    //生成一对表单属性
    formData.append("neirong", $("#huifuyoujiantextareaCode").val());
    formData.append("biaoti", $("#huifuyoujianbiaoti").val());
    formData.append("id", id);
    $.ajax({
        type: "POST",           //因为是传输文件，所以必须是post
        url:"/user/huifu",         //对应的后台处理类的地址
        data: formData,
        processData: false,
        contentType: false,
    success:function(data)
    {  
    	mizhu.alert('', data.data,'alert_red'); 
    	$("#huifuyoujian").modal('hide');
    },
    error: function() {
    	mizhu.alert('', '异常','alert_red'); 
      }
    });
};