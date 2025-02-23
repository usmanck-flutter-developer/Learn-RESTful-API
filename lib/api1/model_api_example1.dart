class PostsModel {
  // Define Variables with Null Safety as Given in JSON (Attributes)
  int? userId;
  int? id;
  String? title;
  String? body;

  //Constructor
  PostsModel({this.userId, this.id, this.title, this.body});

  // What is this and what is this doing?
  // Object
  PostsModel.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
