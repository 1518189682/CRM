!$(".pagination li a").click(function() {
	var pageindex = $(this).attr("pageindex");
	window.location.href = "/student/weishengforstudentpagetype?pageIndex=" + pageindex;
});