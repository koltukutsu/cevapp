class QuestionObject {
  final String id;
  final String question;
  DateTime? timeStamp;

  QuestionObject({
    required this.id,
    required this.question,
    this.timeStamp
  });
}
