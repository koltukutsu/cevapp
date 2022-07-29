import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:cevapp/ui/screens/login/login_screen.dart';
import 'package:cevapp/ui/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: const [ // remove const, fill purposes
    //     // BlocProvider(
    //     //     create: (context) =>
    //     //         Cubit(Repository())),
    //   ],
    //   child:
    //   // BlocBuilder
    //   // <ThemeCubit, ThemeData>(
    //   //   builder: (context, theme) => MaterialApp(
    //   //     theme: darkTheme,
    //   //     themeMode: ThemeMode.system,
    //   //     debugShowCheckedModeBanner: false,
    //   //     initialRoute: ROUTE_LOGIN,
    //   //     routes: {
    //   //       ROUTE_FIRST: (context) => const FirstScreen(),
    //   //       ROUTE_SECOND: (context) => const SecondScreen(),
    //   //     },
    //   //   ),
    //   // ),
    //   MaterialApp(
    //     // theme: darkTheme,
    //     themeMode: ThemeMode.system,
    //     debugShowCheckedModeBanner: false,
    //     initialRoute: ROUTE_LOGIN,
    //     routes: {
    //       ROUTE_LOGIN: (context) => const LoginScreen(),
    //       // ROUTE_MAIN: (context) => const SecondScreen(),
    //     },
    //   )
    // );
    return MaterialApp(
      // theme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: ROUTE_LOGIN,

      routes: {
        ROUTE_LOGIN: (context) => const LoginScreen(),
        ROUTE_MAIN: (context) => const MainScreen()
        // ROUTE_MAIN: (context) => const SecondScreen(),
      },
    );
  }
}
