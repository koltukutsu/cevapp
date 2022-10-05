class QuestionObject {
  final String id;
  final String question;
  final String? category;
  final String? level;

  String? timeStamp;

  QuestionObject(
      {required this.id,
      required this.question,
      this.timeStamp,
      this.category,
      this.level});

  Map<String, dynamic> toMap() {
    return {'id': id, 'question': question, 'timeStamp': timeStamp.toString()};
  }
}
