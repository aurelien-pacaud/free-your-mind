<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Ask Question</title>		
	</head>
	<body>
		<h2>Ask question</h2>
		
		<g:form controller="question" action="add">
			<label for="title">Title</label>
			<div class="${hasErrors(bean:question, field: 'title', 'alert-error')}">
				<g:renderErrors bean="${question}" field="title" />
				<g:textField class="${hasErrors(bean:question, field: 'title', 'error')}" name="title" id="title" value="${question?.title}"/>
			</div>	
			
			<label for="tags">Tags (min 1 - 5 max)</label>
			<div class="${hasErrors(bean:question, field: 'tags', 'alert-error')}">		
				<g:renderErrors bean="${question}" field="tags" />		
				<div id="tags" class="${hasErrors(bean:question, field: 'tags', 'error')}">

	   				<g:textField id="tag" type="text" name="tags"/>
				</div>
			</div>
			
			<g:hiddenField id="tagsId" type="hidden" name="tagsId" value=""/>

			<label for="content">Content</label>
			<div class="${hasErrors(bean:question, field: 'content', 'alert-error')}">
				<g:renderErrors class="alert-error" bean="${question}" field="content" />
				<g:textArea class="${hasErrors(bean:question, field: 'content', 'error')}" name="content" id="questionContent" value="${question?.content}"/>
			</div>
			<br />
			
			<g:submitButton name="sumbit" value="Submit"/>
		</g:form>
		
		<script type="text/javascript">
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
			
			$(document).ready(function() {
				
				var tag = "<span class='label label-info'>{0} <span class='tagClose' alt='Remove tag'>&times;</span><input type='hidden' value='{1}'/></span>";
				var source = ${tags}.tags;
				var selectedTags = [];

				/* If errors occured during the question submition.*/				
				if (${tagIds == null ? false : true}) {
					
					var ids = ${tagIds == null ? [] : tagIds};

					for(var i = 0; i < ids.length; ++i) {
	
						for(var j = 0; j < source.length; ++j) {

							if (ids[i] == source[j].id) {
								addTag(source[j].id, source[j].name);
							}					
						}
					}	
				}	
				
				$("#tags").click(function() {
					$("#tag").focus();
				});
	            
				$("#tag").autocomplete({
					
					minLength: 0,
					source: function(req, response) {

			        	var re = $.ui.autocomplete.escapeRegex(req.term);
			        	var matcher = new RegExp( "^" + re, "i");
			        	response($.grep(source, function(item) { 

				        							return (matcher.test(item.name) && selectedTags.indexOf(item.id) == -1)
				        						}) 
				        		);
			        },
	                focus: function(event, ui) {
		                
	                    $("#tag").val(ui.item.name);
	                    return false;
	                },
	                select: function(event, ui) {

		               addTag(ui.item.id, ui.item.name);		                	                   
	                   return false;
	                }
				}).data('autocomplete')._renderItem = function(ul, item) {
					
			        return $('<li></li>')
		            .data('item.autocomplete', item)
		            .append("<a>" + item.name + "</a>")
		            .appendTo(ul);
		    	};

				$("#tag").keydown(function(e) {
					
	                if (e.keyCode == 8 && $("#tag").val().length == 0) {
	                    $('#tag').prev().remove();
	                    updateTagsId();
	                }
				});
	            
	            $("#tag").focusout(function() {
		            
	                $(this).val('');
				});
	            
	            $("#tags").on('click', '.tagClose', function() {
		            
	                $(this).parent().remove();
	                updateTagsId();
				});

				function addTag(id, name) {
					
					$(tag.format(name, id)).insertBefore($("#tag"));
	                $("#tag").val(''); 

	                selectedTags.push(id);
	                $("#tagsId").val(selectedTags.join(";"));	                
				}
	            
	            function updateTagsId() {

					$("#tagsId").val('');
					selectedTags = [];
					
					$("#tags > span").each(function(index) {
						
						var id = $(this).children("input").val();
						selectedTags.push(parseInt(id));						
					});

					$("#tagsId").val(selectedTags.join(";"))
				}
			});
		</script>
	</body>
</html>
