package fr.isima

class Comment extends Post {

  int reputation = 2

  static belongsTo = [post: Post]
}
