$(document).ready(function(){$("#profile_tabs").tabs(),$(".upload_image").click(function(){$(".hidden_upload_field").click()}),$(".hidden_upload_field").change(function(){$(this).closest("form").submit()}),$(document).on("click","#users_table th a, .pagination a",function(){return $.getScript(this.href),!1}),$(document).on("submit","#users_search",function(){return $.get(this.action,$(this).serialize(),null,"script"),!1}),$(".track_record_graph").visualize({type:"line",width:"520px"}),$(".earnings_by_sport_graph").visualize({type:"line",width:"250px"}),$(".make_bet_public").submit(function(t){t.preventDefault(),confirm("Make bet for event "+$(this).attr("data-home-team")+" vs. "+$(this).attr("data-away-team")+" public, for "+$(this).find('input[name="bet[public_price]"]').val()+" ducks?")&&this.submit()})});