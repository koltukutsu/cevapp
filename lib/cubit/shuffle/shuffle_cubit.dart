import 'dart:convert';
import 'dart:math';

import 'package:cevapp/cubit/shuffle/shuffle_questions.dart';
import 'package:cevapp/data/models/all_questions_related_objects.dart';
import 'package:cevapp/data/models/questionObject.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:equatable/equatable.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part "shuffle_state.dart";

class ShuffleCubit extends Cubit<ShuffleState> {
  ShuffleCubit() : super(IdleState());
  late QuestionObject shuffledQuestion;
  var recordedQuestions = []; //<dates to questions>
  var deletedQuestions = [];
  var unTouchedQuestions = [];
  var shuffledQuestions = [];

  setQuestionObjectsState() async {
    final String questionsPath =
        await rootBundle.loadString("assets/data/questions.json");
    var allQuestionsRelatedObject = await json.decode(questionsPath);

    unTouchedQuestions = allQuestionsRelatedObject["untouched"];
    recordedQuestions = allQuestionsRelatedObject["recorded"];
    deletedQuestions = allQuestionsRelatedObject["deleted"];
  }

  getQuestion() async {
    // print(unTouchedQuestions);

    emit(GettingText());
    final randomSeed = Random();
    final int randomValueFromTheLength =
        randomSeed.nextInt(unTouchedQuestions.length);

    shuffledQuestion = QuestionObject(
        id: unTouchedQuestions.elementAt(randomValueFromTheLength)["id"],
        question:
            unTouchedQuestions.elementAt(randomValueFromTheLength)["question"]);

    updateShuffledQuestionsObject();
    print(unTouchedQuestions.length);
    emit(const GotText());
  }

  updateUntouchedQuestionsObject({required String id}) async {

    unTouchedQuestions.removeWhere((element) => element["id"] == id);
    if (unTouchedQuestions.isEmpty){
      unTouchedQuestions.add({"id": DateTime.now().toString(), "question": "We ran out of questions :DD"});
    }
  }
  updateShuffledQuestionsObject() async {
    updateUntouchedQuestionsObject(id: shuffledQuestion.id);
    shuffledQuestion.timeStamp = DateTime.now();
    shuffledQuestions.add(shuffledQuestion);

  }
  updateRecordedQuestionsObject({required DateTime timeStamp}) async {
    shuffledQuestion.timeStamp = timeStamp;
    // updateUntouchedQuestionsObject(id: shuffledQuestion.id);
    recordedQuestions.add(shuffledQuestion);
    print(unTouchedQuestions.length);
    print(recordedQuestions.length);
  }

  updateDeletedQuestionsObject({required DateTime timeStamp}) async {
    shuffledQuestion.timeStamp = timeStamp;
    // updateUntouchedQuestionsObject(id: shuffledQuestion.id);
    deletedQuestions.add(shuffledQuestion);
    print(unTouchedQuestions.length);
    print(deletedQuestions.length);
  }

  updateAllQuestionsRelatedObjectsWithJson() async {}

  getRecordText() async {}
}
