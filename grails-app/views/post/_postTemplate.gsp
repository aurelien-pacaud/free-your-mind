<div id="post-${post.id}" class="post">
  <div class="post ${!post.isAccepted ? '' : 'postAccepted'}">
    <div class="postMark">
      <!-- Buttons to up or down vote -->
      <div>
        <g:remoteLink controller="post" action="incMark" id="${post.id}" update="markQuestion-${post.id}">
          &#9650;
        </g:remoteLink>
          <div id="markQuestion-${post.id}">
            ${post.mark}
          </div> 
        <g:remoteLink controller="post" action="downMark" id="${post.id}" update="markQuestion-${post.id}">
          &#9660;
        </g:remoteLink>
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
  <div id="comments-${post.id}">
    <g:if test="${!post.comments?.isEmpty()}">
      <g:render template="/comment/commentTemplate" var="comment" collection="${post.comments}" />
    </g:if>
  </div>

  <div id="comment-${post.id}" class="commentTextArea">
    <g:formRemote name="commentForm" update="comments-${post.id}" url="[controller: 'comment', action: 'add', params: [idPost: post.id]]"
                  onSuccess="\$('#comment-${post.id}').hide();">
      <g:textArea name="commentContent" id="commentContent" class="commentContent"></g:textArea>
      <g:submitButton name="addComment" value="Add comment" style="float : right;"/>
    </g:formRemote>
  </div>
</div>
<div><br /><br /><br /></div>

<jq:jquery>

  var postId = '#post-' + ${post.id};

  $(postId + ' .postToolbar').hide();
      
  $(postId).mouseover(function() {
    $(postId + ' .postToolbar').show();
  }).mouseout(function() {
    $(postId + ' .postToolbar').hide();
  });
</jq:jquery>
