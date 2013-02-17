<span class="userPost">
  <g:typePost post="${post}" /> by
  <g:link controller="Contributor" action="show" id="${post.contributor.id}">${post.contributor.username}</g:link> &ndash;
  <g:stackDate class="commentDate" date="${post.creationDate}" />
</span>
