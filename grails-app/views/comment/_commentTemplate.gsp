<div class="commentPost">
  
  <div class="pull-left commentMark" id="postMark-${comment.id}">
    <g:render template="/comment/voteTemplate" bean="${comment}" var="post" />
  </div>
  
  <p class="commentContent" id="post-${comment.id}">
    ${comment.content} &ndash;
    <g:link action="show" controller="contributor" id="${comment.id}">${comment.contributor.username}</g:link>
    <g:stackDate class="commentDate" date="${comment.creationDate}" />

    <span class="commentToolbar">
      <g:toolbar post="${comment}" />  
    </span>
  </p>
</div>
<jq:jquery>
  $('.commentToolbar').hide();

  $('.commentPost').mouseover(function() {
    $(this).children('.commentContent').children('.commentToolbar').show();
  }).mouseout(function() {
    $(this).children('.commentContent').children('.commentToolbar').hide();
  });
</jq:jquery>
