function shezhishi(cityname){
	$("#usershi").val(cityname);	
};
function shezhiatschool(val){
	$("#studentatschool").val(val);	
};
function upload(sex,cityid,boo){
	$("#usersex").val(sex);
	$.ajax(
		    {
		        url:"/user/findcitybyid",
		        data:{"cityid":cityid},
		        type:"get",
		        dataType:"json",
		        success:function(data)
		        {  
		        $("#usersheng").val(data.Provinceid);
		        usershengfen(data.Provinceid);
		        setTimeout('shezhishi("'+data.cityname+'")',200);
		        if(boo!='0'){setTimeout('shezhiatschool("'+boo+'")',200);};	        
		        },
		        error: function() {
		        	mizhu.alert('', "通过id查城市异常！", 'alert_red');
		          }
		    });
	
}
function userchengshi(){
if($("#usersheng").val()=="0"){
	mizhu.alert('', "请先选择省份！", 'alert_red');
}	
};
function usershengfen(value){
	
	if(value!="0"){
		$.ajax(
    		    {
    		        url:"/user/getcity",
    		        data:{"cityName":value},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	/* alert(data.citys.length);  */
    		        	$("option").remove(".italic");
    	           /* var num= "c0".replace(/[^0-9]/ig,"");//提取字符串中的数字 */ 
    		        for (var i=1;i<=data.citys.length;i++)
    		        {
    		        	$("#usershi0").after('<option class="italic" value="'+data.citys[i-1]+'">'+data.citys[i-1]+'</option>');
    		        }
    		        },
    		        error: function() {
    		        	mizhu.alert('', "省份下拉框异常！", 'alert_red');
    		          }
    		    }); 	
	}
    	
};

	!$(function() {
		$("#btn_submit").click(function() {

			// 对表单中所有字段做校验
			var phone = $("#username").val();
			var qqNum = $("#usersex").val();
			var answer = $("#zhongzhu").val();
			var shenfenzhenghao = $("#shenfenzhenghao").val();
			var dianhuahaoma = $("#dianhuahaoma").val();
			var xiangxijuzhudi = $("#xiangxijuzhudi").val();
			var usersheng = $("#usersheng").val();
			var usershi = $("#usershi").val();
			var mima=$("#mima").val();
			var userid=$("#userId").val();
			var chushengriqi=$("#chushengriqi").val();
			var msg = "";
			if ($.trim(chushengriqi) == "") {
				msg += "请输入出生日期！";
				chushengriqi.focus();
			}else if ($.trim(phone) == "") {
				msg += "姓名不能为空!";
				username.focus();
			} else if ($.trim(qqNum) == "2") {
				msg += "请选择性别!";
				usersex.focus();
			} else if ($.trim(answer) == "") {
				msg += "种族不能为空!";
				zhongzhu.focus();
			} else if ($.trim(shenfenzhenghao) == "") {
				msg += "身份证号不能为空!";
				shenfenzhenghao.focus();
			} else if ($.trim(dianhuahaoma) == "") {
				msg += "手机号码不能为空!";
				dianhuahaoma.focus();
			} else if (!/^1[3|5|8]\d{9}$/.test(dianhuahaoma)) {
				msg += "手机号码格式不正确!";
				dianhuahaoma.focus();
			} else if ($.trim(xiangxijuzhudi) == "") {
				msg += "详细居住地不能为空!";
				xiangxijuzhudi.focus();
			} else if ($.trim(usersheng) == "0") {
				msg += "请选择省份！";
			} else if ($.trim(usershi) == "0") {
				msg += "请选择市！";
			}
			// 直接提交
			if (msg != "") {
				mizhu.alert('', msg, 'alert_red');
			} else {
				$.ajax(
					    {
					        url:"/superadmin/xiugaixinxi",
					        data:{
					        	"userid" : userid,
					            "username" : phone,
					            "usersex" : qqNum,
					            "zhongzhu":answer,
					            "shenfenzhenghao":shenfenzhenghao,
					            "dianhuahaoma":dianhuahaoma,
					            "xiangxijuzhudi":xiangxijuzhudi,
					            "usersheng":usersheng,
					            "usershi":usershi,
					            "mima":mima,
					            "chushengriqi":chushengriqi
					    },
					        type:"get",
					        dataType:"json",
					        success:function(data)
					        {  
					        	mizhu.alert('', "成功！", 'alert_red');
					        },
					        error: function() {
					        	mizhu.alert('', "提交修改数据异常！", 'alert_red');
					          }
					    });
			}
		});
	});
	
	!$(function() {
		$("#student_submit").click(function() {

			// 对表单中所有字段做校验
			var chushengriqi=$("#chushengriqi").val();
			var phone = $("#username").val();
			var qqNum = $("#usersex").val();
			var answer = $("#zhongzhu").val();
			var xiangxijuzhudi = $("#xiangxijuzhudi").val();
			var usersheng = $("#usersheng").val();
			var usershi = $("#usershi").val();
			var shenfenzhenghao = $("#shenfenzhenghao").val();
			var dianhuahaoma = $("#dianhuahaoma").val();
			var jianhuren = $("#jianhuren").val();
			var jianhurendianhua = $("#jianhurendianhua").val();
			var studentatschool = $("#studentatschool").val();
			var studentbeizhu=$("#studentbeizhu").val();			
			var userid=$("#userId").val();
			
			var msg = "";
			if ($.trim(chushengriqi) == "") {
				msg += "请输入出生日期！";
			}else if ($.trim(phone) == "") {
				msg += "姓名不能为空!";
			} else if ($.trim(qqNum) == "2") {
				msg += "请选择性别!";
			} else if ($.trim(answer) == "") {
				msg += "种族不能为空!";
			} else if ($.trim(shenfenzhenghao) == "") {
				msg += "身份证号不能为空!";
			} else if ($.trim(dianhuahaoma) == "") {
				msg += "手机号码不能为空!";
			} else if (!/^1[3|5|8]\d{9}$/.test(dianhuahaoma)) {
				msg += "手机号码格式不正确!";
			} else if ($.trim(xiangxijuzhudi) == "") {
				msg += "详细居住地不能为空!";
			} else if ($.trim(usersheng) == "0") {
				msg += "请选择省份！";
			} else if ($.trim(usershi) == "0") {
				msg += "请选择市！";
			}else if ($.trim(jianhuren) == "") {
				msg += "请输入监护人姓名！";
			} else if ($.trim(jianhurendianhua) == "") {
				msg += "请输入监护人电话！";
			}
			// 直接提交
			if (msg != "") {
				mizhu.alert('', msg, 'alert_red');
			} else {
				$.ajax(
					    {
					        url:"/student/xiugaixinxi",
					        data:{
					        	"userid" : userid,
					            "username" : phone,
					            "usersex" : qqNum,
					            "zhongzhu":answer,
					            "shenfenzhenghao":shenfenzhenghao,
					            "dianhuahaoma":dianhuahaoma,
					            "xiangxijuzhudi":xiangxijuzhudi,
					            "usersheng":usersheng,
					            "usershi":usershi,
					            "chushengriqi":chushengriqi,
					            "jianhuren":jianhuren,
					            "jianhurendianhua":jianhurendianhua,
					            "studentatschool":studentatschool,
					            "studentbeizhu":studentbeizhu
					    },
					        type:"get",
					        dataType:"json",
					        success:function(data)
					        {  
					        	mizhu.alert('', "成功！", 'alert_red');
					        },
					        error: function() {
					        	mizhu.alert('', "提交修改数据异常！", 'alert_red');
					          }
					    });
			}
		});
	});
	!$(function() {
		$("#childadmin_submit").click(function() {

			// 对表单中所有字段做校验
			var chushengriqi=$("#chushengriqi").val();
			var phone = $("#username").val();
			var qqNum = $("#usersex").val();
			var answer = $("#zhongzhu").val();
			var xiangxijuzhudi = $("#xiangxijuzhudi").val();
			var usersheng = $("#usersheng").val();
			var usershi = $("#usershi").val();
			var shenfenzhenghao = $("#shenfenzhenghao").val();
			var dianhuahaoma = $("#dianhuahaoma").val();		
			var userid=$("#userId").val();
			
			var msg = "";
			if ($.trim(chushengriqi) == "") {
				msg += "请输入出生日期！";
			}else if ($.trim(phone) == "") {
				msg += "姓名不能为空!";
			} else if ($.trim(qqNum) == "2") {
				msg += "请选择性别!";
			} else if ($.trim(answer) == "") {
				msg += "种族不能为空!";
			} else if ($.trim(shenfenzhenghao) == "") {
				msg += "身份证号不能为空!";
			} else if ($.trim(dianhuahaoma) == "") {
				msg += "手机号码不能为空!";
			} else if (!/^1[3|5|8]\d{9}$/.test(dianhuahaoma)) {
				msg += "手机号码格式不正确!";
			} else if ($.trim(xiangxijuzhudi) == "") {
				msg += "详细居住地不能为空!";
			} else if ($.trim(usersheng) == "0") {
				msg += "请选择省份！";
			} else if ($.trim(usershi) == "0") {
				msg += "请选择市！";
			}
			// 直接提交
			if (msg != "") {
				mizhu.alert('', msg, 'alert_red');
			} else {
				$.ajax(
					    {
					        url:"/childadmin/xiugaixinxi",
					        data:{
					        	"userid" : userid,
					            "username" : phone,
					            "usersex" : qqNum,
					            "zhongzhu":answer,
					            "shenfenzhenghao":shenfenzhenghao,
					            "dianhuahaoma":dianhuahaoma,
					            "xiangxijuzhudi":xiangxijuzhudi,
					            "usersheng":usersheng,
					            "usershi":usershi,
					            "chushengriqi":chushengriqi
					    },
					        type:"get",
					        dataType:"json",
					        success:function(data)
					        {  
					        	mizhu.alert('', "成功！", 'alert_red');
					        },
					        error: function() {
					        	mizhu.alert('', "提交修改数据异常！", 'alert_red');
					          }
					    });
			}
		});
	});