<div id="post-${post.id}" class="post">
  <div class="post ${!post.isAccepted ? '' : 'postAccepted'}">
    <div class="postMark">
      <!-- Buttons to up or down vote -->
      <div>
          <span id="voteUp">
            <g:upVote post="${post}"/>
          </span>
          <div id="markQuestion-${post.id}">
            ${post.mark}
          </div> 
          <span id="voteDown">
            <g:downVote post="${post}"/>
          </span>
      </div>
    </div>
    <div class="postContent">
      <markdown:renderHtml>${post.content}</markdown:renderHtml>
    </div>
  </div>

  <!-- Toolbar -->
  <div class="postToolbar">
    <g:toolbar post="${post}" /> 
  </div>

  <g:render template="/contributor/contributorPostTemplate" bean="post" />

  <div class="clear" ></div>
  <hr />
</div>
<div id="comments-${post.id}">
  <g:if test="${!post.comments?.isEmpty()}">
    <g:render template="/comment/commentTemplate" var="comment" collection="${post.comments}" />
  </g:if>
</div>

<div id="comment-${post.id}" class="commentTextArea">
  <g:formRemote name="commentForm" update="comments-${post.id}" url="[controller: 'comment', action: 'add', params: [idPost: post.id]]"
                onSuccess="\$('#comment-${post.id}').hide();" on404="console.log('Error')">
    <g:textArea name="commentContent" id="commentContent" class="commentContent"></g:textArea>
    <g:submitButton name="addComment" value="Add comment" style="float : right;"/>
  </g:formRemote>
</div>

<div><br /><br /><br /></div>

<jq:jquery>
  $('.postToolbar').hide();

  $('.post').mouseover(function() {
    $(this).children('.postToolbar').show();
  }).mouseout(function() {
    $(this).children('.postToolbar').hide();
  });
  
  $("body").on('click', '#voteUp', function() {
    $(this).html('<span class="postVote">&#9650;</span>');
    $(this).siblings('#voteDown').html('<span class="postVoteDisable">&#9660;</span>');
  });

  $("body").on('click', '#voteDown', function() {
    $(this).html('<span class="postVote">&#9660;</span>');
    $(this).siblings('#voteUp').html('<span class="postVoteDisable">&#9650;</span>');
  });
</jq:jquery>
