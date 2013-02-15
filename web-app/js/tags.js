jQuery(function($) {

  //first, checks if it isn't implemented yet
  if (!String.prototype.format) {
    String.prototype.format = function() {
      var args = arguments;
      return this.replace(/{(\d+)}/g, function(match, number) { 
        return typeof args[number] != 'undefined'
      ? args[number]
      : match
      ;
    });
  };
}
  addTag = function(params, id, name) {

    $(params.tag.format(name, id)).insertBefore($(params.inputId));
    $(params.inputId).val(''); 

    params.selectedTags.push(id);
  }

  updateTagsId = function(params) {

    $(params.hideId).val('');
    params.selectedTags = [];

    $("#tags > span").each(function(index) {

      var id = $(this).children("input").val();
      params.selectedTags.push(parseInt(id));						
    });

    $(params.hideId).val(params.selectedTags.join(";"));
  }


  $.fn.tagAutocomplete=function(options) {
  
  var defauts = {

    "source"       : null,
    "selectedTags" : null,
    "hideId"       : "#tagsId", 
    "inputId"      : '#tag',
    "tag"          : "<span class='label label-info'>{0} <span class='tagClose' alt='Remove tag'>&times;</span><input type='hidden' value='{1}'/></span>"
  };

  var params = $.extend(defauts, options);

  /* If errors occured during the question validation. */	
  var ids = params.selectedTags.slice(0);

  for(var i = 0; i < ids.length; ++i) {

    for(var j = 0; j < params.source.length; ++j) {

      if (ids[i] == params.source[j].id) {
        addTag(params, params.source[j].id, params.source[j].name);
      }					
    }
  }

  updateTagsId(params);

  $(this).click(function() {
    $(params.inputId).focus();
  });

  $(params.inputId).autocomplete({

    minLength: 0,
    source: function(req, response) {

      var re = $.ui.autocomplete.escapeRegex(req.term);
      var matcher = new RegExp( "^" + re, "i");
      response($.grep(params.source, function(item) { 

        return (matcher.test(item.name) && params.selectedTags.indexOf(item.id) == -1)
      }) 
        );
    },
    focus: function(event, ui) {

      $(params.inputId).val(ui.item.name);
      return false;
    },
    select: function(event, ui) {

      addTag(params, ui.item.id, ui.item.name);		                	
      updateTagsId(params);

      return false;
    }
  }).data('autocomplete')._renderItem = function(ul, item) {

    return $('<li></li>')
      .data('item.autocomplete', item)
      .append("<a>" + item.name + "</a>")
      .appendTo(ul);
  };

  $(params.inputId).keydown(function(e) {

    if (e.keyCode == 8 && $(params.inputId).val().length == 0) {
      $(params.inputId).prev().remove();
      updateTagsId(params);
    }
  });

  $(params.inputId).focusout(function() {

    $(this).val('');
  });

  $(this).on('click', '.tagClose', function() {

    $(this).parent().remove();
    updateTagsId(params);
  });

  
    return this;
  };

});


