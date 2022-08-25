import 'package:cevapp/data/models/questionObject.dart';

class AllQuestionsRelatedObject {
  final List<QuestionObject> untouched, recorded, deleted;

  const AllQuestionsRelatedObject(
      {required this.untouched, required this.recorded, required this.deleted});
}
