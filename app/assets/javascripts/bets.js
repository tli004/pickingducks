var parlay_odds = [2.6, 6, 10, 20, 40, 75, 150, 300, 700, 1100];
var num_games = 0;

$(document).ready(function () {
  $("#bet_tabs").tabs();  
  $(".number_input").change(function (e) {
  	if (num_games > 1)	
		$(".winning_payout").text("$" + (parseInt($(this).val()) * parlay_odds[num_games-2]).toFixed(2).toString());
	else
		$(".winning_payout").text("N/A");	
  });
  
  $("#handicap_bet_form").submit(function (e) {
  	e.preventDefault();
  	if ($(this).children('input[name="bet[bet_type]"]:checked').length > 0 && $(this).children('input[type="number"]').val() > 0)
  		this.submit();
  	else
  		alert("You must select a team to beat the spread, and your wager must be greater than zero.");
  });
  
  $("#over_under_bet_form").submit(function (e) {
  	e.preventDefault();
  	if ($(this).children('input[name="bet[bet_type]"]:checked').length > 0 && $(this).children('input[type="number"]').val() > 0)
  		this.submit();
  	else
  		alert("You must predict whether the actual total points will be over/under the predicted total, and your wager must be greater than zero.");
  });
  
  
});
