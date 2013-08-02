$(document).ready(function () {
	$("body").click(function() {
	    $(".sports_list").hide();
	});
	
	$(".featured_dropdown").click(function (e) {
		e.stopPropagation();
		$(".sports_list").toggle();
	});
	
	$(".sports_list").click(function (e) {
		e.stopPropagation();
	});
})
