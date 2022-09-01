import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:equatable/equatable.dart";
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
part "shuffle_state.dart";

class ShuffleCubit extends Cubit<ShuffleState> {
  ShuffleCubit() : super(IdleState());
  late var shuffledQuestion;
  var recordedQuestions = []; //<dates to questions>
  var deletedQuestions = [];
  var unTouchedQuestions = [];
  var shuffledQuestions = [];

  final String QUESTIONS_JSON_FILE_NAME = "questions";

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> _localFile({required String fileName}) async {
    final path = await _localPath;
    return File('$path/$fileName.json');
  }

  Future<File> writeJson(
      {required String jsonName, required String toBeWritten}) async {
    final file = await _localFile(fileName: jsonName);

    // Write the file
    return file.writeAsString(toBeWritten);
  }
  printQuestion() async{
    // print("question: ${shuffledQuestion["question"]}\nid:${shuffledQuestion["id"]}");
  }
  setQuestionObjectsState() async {
    final prefs = await SharedPreferences.getInstance();
    final isUserLoggedInBefore = prefs.getBool('isUserLoggedInBefore');

    if (isUserLoggedInBefore == null) {
      // 1. load from the asset json
      // 2. use the loaded to initiate the question objects
      // 3. change your isUserLoggedInBefore as true so that never come back here again
      // 4. finally, initiate questions.json in temp dir and save the taken json from the assets

      // debugPrint("FIRST LOGIN");

      // 1.
      const String JSON_ASSETS_PATH = "assets/data/questions.json";
      final String questionsPath =
          await rootBundle.loadString(JSON_ASSETS_PATH);
      var allQuestionsRelatedObject = await json.decode(questionsPath);

      // 2.
      unTouchedQuestions = allQuestionsRelatedObject["untouched"];
      recordedQuestions = allQuestionsRelatedObject["recorded"];
      deletedQuestions = allQuestionsRelatedObject["deleted"];
      shuffledQuestions = allQuestionsRelatedObject["shuffled"];

      // 3.
      await prefs.setBool("isUserLoggedInBefore", true);

      // 4.
      final allQuestionsRelatedObjectsInOneObject = {
        "untouched": unTouchedQuestions,
        "recorded": recordedQuestions,
        "deleted": deletedQuestions,
        "shuffled": shuffledQuestions
      };
      final String allAsJsonString =
          json.encode(allQuestionsRelatedObjectsInOneObject);
      // final File writtenFileJsonAll =
      await writeJson(
          jsonName: QUESTIONS_JSON_FILE_NAME, toBeWritten: allAsJsonString);
    } else if (isUserLoggedInBefore == true) {
      // 1. read json from local temp path
      // 2. assign the json as map to a variable
      // 3. use the variable to update the objects

      // debugPrint("not FIRST LOGIN");

      // 1.
      final File takenQuestionsFileJsonFromTempPath =
          await _localFile(fileName: "questions");
      // 2.
      var allQuestionRelatedObjectsTakenAsMap = await json
          .decode(takenQuestionsFileJsonFromTempPath.readAsStringSync());
      // debugPrint(allQuestionRelatedObjectsTakenAsMap.toString());

      // 3.
      unTouchedQuestions = allQuestionRelatedObjectsTakenAsMap["untouched"];
      recordedQuestions = allQuestionRelatedObjectsTakenAsMap["recorded"];
      shuffledQuestions = allQuestionRelatedObjectsTakenAsMap["shuffled"];
      deletedQuestions = allQuestionRelatedObjectsTakenAsMap["deleted"];
    }
  }

  getQuestion() async {
    // picks a random index from the untouched questions list and updates shuffledQuestion variable
    // and emits the state as GotQuestion

    emit(GettingQuestion());
    final randomSeed = Random();
    final int randomValueFromTheLength =
        randomSeed.nextInt(unTouchedQuestions.length);

    shuffledQuestion = {
        "id": unTouchedQuestions.elementAt(randomValueFromTheLength)["id"],
        "question":
            unTouchedQuestions.elementAt(randomValueFromTheLength)["question"]};

    updateShuffledQuestionsObject();
    emit(const GotQuestion());
  }

  updateUntouchedQuestionsObject({required String id}) async {
    // updates the untouchedQuestions list and saves all the objects to local json
    unTouchedQuestions.removeWhere((element) => element["id"] == id);
    if (unTouchedQuestions.isEmpty) {
      unTouchedQuestions.add({
        "id": DateTime.now().toString(),
        "question": "We ran out of questions :DD"
      });
    }

    updateAllQuestionsRelatedObjectsWithJson();
  }

  updateShuffledQuestionsObject() async {
    // updates the shuffledQuestion list and saves all the objects to local json
    updateUntouchedQuestionsObject(id: shuffledQuestion["id"]);
    shuffledQuestion["timeStamp"] = DateTime.now().toString();
    shuffledQuestions.add(shuffledQuestion);

    updateAllQuestionsRelatedObjectsWithJson();
  }

  updateRecordedQuestionsObject() async {
    final String timeStamp = DateTime.now().toString();
    // updates the recordedQuestion list and saves all the objects to local json
    shuffledQuestion["timeStamp"] = timeStamp;
    recordedQuestions.add(shuffledQuestion);

    updateAllQuestionsRelatedObjectsWithJson();
  }

  updateDeletedQuestionsObject() async {
    var timeStamp = DateTime.now();
    // updates the deletedQuestions list and saves all the objects to local json
    shuffledQuestion["timeStamp"] = timeStamp.toString();
    deletedQuestions.add(shuffledQuestion);

    updateAllQuestionsRelatedObjectsWithJson();
  }

  updateAllQuestionsRelatedObjectsWithJson() async {
    final allQuestionsRelatedObjectsInOneObjectForUpdate = {
      "untouched": unTouchedQuestions,
      "recorded": recordedQuestions,
      "deleted": deletedQuestions,
      "shuffled": shuffledQuestions
    };
    // print("\nUNTOUCHED");
    // print(allQuestionsRelatedObjectsInOneObjectForUpdate["untouched"]);
    // print("\nRECORDED");
    // print(allQuestionsRelatedObjectsInOneObjectForUpdate["recorded"]);
    // print("\nDELETED");
    // print(allQuestionsRelatedObjectsInOneObjectForUpdate["deleted"]);
    // print("\nSHUFFLED");
    // print(allQuestionsRelatedObjectsInOneObjectForUpdate["shuffled"]);
    // print("\nALL");
    // print(allQuestionsRelatedObjectsInOneObjectForUpdate);
    final String allJsonString =
        json.encode(allQuestionsRelatedObjectsInOneObjectForUpdate);

    await writeJson(
        jsonName: QUESTIONS_JSON_FILE_NAME, toBeWritten: allJsonString);
  }

  getRecordText() async {}
}
