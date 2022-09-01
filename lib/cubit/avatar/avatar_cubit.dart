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
  // 1. noName that triggers the initiation section
  // 2. GOtName -> which passes to the avatar choosing screen
  // 3. noAvatars
  // 4. gotAvatars

  getUserCondition() async {
    final prefs = await SharedPreferences.getInstance();
    final didUserChoseAnAvatar = prefs.getBool('didUserChoseAnAvatar');

    if (didUserChoseAnAvatar == null) {
      emit(NoUserName());
    } else if (didUserChoseAnAvatar == true) {
      final String? _avatarType = prefs.getString("avatarType");
      final String? _avatarName = prefs.getString("userName");
      final String? _avatarUsername = prefs.getString("userSurname");
      final int? _avatarMoney = prefs.getInt("avatarMoney");

      avatarType = _avatarType!;
      avatarName = _avatarName!;
      avatarSurname = _avatarUsername!;
      avatarMoney = _avatarMoney!;

      emit(GotAvatars());
    }
  }

  setUserNames({required String userName, required String userSurname}) async {
    // print("set the USER NAMES");
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("userName", userName);
    await prefs.setString("userSurname", userSurname);

    avatarName = userName;
    avatarSurname = userSurname;

    emit(NoAvatars());
  }

  // I am using this for the avatar button in avatar screen
  getUserAvatar({required String type}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("avatarType", type);
    // print("this is inside of the getUserAvatar: $type");
    avatarType = type;
    // print(avatarType);

    // emit(GotAvatars());
  }

  setUserAvatar({required String type}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("didUserChoseAnAvatar", true);
    // final prefs = await SharedPreferences.getInstance();
    await prefs.setString("avatarType", type);

    // print("user's Avatar in Cubit: $avatarType");
    // print("got: $type");

    avatarType = type;
    await prefs.setInt("avatarMoney", 0);
    // print("user's Avatar in Cubit: $avatarType");

    emit(GotAvatars());
  }

  increaseMoney() async {
    const int amount = 5;
    final prefs = await SharedPreferences.getInstance();
    avatarMoney = avatarMoney + amount;
    await prefs.setInt("avatarMoney", avatarMoney);
    // print(avatarMoney);
  }

  decreaseMoney() async {
    const int amount = 5;
    final prefs = await SharedPreferences.getInstance();
    avatarMoney -= amount;
    await prefs.setInt("avatarMoney", avatarMoney);
  }
}
