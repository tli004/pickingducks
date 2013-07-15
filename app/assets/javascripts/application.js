// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.position
//= require jquery.ui.dialog
//= require_tree .
//= require jquery.ui.tabs
function show_sign_up() {
	$('#sign_up').dialog("open");
}
function show_log_in() {
	$('#log_in').dialog("open");
}

function logout() {
	window.location = "/log_out";
}

function get_featured(sport_id) {
	$.getScript('/get_featured?sport_id=' + sport_id);
	$(".sports_list").hide();
}
		
$(function () {
	$('#sign_up').dialog({
		autoOpen: false,
		closeOnEscape: true,
		height: 550,
		width: 575,
		resizable: false,
		modal: true,
		dialogClass: 'overlay'
	});
	$('#log_in').dialog({
		autoOpen: false,
		closeOnEscape: true,
		height: 230,
		width: 555,
		resizable: false,
		modal: true,
		dialogClass: 'overlay'
	});
	$(".ui-dialog-titlebar").remove();
	
	$(".close_button").click(function (e) {
		$(this).parent().parent().dialog("close");
	})
	
	
});	