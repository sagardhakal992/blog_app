

class Post{
  String? title;
  String? description;
  String? uid;
  String? image;

  Post({this.title,this.description,this.uid,this.image});
  factory Post.toJson(Map<String,dynamic>post){
    return Post(title:post['title'],description: post['description'],uid: post['uid'],image: post['image'] );
  }
}