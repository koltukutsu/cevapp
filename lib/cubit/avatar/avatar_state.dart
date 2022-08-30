part of "avatar_cubit.dart";


abstract class AvatarState extends Equatable {
  const AvatarState();
  @override
  List<Object> get props => [];
}

class IdleState extends AvatarState{
  @override
  List<Object> get props => [];
}

class NoAvatars extends AvatarState {
  @override
  List<Object> get props => [];
}

class GotAvatars extends AvatarState {
  @override
  List<Object> get props => [];
}

class NoUserName extends AvatarState {
  @override
  List<Object> get props => [];
}
//
// class GotUserName extends AvatarState {
//   @override
//   List<Object> get props => [];
// }