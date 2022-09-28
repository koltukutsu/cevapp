part of "shuffle_cubit.dart";

abstract class ShuffleState extends Equatable {
  const ShuffleState();
  @override
  List<Object> get props => [];
}

class IdleState extends ShuffleState{
  @override
  List<Object> get props => [];
}

class GettingQuestion extends ShuffleState {
  @override
  List<Object> get props => [];
}

class GotQuestion extends ShuffleState {
  const GotQuestion();
  @override
  List<Object> get props => [];
}