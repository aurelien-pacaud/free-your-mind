<%@page import="fr.isima.AwardCategory"%>
<div>
	<div style="float:left;width:15%; height:30px">
		
			<g:if test="${award.category == AwardCategory.GOLD }">
				<span class="label label-inverse" style="height:18px;""><g:img dir="images" file="badge_or.png"/> ${award.title} </span>
			</g:if>
			<g:elseif test="${award.category == AwardCategory.SILVER }">
				<span class="label label-inverse" style="height:20px;""><g:img dir="images" file="badge_argent.png"/> ${award.title} </span>
			</g:elseif>
			<g:elseif test="${award.category == AwardCategory.BRONZE }">
				<span class="label label-inverse"style="height:20px;""><g:img dir="images" file="badge_bronze.png"/> ${award.title} </span>
			</g:elseif>
			<g:elseif test="${award.category == AwardCategory.CHOCOLATE }">
				<span class="label label-inverse"style="height:18px;""><g:img dir="images" file="badge_choco.png"/> ${award.title} </span>
			</g:elseif>			
	</div>
	<div style="float:left;width:80%; height:30px">
		${award.description}
	</div>
	<div style="float:left;width:5%; height:30px">
        <g:link action="edit" controller="award" id="${award.id}" title="Edit the Award">
          <img src="${fam.icon(name: 'pencil')}" alt="Edit the tag"/>
        </g:link>
	</div>
	<div class="clear"/>
</div>