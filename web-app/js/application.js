if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}

function displayFormError(idForm) {

  $(idForm).addClass('alert-error'); 
  $(idForm + ' span').html('Content cant be empty!')
  $(idForm).siblings('#submit').addClass('btn-danger');
}

function removeFormError(idForm) {

  $(idForm).removeClass('alert-error'); 
  $(idForm + ' span').html('')
  $(idForm).siblings('#submit').removeClass('btn-danger');
}
