<span class="userPost">
 
  <g:if test="${post.lastEditionDate != post.creationDate}">
    <span style="margin-right : 70px;">
      <em>Edited</em>
      <g:if test="${post.editionContributor.id != post.contributor.id}">
      <em>by <g:link controller="Contributor" action="show" id="${post.editionContributor.id}">${post.editionContributor.username}</g:link></em> 
      </g:if>
      &ndash;
      <g:stackDate class="commentDate" date="${post.creationDate}" />
    </span>
  </g:if>

  <span>
    <b><g:message code="post.${post.domainClass.name}.type"/></b> <g:message code="user.post.by"/>
    <g:link controller="Contributor" action="show" id="${post.contributor.id}">${post.contributor.username}</g:link> &ndash;
    <g:stackDate class="commentDate" date="${post.creationDate}" />
  </span>
</span>
