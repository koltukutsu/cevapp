import 'dart:math';

import 'package:cevapp/cubit/shuffle/shuffle_questions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:equatable/equatable.dart";

part "shuffle_state.dart";

class ShuffleCubit extends Cubit<ShuffleState> {
  ShuffleCubit() : super(IdleState());
  var shuffledQuestion = "";

  getText() async {
    emit(GettingText());
    final randomSeed = Random();
    shuffledQuestion = questionsList[randomSeed.nextInt(questionsList.length)];
    // print(shuffledQuestion);
    emit(const GotText());
    // print(state.number);
  }
}
