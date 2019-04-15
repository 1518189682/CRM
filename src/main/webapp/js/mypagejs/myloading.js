!$(function() {
	onload();
	/*$("body").append('<div id="myloading"><img th:src="@{../img/loading.gif}" class="img-responsive"></div>');*/
	})

function loadingshow(){
	$("#myloading").show();
}
function loadinghide(jieguo,st){
	$("#myloading").hide(0);
	if(jieguo=="success"){$.messager.alert('提示', st, 'right');}
	else $.messager.alert('错误提示', st, 'error');
}
function onload(){
	$("#myloading").hide(0);
}