class QuestionObject {
  final String id;
  final String question;
  DateTime? timeStamp;

  QuestionObject({required this.id, required this.question, this.timeStamp});

  Map<String, dynamic> toMap() {
    return {'id': id, 'question': question, 'timeStamp': timeStamp.toString()};
  }
}
