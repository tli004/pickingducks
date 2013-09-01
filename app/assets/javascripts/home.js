$(document).ready(function () {
	if ($("#consensus_slider").length > 0)
		$("#consensus_slider").anythingSlider({theme : "minimalist-round", autoPlay : true, delay : 8000,  buildNavigation : false, resizeContents : false, hashTags : false});	

	$(document).on("click", ".wager_link_home", function () {
	  	$.getScript(this.href)
	  	return false;
  	});  	
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
