$("#profile_tabs").tabs(),$(".upload_image").click(function(){$(".hidden_upload_field").click()}),$(".hidden_upload_field").change(function(){$(this).closest("form").submit()});