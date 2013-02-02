<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Free your mind -- Ask Question</title>		
	</head>
	<body>
		<h2>Ask question</h2>
		
		<g:hasErrors bean="${question}">
			<ul>
				<g:renderErrors bean="${question}" as="list" />
			</ul>
		</g:hasErrors>
		
		<g:form controller="question" action="add">
			<label for="title">Title</label><g:textField name="title" id="title"/>			
			<label for="tags">Tags</label>
			<div id="tags">
    			<g:textField id="tag" type="text" name="tags"/>
			</div>
			<g:hiddenField id="tagsId" type="hidden" name="tagsId"/>

			<label for="content">Content</label>
			<g:textArea name="content" id="content"/><br />
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
				
				var tag = "<span class='label label-info'>{0} <span class='tagClose' alt='Remove tag'>&#215;</span><input type='hidden' value='{1}'/></span>";
				var source = ${tags}.tags;
				var selectedTags = [];

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
		                		                
	                   $(tag.format(ui.item.name, ui.item.id)).insertBefore($("#tag"));
	                   $("#tag").val(''); 
	                   $("#tagsId").val($("#tagsId").val() + ui.item.id + ";")
	                   
	                   selectedTags.push(ui.item.id);
	                   
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

	            function updateTagsId() {

					$("#tagsId").val('');
					selectedTags = [];
					
					$("#tags > span").each(function(index) {
						var id = $(this).children("input").val();
						
						$("#tagsId").val($("#tagsId").val() + id + ";")
						selectedTags.push(parseInt(id));
					});
				}
			});
		</script>
	</body>
</html>