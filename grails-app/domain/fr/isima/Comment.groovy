package fr.isima

class Comment extends Post {

  static belongsTo = [post: Post]
}
