class TaskModel {
  String title;
  String subTitle;
  String id;
  bool isDone;
  int date;
  String userId;

  TaskModel({
    required this.title,
    required this.subTitle,
    this.id = "",
    this.isDone=false,
    required this.date,
  required this.userId});

  TaskModel.fromJson(Map<String,dynamic> json):this(
      title:json['title'] ,
      subTitle:json['subTitle'] ,
      date:json['date'],
      id: json['id'],
      isDone: json['isDone'],
    userId: json['id']
  );


  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subTitle": subTitle,
      "date": date,
      "id": id,
      "isDone": isDone,
      "userId":userId
    };
  }
}
