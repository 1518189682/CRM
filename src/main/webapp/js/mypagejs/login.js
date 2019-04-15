function textFocus(el) {
    if (el.defaultValue == el.value) { el.value = ''; el.style.color = '#333'; }
}
function textBlur(el) {
    if (el.value == '') { el.value = el.defaultValue; el.style.color = '#999'; }
}
function create_code() {
    /*function shuffle() {
        var arr = ['1', 'r', 'Q', '4', 'S', '6', 'w', 'u', 'D', 'I', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
            'q', '2', 's', 't', '8', 'v', '7', 'x', 'y', 'z', 'A', 'B', 'C', '9', 'E', 'F', 'G', 'H', '0', 'J', 'K', 'L', 'M', 'N', 'O', 'P', '3', 'R',
            '5', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
        return arr.sort(function () {
            return (Math.random() - 0.5);
        });
    };
    shuffle();*/
    function show_code() {
        var ar1 = '';
        /*var code = shuffle();*/
        for (var i = 0; i < 5; i++) {
            ar1 += Math.floor(Math.random()*10);
        };
        $(".reg-box .phoKey").text(ar1);
    };
    show_code();
    $(".reg-box .phoKey").click(function () {
        show_code();
    });
}

!$(function(){
	$("#yanzhengmaerror").fadeTo("fast",0);
	create_code();
		$("#loginBtn").click(function(){
			var loginName = $("#loginName");
			var password = $("#password");
			var yanzhengmatrue=$(".reg-box .phoKey").text();
			var yanzhengma=$("#key").val();
			if(loginName.val() == ""){
				mizhu.alert('', '登录名称不能为空','alert_red');
				loginName.focus();
				return false;
			}else if(password.val() == ""){
				mizhu.alert('', '密码不能为空','alert_red');
				password.focus();
				return false;
			}else if(yanzhengma == ""){
				mizhu.alert('', '请输入验证码!','alert_red');
				$("#key").focus();
				return false;
			}else if(yanzhengma != yanzhengmatrue){
				$("#yanzhengmaerror").fadeTo("fast",1);
		        for (var i = 0; i < 5; i++) {
		        	/*console.log(i);*/
						$("#yanzhengmaerror").fadeOut();						
						$("#yanzhengmaerror").fadeIn(200);						
		        };				
				$("#key").focus();
				return false;
			}else{$("#loginForm").submit();};
		});
	});
function wangjimimatijiaoxinmimabutton(){
	var zhanghao = $("#zhanghao").val();
	var shenfenzhenghao = $("#shenfenzhenghao").val();
	var xinmima = $("#xinmima").val();
	if(zhanghao!=""&&shenfenzhenghao!=""&&xinmima!=""){
    	$.ajax(
    		    {
    		        url:"/anyone/wangjimima",
    		        data:{"zhanghao":zhanghao,
    		        	"shenfenzhenghao":shenfenzhenghao,
    		        	"xinmima":xinmima},
    		        type:"get",
    		        dataType:"json",
    		        success:function(data)
    		        {  
    		        	mizhu.alert('', data.data,'alert_red');   		     
    		        	$("#wangjimima").modal('hide');
    		        },
    		        error: function() {
    		        	mizhu.alert('', '修改密码ajax异常！','alert_red'); 
    		          }
    		    });
}else{mizhu.alert('', '不能有空值','alert_red');};
};