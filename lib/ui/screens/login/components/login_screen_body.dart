import 'package:cevapp/ui/constants/borders.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 1250);

  Future<String?> _authUser(LoginData data, BuildContext context) async {
    return Future.delayed(loginTime).then((_) {
      return "User is not found";
    });
  }

  Future<String?> _signupUser(var data) {
    debugPrint('Username: ${data.name!}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    debugPrint('Username: $name');
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
          userHint: "E-mail",
          passwordHint: "Password",
          loginButton: "Sign In",
          forgotPasswordButton: 'Did you forgot your password? Reach to us!',
          recoverPasswordDescription:
              "We will send you an e-mail if you enter your Username",
          recoverPasswordButton: "Save Account",
          recoverPasswordIntro: "Refresh Your Password",
          flushbarTitleError: "Error",
          flushbarTitleSuccess: "Success",
          goBackButton: "Back",
          recoverPasswordSuccess:
              "Your problem has reached to us. As fast as possible we are going to give you a response e-mail"),
      hideForgotPasswordButton: false,
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          // label: 'Google',
          callback: () async {
            debugPrint('start google sign in');
            await Future.delayed(loginTime);
            debugPrint('stop google sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          // label: 'Facebook',
          callback: () async {
            debugPrint('start facebook sign in');
            await Future.delayed(loginTime);
            debugPrint('stop facebook sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          // label: "LinkedIn",
          callback: () async {
            debugPrint('start linkdin sign in');
            await Future.delayed(loginTime);
            debugPrint('stop linkdin sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          // label: "Github",
          callback: () async {
            debugPrint('start github sign in');
            await Future.delayed(loginTime);
            debugPrint('stop github sign in');
            return null;
          },
        ),
      ],

      // hideSignUpButton: true, chaned it in the source code
      theme: LoginTheme(
        primaryColor: Colors.teal,
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: const TextStyle(
          color: Colors.greenAccent,
          fontFamily: 'Bright',
          letterSpacing: 4,
        ),
        bodyStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          // fontSize: 18,
        ),
        textFieldStyle: const TextStyle(
          fontFamily: "Bright",
          color: Colors.orange,
          fontSize: 18,
          shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
        ),
        buttonStyle: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.yellow,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: const EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          ) 
          // shape: ContinuousRectangleBorder(
          //     borderRadius: BorderRadius.circular(100.0)),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.purple.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: const TextStyle(
            backgroundColor: Colors.orange,
            color: Colors.white,
          ),
          // hintStyle: const TextStyle(),

          labelStyle: const TextStyle(fontSize: 18, fontFamily: "Bright"),
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
