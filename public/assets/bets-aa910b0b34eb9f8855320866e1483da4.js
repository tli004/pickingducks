var parlay_odds=[2.6,6,10,20,40,75,150,300,700,1100],num_games=0;$(document).ready(function(){$("#bet_tabs").tabs(),$(".number_input").change(function(){num_games>1?$(".winning_payout").text("$"+(parseInt($(this).val())*parlay_odds[num_games-2]).toFixed(2).toString()):$(".winning_payout").text("N/A")})});