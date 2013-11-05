//= require jquery
//= require jquery_ujs
//= require jquery.ui.core
//= require jquery.ui.widget
//= require jquery.ui.mouse
//= require jquery.ui.position
//= require jquery.ui.dialog
//= require jquery.ui.tabs
//= require home
//= require bets
//= require users

$(document).ready(function () {		
	$(".close_button").click(function (e) {
		try {
			$(this).parent().parent().dialog("close");		
		} catch (e) {
			$(this).parent().dialog("close");
		}
	})		
	
	$("#sign_up_form").submit(function (e) {
		e.preventDefault();
		var pattern = new RegExp(/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
		if ($(this).find("input[name='user[first_name]']").val() == "")
			$("#sign_up_error").text("First name can't be blank");
		else if ($(this).find("input[name='user[last_name]']").val() == "")
			$("#sign_up_error").text("Last name can't be blank");
		else if (!pattern.test($(this).find("input[name='user[email]']").val()))
			$("#sign_up_error").text("Please enter a valid email address");
		else if ($(this).find("input[name='user[username]']").val() == "")
			$("#sign_up_error").text("Username can't be blank");
		else if ($(this).find("input[name='user[password]']").val() == "")
			$("#sign_up_error").text("Password can't be blank");
		else if ($(this).find("input[name='user[password]']").val() != $(this).find("input[name='user[password_confirmation]']").val())
			$("#sign_up_error").text("Password does not match the confirmation");
		else if ($(this).find("input[name='user[accept_terms]']:checked").length == 0)
			$("#sign_up_error").text("You must accept the terms of service");
		else
			this.submit();
	});
});	

function show_sign_up() {
	sign_up = $('#sign_up').dialog({
		autoOpen: false,
		closeOnEscape: true,
		height: 550,
		width: 575,
		resizable: false,
		modal: true,
		dialogClass: 'overlay'
	});
	
	$(".ui-dialog-titlebar").remove();
	sign_up.dialog("open");
}
function show_log_in() {
	login = $('#log_in').dialog({
		autoOpen: false,
		closeOnEscape: true,
		height: 230,
		width: 500,
		resizable: false,
		modal: true,
		dialogClass: 'overlay'
	});
	
	$(".ui-dialog-titlebar").remove();
	login.dialog("open");
}

function logout() {
	window.location = "/log_out";
}

function get_featured(sport_id) {
	$.getScript('/get_featured?sport_id=' + sport_id);
	$(".sports_list").hide();
}

function get_bets_for_date(date) {
	$.getScript('/get_bets_for_date?date=' + date);
}

function get_bets_for_date_public(date, user) {
	$.getScript('/get_bets_for_date?date=' + date + '&user=' + user);
}

function getURLParameter(name) {
    return decodeURI(
        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
    );
}