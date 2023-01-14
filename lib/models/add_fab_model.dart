class FabNewsModelClass {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  String userCreationTime;
  FabNewsModelClass(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
        required this.userCreationTime,
      });Map<String, dynamic> toMap() {
    return <String, dynamic>{
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content':content,
      "userCreationTime": userCreationTime
    };
  }
  factory FabNewsModelClass.fromMap(Map<String, dynamic> map) =>FabNewsModelClass(
      author: map['author'],
      title: map['title'] ,
      description: map['description'],
      url: map['url'],
      urlToImage: map['urlToImage'],
      publishedAt: map['publishedAt'],
      content: map['content'],
      userCreationTime: map['userCreationTime'],

  ) ;
}
