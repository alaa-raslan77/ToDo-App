class TaskModel {
  String title;
  String subTitle;
  String id;
  bool isDone;
  int date;

  TaskModel({
    required this.title,
    required this.subTitle,
    this.id = "",
    this.isDone=false,
    required this.date});

  TaskModel.fromJson(Map<String,dynamic> json):this(
      title:json['title'] ,
      subTitle:json['subTitle'] ,
      date:json['date'],
      id: json['id'],
      isDone: json['isDone']
  );


  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subTitle": subTitle,
      "date": date,
      "id": id,
      "isDone": isDone,
    };
  }
}
