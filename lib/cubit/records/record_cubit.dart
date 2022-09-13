import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "record_state.dart";

class RecordsCubit extends Cubit<RecordsState> {
  RecordsCubit() : super(InitialState());
  int currentLengthOfRecords = 0;
  int currentRecordingTime = 0;

  Future<void> GetCurrentRecords() async {
    const String path = '/data/user/0/com.example.cevapp/cache';
    final List recordPathsAsFileList = await Directory(path).list().toList();
    currentLengthOfRecords = recordPathsAsFileList.length;

    // print(recordPathsAsFileList);
    emit(GetRecords(recordPathsAsFileList: recordPathsAsFileList));
  }

  setCurrentRecordingTime({required int time}) {
    currentRecordingTime = time;
  }

  int get getCurrentRecordingTime => currentRecordingTime;
}
