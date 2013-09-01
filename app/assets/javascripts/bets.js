var parlay_odds = [2.6, 6, 10, 20, 40, 75, 150, 300, 700, 1100];
var num_games = 0;

$(document).ready(function () {
    
  $(".number_input").change(function (e) {
  	if (num_games > 1)	
		$(".winning_payout").text("$" + (parseInt($(this).val()) * parlay_odds[num_games-2]).toFixed(2).toString());
	else
		$(".winning_payout").text("N/A");	
  });
  
  $(document).on("click", ".wager_link_home", function () {
	  	$.getScript(this.href)
	  	return false;
  	}); 
  
});
