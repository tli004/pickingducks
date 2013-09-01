$(function () {
	$(document).on("click", ".wager_link_home", function () {
	  	$.getScript(this.href)
	  	return false;
  	});
})
