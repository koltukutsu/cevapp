import 'package:cevapp/data/user_ranks.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part "avatar_state.dart";

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit() : super(IdleState());
  var avatarType = "unchosen";

  getUserCondition() async {
    final prefs = await SharedPreferences.getInstance();
    final didUserChoseAnAvatar = prefs.getBool('didUserChoseAnAvatar');
    print("did chose an avatar: ${didUserChoseAnAvatar}");
    print('inside');
    if (didUserChoseAnAvatar == null) {
      print('inside1');
      emit(NoAvatars());
    } else if (didUserChoseAnAvatar == true) {
      print('inside2');
      final String? _avatarType = prefs.getString("avatarType");
      avatarType = _avatarType!;
      emit(GotAvatars());
    }
  }

  getUserAvatar({required String type}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("avatarType", type);
    avatarType = type;
    print(avatarType);
    // emit(GotAvatars());
  }

  setUserAvatar()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("didUserChoseAnAvatar", true);
    emit(GotAvatars());
  }
}
