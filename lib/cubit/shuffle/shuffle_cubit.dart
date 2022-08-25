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

  // Future<bool> getUserLoginData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final bool? userLoggedIn = prefs.getBool("userLoggedIn");
  //
  //   if (userLoggedIn != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  //

  // setFirstQuestions() async {
  //   final bool isUserLoggedInBefore = await getUserLoginData();
  //   if (isUserLoggedInBefore) {
  //     // I should not set the first conditions
  //
  //   } else {
  //     // I should set the first conditions, need to initiate the starting states
  //     final prefs = await SharedPreferences.getInstance();
  //     prefs.setBool("userLoggedIn", true);
  //     final String questionsPath =
  //         await rootBundle.loadString("assets/data/questions.json");
  //     final AllQuestionsRelatedObject allQuestionsRelatedObject =
  //         await json.decode(questionsPath);
  //
  //     unTouchedQuestions = allQuestionsRelatedObject.untouched;
  //     recordedQuestions = allQuestionsRelatedObject.recorded;
  //     deletedQuestions = allQuestionsRelatedObject.deleted;
  //
  //     // for (var question in questionsList) {
  //     //   final uuid = const Uuid().v1();
  //     //   final QuestionObject questionObject =
  //     //       QuestionObject(id: uuid, question: question);
  //     //   unTouchedQuestions.add(questionObject);
  //     // }
  //
  //   }
  // }

  setQuestionObjectsState() async {
    final String questionsPath =
        await rootBundle.loadString("assets/data/questions.json");
    var allQuestionsRelatedObject = await json.decode(questionsPath);

    unTouchedQuestions = allQuestionsRelatedObject["untouched"];
    recordedQuestions = allQuestionsRelatedObject["recorded"];
    deletedQuestions = allQuestionsRelatedObject["deleted"];
  }

  getQuestion() async {
    emit(GettingText());
    final randomSeed = Random();
    final int randomValueFromTheLength =
        randomSeed.nextInt(unTouchedQuestions.length);
    // final QuestionObject shuffled = unTouchedQuestions[0];
    print(unTouchedQuestions.length);

    shuffledQuestion = QuestionObject(
        id: unTouchedQuestions.elementAt(randomValueFromTheLength)["id"],
        question:
            unTouchedQuestions.elementAt(randomValueFromTheLength)["question"]);
    emit(const GotText());
    // print(state.number);
  }

  updateUntouchedQuestionsObject({required String id}) async {
    unTouchedQuestions.removeWhere((element) => element.id == id);
  }

  updateRecordedQuestionsObject({required DateTime timeStamp}) {
    shuffledQuestion.timeStamp = timeStamp;
    updateUntouchedQuestionsObject(id: shuffledQuestion.id);
    recordedQuestions.add(shuffledQuestion);
  }

  updateDeletedQuestionsObject({required DateTime timeStamp}) async {
    shuffledQuestion.timeStamp = timeStamp;
    updateUntouchedQuestionsObject(id: shuffledQuestion.id);
    deletedQuestions.add(shuffledQuestion);
  }

  updateAllQuestionsRelatedObjectsWithJson() async {}

  getRecordText() async {}
}
