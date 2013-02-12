
/**
 * Hide or show the div which id is id
 */
function hideOrShow(id) {
	// if the div is visible we hide it
	if($(id).is(':visible')) {
		$(id).hide();
	} else {
		// otherwise we show it
		$(id).show();
	}
}