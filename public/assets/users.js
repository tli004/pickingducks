$(document).ready(function(){$("#profile_tabs").tabs(),$(".upload_image").click(function(){$(".hidden_upload_field").click()}),$(".hidden_upload_field").change(function(){$(this).closest("form").submit()}),$(document).on("click","#users_table th a, .duck_pagination a",function(){return $.getScript(this.href),!1}),$(document).on("submit","#users_search",function(){return $.get(this.action,$(this).serialize(),null,"script"),!1}),$(".make_bet_private").submit(function(t){t.preventDefault(),$(".confirm_make_public span").text("Make bet for event "+$(this).attr("data-home-team")+" vs. "+$(this).attr("data-away-team")+" private, for "+$(this).find('input[name="bet[money_price]"]').val()+" dollars?");var e=this;confirm_popup=$(".confirm_make_public").dialog({autoOpen:!1,closeOnEscape:!0,height:200,width:400,resizable:!1,modal:!0,dialogClass:"overlay",buttons:{Confirm:function(){e.submit()},Cancel:function(){$(this).dialog("close")}}}),$(".ui-dialog-titlebar").remove(),confirm_popup.dialog("open")}),$(".purchase_bet_info").click(function(t){t.preventDefault(),$(".confirm_purchase_bet_info span").text("Purchase "+$(this).attr("data-username")+"'s bet information for event "+$(this).attr("data-home-team")+" vs. "+$(this).attr("data-away-team")+", for "+$(this).attr("data-price")+" ducks?");var e=this;confirm_popup=$(".confirm_purchase_bet_info").dialog({autoOpen:!1,closeOnEscape:!0,height:80,width:450,resizable:!1,modal:!0,dialogClass:"overlay",buttons:{Confirm:function(){window.location=e.href},Cancel:function(){$(this).dialog("close")}}}),$(".ui-dialog-titlebar").remove(),confirm_popup.dialog("open")}),Stripe.setPublishableKey($('meta[name="stripe-key"]').attr("content")),payment.setupForm(),$(".cashout_btn").click(function(){window.location="/request_cashout"})});var payment={setupForm:function(){$("#buy_ducks_form").submit(function(t){t.preventDefault(),$("input[type=submit]").attr("disabled",!0),$(".confirm_buy_ducks span").text("Purchase "+$("#num_ducks_to_purchase").val()+" ducks? Your credit card will be charged for $"+.05*parseInt($("#num_ducks_to_purchase").val())),confirm_popup=$(".confirm_buy_ducks").dialog({autoOpen:!1,closeOnEscape:!0,height:250,width:400,resizable:!1,modal:!0,dialogClass:"overlay",buttons:{Confirm:function(){$(this).dialog("close"),payment.buyDucks()},Cancel:function(){$(this).dialog("close")}}}),$(".ui-dialog-titlebar").remove(),confirm_popup.dialog("open")}),$("#buy_bet_info_form").submit(function(t){t.preventDefault(),$("input[type=submit]").attr("disabled",!0),$(".confirm_buy_bet_info span").text("Purchase this bet information? Your credit card will be charged for $"+parseInt($("#bet_money_price").val())/100),confirm_popup=$(".confirm_buy_bet_info").dialog({autoOpen:!1,closeOnEscape:!0,height:185,width:400,resizable:!1,modal:!0,dialogClass:"overlay",buttons:{Confirm:function(){$(this).dialog("close"),payment.buyBetInfo()},Cancel:function(){$(this).dialog("close")}}}),$(".ui-dialog-titlebar").remove(),confirm_popup.dialog("open")})},buyDucks:function(){var t={number:$("#card_number").val(),cvc:$("#card_code").val(),expMonth:$("#card_month").val(),expYear:$("#card_year").val()};Stripe.createToken(t,payment.handleBuyDucksResponse)},buyBetInfo:function(){var t={number:$("#card_number").val(),cvc:$("#card_code").val(),expMonth:$("#card_month").val(),expYear:$("#card_year").val()};Stripe.createToken(t,payment.handleBuyBetInfoResponse)},handleBuyDucksResponse:function(t,e){200==t?($("#stripe_card_token").val(e.id),$("#buy_ducks_form")[0].submit()):($("#stripe_error").text(e.error.message),$("input[type=submit]").attr("disabled",!1))},handleBuyBetInfoResponse:function(t,e){200==t?($("#stripe_card_token").val(e.id),$("#buy_bet_info_form")[0].submit()):($("#stripe_error").text(e.error.message),$("input[type=submit]").attr("disabled",!1))}};