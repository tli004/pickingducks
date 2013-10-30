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
 $(".reset_bankroll a").on("click", function (e) {
 		e.preventDefault();
		var confirm_popup = $('.confirm_reset_bankroll').dialog({
			autoOpen: false,
			closeOnEscape: true,
			height: 200,
			width: 400,
			resizable: false,
			modal: true,
			dialogClass: 'overlay',
			buttons: {
				"Confirm" : function () { window.location = "/reset_ducks"; },
				"Cancel" : function () { $(this).dialog("close"); }
			}
		});
		$(".ui-dialog-titlebar").remove();
		confirm_popup.dialog("open");
 }); 
        
  $(".make_bet_private").submit(function (e) {
  		e.preventDefault();
  		
  		$('.confirm_make_public span').text('Make bet for event ' + $(this).attr('data-home-team') + ' vs. ' + $(this).attr('data-away-team') + ' private, for ' + $(this).find('input[name="bet[money_price]"]').val() + ' dollars?');
	  		
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
			height: 80,
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
  
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
  payment.setupForm();
  
  $(".cashout_btn").click(function () {
  		
		window.location = "/request_cashout";
  });
})

var payment = {
	"setupForm" : function () {
		$("#buy_ducks_form").submit(function (e) {
			e.preventDefault();
			$('input[type=submit]').attr('disabled', true);
			$('.confirm_buy_ducks span').text('Purchase ' + $("#num_ducks_to_purchase").val() + ' ducks? Your credit card will be charged for $' + parseInt($("#num_ducks_to_purchase").val())*.05 );
		  	var this_local = this;
			confirm_popup = $('.confirm_buy_ducks').dialog({
				autoOpen: false,
				closeOnEscape: true,
				height: 250,
				width: 400,
				resizable: false,
				modal: true,
				dialogClass: 'overlay',
				buttons: {
					"Confirm" : function () { 
						$(this).dialog("close");
						payment.buyDucks();
					},
					"Cancel" : function () { $(this).dialog("close"); }
				}
			});
			$(".ui-dialog-titlebar").remove();
			confirm_popup.dialog("open");			
		});
		$("#buy_bet_info_form").submit(function (e) {
			e.preventDefault();
			$('input[type=submit]').attr('disabled', true);
			$('.confirm_buy_bet_info span').text('Purchase this bet information? Your credit card will be charged for $' + parseInt($("#bet_money_price").val()) / 100 );
		  	var this_local = this;
			confirm_popup = $('.confirm_buy_bet_info').dialog({
				autoOpen: false,
				closeOnEscape: true,
				height: 185,
				width: 400,
				resizable: false,
				modal: true,
				dialogClass: 'overlay',
				buttons: {
					"Confirm" : function () { 
						$(this).dialog("close");
						payment.buyBetInfo();
					},
					"Cancel" : function () { $(this).dialog("close"); }
				}
			});
			$(".ui-dialog-titlebar").remove();
			confirm_popup.dialog("open");			
		});
	},
	"buyDucks" : function () {
		var card = {
			'number' : $("#card_number").val(), 
			'cvc' : $("#card_code").val(),
			'expMonth' : $("#card_month").val(),
			'expYear' : $("#card_year").val()
		}
		Stripe.createToken(card, payment.handleBuyDucksResponse);
	},
	"buyBetInfo" : function () {
		var card = {
			'number' : $("#card_number").val(), 
			'cvc' : $("#card_code").val(),
			'expMonth' : $("#card_month").val(),
			'expYear' : $("#card_year").val()
		}
		Stripe.createToken(card, payment.handleBuyBetInfoResponse);
	},
	"handleBuyDucksResponse" : function (status, response) {
		if (status == 200) {
			$('#stripe_card_token').val(response.id);
			$('#buy_ducks_form')[0].submit();
		} else {
			$("#stripe_error").text(response.error.message);
			$('input[type=submit]').attr('disabled', false);
		}		
	},
	"handleBuyBetInfoResponse" : function (status, response) {
		if (status == 200) {
			$('#stripe_card_token').val(response.id);
			$('#buy_bet_info_form')[0].submit();
		} else {
			$("#stripe_error").text(response.error.message);
			$('input[type=submit]').attr('disabled', false);
		}		
	}	
	
}

