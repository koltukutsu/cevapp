import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "record_state.dart";

class RecordsCubit extends Cubit<RecordsState> {
  RecordsCubit() : super(InitialState());

  Future<void> GetCurrentRecords() async {
    const String path = '/data/user/0/com.example.cevapp/cache';
    final List recordPathsAsFileList =
        await Directory(path).list().toList();
    emit(GetRecords(recordPathsAsFileList: recordPathsAsFileList));
  }
}
