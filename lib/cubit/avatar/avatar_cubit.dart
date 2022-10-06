import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part "avatar_state.dart";

class AvatarCubit extends Cubit<AvatarState> {
  AvatarCubit() : super(IdleState());
  var avatarType = "unchosen";
  var avatarName = "";
  var avatarSurname = "";
  var avatarRank = "Novice";
  var avatarMoney = 0;
  var avatarProperties = {};
  List<String> boughtUserAvatars = [];

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
      final String? _avatarRank = prefs.getString("avatarRank");
      final int? _avatarMoney = prefs.getInt("avatarMoney");
      final List<String>? _boughtUserAvatars =
          prefs.getStringList("userAvatarsList");

      avatarType = _avatarType!;
      avatarName = _avatarName!;
      avatarRank = _avatarRank!;
      avatarSurname = _avatarUsername!;
      avatarMoney = _avatarMoney!;
      boughtUserAvatars = _boughtUserAvatars!;

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

    // boughtUserAvatars.add(type);
    // await prefs.setStringList("userAvatarsList", boughtUserAvatars);
  }

  setUserRank({required String currentAvatarRank}) async {
    final prefs = await SharedPreferences.getInstance();
    avatarRank = currentAvatarRank;
    await prefs.setString("avatarType", currentAvatarRank);
  }

  buyUserAvatar({required String type}) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setString("avatarType", type);
    // avatarType = type;
    boughtUserAvatars.add(type);
    await prefs.setStringList("userAvatarsList", boughtUserAvatars);
  }

  setUserAvatar({required String type}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("didUserChoseAnAvatar", true);
    await prefs.setString("avatarType", type);

    await prefs.setString("avatarRank", "Novice");
    avatarType = type;
    boughtUserAvatars.add(type);
    await prefs.setStringList("userAvatarsList", boughtUserAvatars);
    await prefs.setInt("avatarMoney", 0);
    // await prefs.setString("avatarType", "Novice");
    avatarType = type;

    emit(GotAvatars());
  }

  setUserAvatarMarket({required String type}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("didUserChoseAnAvatar", true);
    await prefs.setString("avatarType", type);

    avatarType = type;
    if (!boughtUserAvatars.contains(type)) {
      boughtUserAvatars.add(type);
      await prefs.setStringList("userAvatarsList", boughtUserAvatars);
    }

    if (state is IncreaseMoney) {
      emit(DecreaseMoney());
    } else {
      emit(IncreaseMoney());
    }
  }

  increaseMoney() async {
    const int amount = 10;
    final prefs = await SharedPreferences.getInstance();
    avatarMoney = avatarMoney + amount;
    await prefs.setInt("avatarMoney", avatarMoney);
    // print(avatarMoney);
    emit(IncreaseMoney());
  }

  decreaseMoney({required int amount}) async {
    // const int amount = 5;
    final prefs = await SharedPreferences.getInstance();
    avatarMoney -= amount;
    await prefs.setInt("avatarMoney", avatarMoney);
    emit(DecreaseMoney());
  }

  setToInitialState() {
    emit(NoUserName());
  }
}
