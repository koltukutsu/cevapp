import 'package:audioplayers/audioplayers.dart';
import 'package:cevapp/cubit/audio_player/audio_player_cubit.dart';
import 'package:cevapp/cubit/avatar/avatar_cubit.dart';
import 'package:cevapp/cubit/shuffle/shuffle_cubit.dart';
import 'package:cevapp/ui/navigation/navigation_names.dart';
import 'package:cevapp/ui/snimated_splash_screen/cevapp_animted_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/records/record_cubit.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ShuffleCubit()),
        BlocProvider(create: (context) => RecordsCubit()),
        BlocProvider(create: (context) => AvatarCubit()),
        BlocProvider(
            create: (context) => AudioPlayerCubit(audioPlayer: AudioPlayer())),
      ],
      child: MaterialApp(
        // theme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: ROUTE_ANIMATED_SPLASH_SCREEN,

        routes: {
          // ROUTE_LOGIN: (context) => const LoginScreen(),
          // ROUTE_MARKET: (context) => const MarketScreen(),
          // ROUTE_MAIN: (context) => const MainScreen(),
          // ROUTE_PROFILE_SCREEN: (context) => const ProfileScreen(),
          ROUTE_ANIMATED_SPLASH_SCREEN: (context) =>
              const CevappAnimatedSplashScreen(),
          // ROUTE_MAIN: (context) => const SecondScreen(),
        },
      ),
    );
  }
}
