import 'package:cevapp/ui/constants/borders.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 1250);

  Future<String?> _authUser(LoginData data, BuildContext context) async {
    return Future.delayed(loginTime).then((_) {
      return "Kullanıcı Bulunamadı";
    });
  }

  Future<String?> _signupUser(var data) {
    debugPrint('Kullanıcı Adı: ${data.name!}, Şifri: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Ad: $name');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: "cevapp",
      // logo: AssetImage('assets/images/ecorp-lightblue.png'),
      logo: null,
      userType: LoginUserType.name,
      userValidator: (value) {
        return null; // no need to set rules, the username will be provided
      },
      passwordValidator: (value) {
        return null; // no need to set rules, the passwords will be provided
      },

      onLogin: (data) {
        return null;
      },
      onSignup: _signupUser,
      onRecoverPassword: _recoverPassword,

      messages: LoginMessages(
          userHint: "Kullanıcı Adı",
          passwordHint: "Şifre",
          loginButton: "Giriş Yap",
          forgotPasswordButton: 'Şifreni mi unuttun? Bizimle iletişime geç',
          recoverPasswordDescription:
              "Kullanıcı adını yazarsan, sana bir email yollayacağız",
          recoverPasswordButton: "Kurtar",
          recoverPasswordIntro: "Şifreni tazele",
          flushbarTitleError: "Hata",
          flushbarTitleSuccess: "Tamamdır",
          goBackButton: "Geri",
          recoverPasswordSuccess:
              "Bildirimin tarafımıza ulaştı. En kısa sürede seninle iletişime geçeceğiz"),
      hideForgotPasswordButton: false,
      // hideSignUpButton: true, chaned it in the source code
      theme: LoginTheme(
        primaryColor: Colors.teal,
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: const TextStyle(
          color: Colors.greenAccent,
          fontFamily: 'Quicksand',
          letterSpacing: 4,
        ),
        bodyStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
        ),
        textFieldStyle: const TextStyle(
          fontFamily: "Bright",
          color: Colors.orange,
          shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.yellow,
        ),
        cardTheme: CardTheme(
          color: Colors.yellow.shade100,
          elevation: 5,
          margin: const EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(
            backgroundColor: Colors.orange,
            color: Colors.white,
          ),
          labelStyle: const TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade700, width: 4),
            borderRadius: inputBorder,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade400, width: 5),
            borderRadius: inputBorder,
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade700, width: 7),
            borderRadius: inputBorder,
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400, width: 8),
            borderRadius: inputBorder,
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 5),
            borderRadius: inputBorder,
          ),
        ),
        buttonTheme: LoginButtonTheme(
          splashColor: Colors.purple,
          backgroundColor: Colors.pinkAccent,
          highlightColor: Colors.lightGreen,
          elevation: 9.0,
          highlightElevation: 6.0,
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // shape: CircleBorder(side: BorderSide(color: Colors.green)),
          // shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(55.0)),
        ),
      ),

      onSubmitAnimationCompleted: () {
        Navigator.of(context).popAndPushNamed(ROUTE_MAIN);
      },
    );
  }
}
