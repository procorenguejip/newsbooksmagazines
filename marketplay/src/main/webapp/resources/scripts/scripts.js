
jQuery(document).ready(function() {
	
	/*
	Modals
	 */
	$('.launch-modal').on('click', function(e){
		e.preventDefault();
		$( '#' + $(this).data('modal-id') ).modal();
	});
	
	/*
        Fullscreen background
    
    $.backstretch("resources/img/backgrounds/blue-bg.jpg");
    */
    $('#changePassword').click(function() {
		$('#username').val('');
		$('#getPassword').modal({
				backdrop: true
			})
	})
	

	var username = $.cookie('usernamecookie');
	if (username != null && username != '') {
		$('#j_username').val(username);
		$('#remember').attr('checked', true);
	}
    
   
    
    $("#formSubmitButton")
	.click(
			function() {
				
				

				var hasError = false;
				$('#j_username_help').html("");
				$('#j_password_help').html("");
				
				
				if ($('#remember').attr('checked')) {
					$.cookie('usernamecookie', $(
							'#j_username').val(), {
						expires : 1024,
						path : '/'
					});
				} else {
					$.cookie('usernamecookie',
							null, {
								expires : 1024,
								path : '/'
							});
				}
				if ($.trim($('#j_username').val()) == '') {
					hasError = true;
					$('#j_username_help')
							.html(
									"<font color='red' size='4'><strong>*</strong></font>");
				}

				if ($.trim($('#j_password').val()) == '') {
					hasError = true;
					$('#j_password_help')
							.html(
									"<font color='red' size='4'><strong>*</strong></font>");
				}

				if (!hasError) {
					$("#logonForm").submit();
				}

			});
    
});
