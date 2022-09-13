import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

part "record_state.dart";

class RecordsCubit extends Cubit<RecordsState> {
  RecordsCubit() : super(InitialState());
  int currentLengthOfRecords = 0;
  int currentRecordingTime = 0;
  int playingIndex = -1;

  Future<void> GetCurrentRecords() async {
    // const String path = '/data/user/0/com.example.cevapp/cache';
    final Directory? path = await getExternalStorageDirectory();
    final List recordPathsAsFileList = await Directory("${path!.path}/recordedAudios/").list().toList();
    currentLengthOfRecords = recordPathsAsFileList.length;

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
    final Directory? path = await getExternalStorageDirectory();
    final List recordPathsAsFileList = await Directory("${path!.path}/recordedAuidios/").list().toList();

    for (var filePath in recordPathsAsFileList){
      if (filePath == id){
        return true;
      }
    }
    return false;
  }
}
