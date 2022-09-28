import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

part "record_state.dart";

class RecordsCubit extends Cubit<RecordsState> {
  RecordsCubit() : super(InitialState());
  int currentLengthOfRecords = 0;
  int currentRecordingTime = 0;
  int playingIndex = -1;
  bool allowToAction = true;

  Future<void> GetCurrentRecords() async {
    // const String path = '/data/user/0/com.example.cevapp/app_flutter';
    final Directory path = await getApplicationDocumentsDirectory();
    final String dirToList = "${path.path}/audio_files/";
    // print("are they equal: ${path2.path == path}");
    // print("path2: ${path2.path}");
    // print("path: $path");
    List recordPathsAsFileList;
    try {
      recordPathsAsFileList = await Directory(dirToList).list().toList();
    } on FileSystemException {
      debugPrint("$dirToList dir is not created yet");
      recordPathsAsFileList = [];
    }
    print(recordPathsAsFileList);
    currentLengthOfRecords = recordPathsAsFileList.length;
    print("general control: ${await Directory(path.path).list().toList()}");
    // print(recordPathsAsFileList);
    emit(GetRecords(recordPathsAsFileList: recordPathsAsFileList));
  }

  setCurrentRecordingTime({required int time}) {
    currentRecordingTime = time;
  }

  int get getCurrentRecordingTime => currentRecordingTime;

  setCurrentPlayingIndex({required int index}) {
    playingIndex = index;
  }

  int get getCurrentPlayingIndex => playingIndex;

  Future<bool> getWhetherTheQuestionIsRecorded({required String id}) async {
    final Directory path = await getApplicationDocumentsDirectory();
    final List recordPathsAsFileList =
        await Directory("${path!.path}/audio_files/").list().toList();
    print("recorded path file: $recordPathsAsFileList");
    for (File filePath in recordPathsAsFileList) {
      print(filePath.runtimeType);
      final String comparisonFilePath = filePath.path.split("/").last;
      debugPrint("comparison File Path: $comparisonFilePath\nid File: $id.aac");
      if (comparisonFilePath == "$id.aac") {
        return true;
      }
    }
    return false;
  }

  Future<void> getList() async {
    final Directory path = await getApplicationDocumentsDirectory();
    List recordPathsAsFileList;
    try {
      recordPathsAsFileList =
          await Directory("${path!.path}/audio_files/").list().toList();
    } on FileSystemException {
      recordPathsAsFileList = [];
    }
    debugPrint(
        "recorded questions length:${recordPathsAsFileList.length} \nrecorded questions from the dir: ${recordPathsAsFileList.toString()}");
  }

  changeActionAllowance() {
    allowToAction = !allowToAction;

    print("allow to action : $allowToAction");
    if (allowToAction == false) {
      emit(RecordingNow());
    }
  }
}
