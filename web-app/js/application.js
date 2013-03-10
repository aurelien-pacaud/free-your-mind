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
  $(idForm + ' span').show()
  $(idForm).siblings('#submit').addClass('btn-danger');
}

function removeFormError(idForm) {

  $(idForm).removeClass('alert-error'); 
  $(idForm + ' span').hide()
  $(idForm).siblings('#submit').removeClass('btn-danger');
}
