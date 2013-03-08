<%@page import="fr.isima.AwardCategory"%>
<div style="float:left;width:20%; height:30px">		
	<g:if test="${h.award != null && h.award.category == AwardCategory.GOLD }">
		<span class="label label-inverse" style="height:18px;" title="${h?.award?.description }"><g:img dir="images" file="badge_or.png"/> ${h.award?.title} </span>
	</g:if>
	<g:elseif test="${h.award != null && h.award.category == AwardCategory.SILVER }">
		<span class="label label-inverse" style="height:20px;" title="${h?.award?.description }"><g:img dir="images" file="badge_argent.png"/> ${h.award?.title} </span>
	</g:elseif>
	<g:elseif test="${h.award != null && h.award.category == AwardCategory.BRONZE }">
		<span class="label label-inverse"style="height:20px;" title="${h?.award?.description }"><g:img dir="images" file="badge_bronze.png"/> ${h.award?.title} </span>
	</g:elseif>
	<g:elseif test="${h.award != null && h.award.category == AwardCategory.CHOCOLATE }">
		<span class="label label-inverse"style="height:18px;" title="${h?.award?.description }"><g:img dir="images" file="badge_choco.png"/> ${h.award?.title} </span>
	</g:elseif>			
</div>
