<div id="post-${post.id}" class="post">
  
  <div class="${!post.isAccepted ? '' : 'postAccepted'}">
    <div class="postMark" id="postMark-${post.id}">
      <!-- Buttons to up or down vote -->
      <g:render template="/post/voteTemplate" bean="post" />
    </div>
    
    <div class="postContent">
      <markdown:renderHtml>${post.content}</markdown:renderHtml>
    </div>
  </div>
  
  <!-- Toolbar bottom post -->
  <div class="postBottomBar">
    <span class="postToolbar">
      <g:toolbar post="${post}" /> 
    </span>
    <g:render template="/contributor/contributorPostTemplate" bean="post" />
  </div>

  <hr />
  <div id="comments-${post.id}">
    <g:if test="${!post.comments?.isEmpty()}">
      <g:render template="/comment/commentTemplate" var="comment" collection="${post.comments}" />
    </g:if>
  </div>

  <div id="comment-${post.id}" class="commentTextArea">
    <g:formRemote name="commentForm" update="comments-${post.id}" url="[controller: 'comment', action: 'add', params: [idPost: post.id]]"
                  onSuccess="\$('#comment-${post.id}').hide();" on404="console.log('Error')">
      <g:textArea name="commentContent" id="commentContent" class="commentContent"></g:textArea>
      <g:submitButton name="addComment" value="Add comment" class="btn btn-primary pull-right"/>
    </g:formRemote>
  </div>
  <div class="postBlankSpace"></div>
</div>

<jq:jquery>
  $('.postToolbar').hide();

  $('.postBottomBar').mouseover(function() {
    $(this).children('.postToolbar').show();
  }).mouseout(function() {
    $(this).children('.postToolbar').hide();
  });
</jq:jquery>
