class TodoDM {
  static String collecteionName = "todos";
  static String titleKey = "title";
  String id;
  String title;
  DateTime time;
  String description;
  bool isDone;

  TodoDM({required this.id, required this.title, required this.time, required this.description,required  this.isDone});
}