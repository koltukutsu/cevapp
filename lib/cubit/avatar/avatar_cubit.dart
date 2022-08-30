import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part "avatar_state.dart";

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit() : super(IdleState());
  var avatarType = "unchosen";
  var avatarName = "";
  var avatarSurname = "";
  var avatarMoney = 0;
  var avatarProperties = {};
  // so there are 4 states, I know i made it a bit complicated
  // 1. noAvatars that triggers the initiation section
  // 2. noName
  // 3. gotName -> which passes to the avatar choosing screen
  // 4. gotAvatars
  getUserCondition() async {
    final prefs = await SharedPreferences.getInstance();
    final didUserChoseAnAvatar = prefs.getBool('didUserChoseAnAvatar');

    if (didUserChoseAnAvatar == null) {
      emit(NoAvatars());

    } else if (didUserChoseAnAvatar == true) {
      final String? _avatarType = prefs.getString("avatarType");
      final int? _avatarMoney = prefs.getInt("avatarMoney");

      avatarType = _avatarType!;
      avatarMoney = _avatarMoney!;



      emit(GotAvatars());
    }
  }

  getUserAvatar({required String type}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("avatarType", type);
    await prefs.setInt("avatarMoney", 0);
    avatarType = type;
    print(avatarType);

    // emit(GotAvatars());
  }

  setUserAvatar() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("didUserChoseAnAvatar", true);
    emit(GotAvatars());
  }

  increaseMoney({required String}) async {}

  decreaseMoney({required String}) async {}

  setUserNames({required String userName, required String userSurname}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userName", userName);
    await prefs.setString("userSurname", userSurname);
  }

}
