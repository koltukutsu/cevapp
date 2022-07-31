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

class GettingText extends ShuffleState {
  @override
  List<Object> get props => [];
}

class GotText extends ShuffleState {
  const GotText();
  @override
  List<Object> get props => [];
}