<div>
  <div style="float:left;width:15%; height:30px">
    <g:render template="/award/awardTemplate" bean="${award}" var="award" />
  </div>
  <div style="float:left;width: 85%; height:30px">
    ${award.description}
    <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
	    <g:link action="edit" controller="award" id="${award.id}" title="Edit the Award" class="pull-right">
	      <img src="${fam.icon(name: 'pencil')}" alt="Edit the tag"/>
	    </g:link>
	</sec:ifAnyGranted>
  </div>
  <div class="clear"></div>
</div>
