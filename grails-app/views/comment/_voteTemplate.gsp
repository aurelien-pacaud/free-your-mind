<span>
  <sec:ifLoggedIn>
    <span id="voteUp">
      <g:upVote post="${post}"/>
    </span>
  </sec:ifLoggedIn>

  <span id="markQuestion-${post.id}">
    ${post.mark}
  </span>

  <sec:ifLoggedIn>
    <span id="voteDown">
      <g:downVote post="${post}"/>
    </span>
  </sec:ifLoggedIn>
</span>
