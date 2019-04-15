//底部版权
var CreatStat={
	  creatDom:function(){
		 var copyright="<div class='footer'>"
		 +"<div id='bottom'>"
		 	+"<p class='botp1'>"
		 		+"<a target='_blank' href='/anyone/sxhpage'>关于作者</a>|"
		 		+"<a target='_blank' href='/anyone/sxhpage'>服务条款</a>|"
		 		+"<a target='_blank' href='/anyone/sxhpage'>联系开发者</a>"
		 	+"</p>"
			+"<p class='botp2'>版权归开发者所有</p>"
		 	+"<p class='botp4' style='color: #aaa;'>温馨提示：本系统正处于开发阶段，尚未完善！</p>"
		 +"</div>"
		 +"</div>"
		document.write(copyright);
	}
} 
CreatStat.creatDom();
