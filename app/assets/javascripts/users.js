$(document).ready(function () {
  $("#profile_tabs").tabs();
  
  $(".upload_image").click(function () {
  	$(".hidden_upload_field").click();
  });
  
  $(".hidden_upload_field").change(function () {
  	$(this).closest('form').submit();
  });
  
  $(document).on("click", "#users_table th a, .duck_pagination a", function () {
  	$.getScript(this.href)
  	return false;
  });
  
  $(document).on("submit", "#users_search", function () {
  	$.get(this.action, $(this).serialize(), null, "script");
  	return false;
  });
  
  $(".track_record_graph").visualize({type: 'line', width: '520px'});
  $(".earnings_by_sport_graph").visualize({type: 'line', width: '250px'});  
        
  	$(".make_bet_public").submit(function (e) {
  		e.preventDefault();
	  	$('.confirm_make_public span').text('Make bet for event ' + $(this).attr('data-home-team') + ' vs. ' + $(this).attr('data-away-team') + ' public, for ' + $(this).find('input[name="bet[public_price]"]').val() + ' ducks?');
	  	var this_local = this;
		confirm_popup = $('.confirm_make_public').dialog({
			autoOpen: false,
			closeOnEscape: true,
			height: 200,
			width: 400,
			resizable: false,
			modal: true,
			dialogClass: 'overlay',
			buttons: {
				"Confirm" : function () { this_local.submit(); },
				"Cancel" : function () { $(this).dialog("close"); }
			}
		});
		$(".ui-dialog-titlebar").remove();
		confirm_popup.dialog("open");
	});
	
	$(".purchase_bet_info").click(function (e) {
  		e.preventDefault();
	  	$('.confirm_purchase_bet_info span').text('Purchase ' + $(this).attr('data-username') + "'s bet information for event " + $(this).attr('data-home-team') + ' vs. ' + $(this).attr('data-away-team') + ', for ' + $(this).attr('data-price') + ' ducks?');
	  	var this_local = this;
		confirm_popup = $('.confirm_purchase_bet_info').dialog({
			autoOpen: false,
			closeOnEscape: true,
			height: 225,
			width: 450,
			resizable: false,
			modal: true,
			dialogClass: 'overlay',
			buttons: {
				"Confirm" : function () { window.location = this_local.href },
				"Cancel" : function () { $(this).dialog("close"); }
			}
		});
		$(".ui-dialog-titlebar").remove();
		confirm_popup.dialog("open");
	});
  
})

