import 'package:flutter/material.dart';
import 'package:instagram_clone/view/screens/loading_screen.dart';
// import 'package:instagram_clone/view/screens/home_screen/home_screen.dart';
import 'package:instagram_clone/view/screens/main_screen.dart';
import 'package:instagram_clone/view_model/home_screen/likeDigit_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/home_profile_scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/like_profile_scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/reel_profile_scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/tab_index.dart';
import 'package:instagram_clone/view_model/reel_screen_index_counts.dart';
import 'package:instagram_clone/view_model/screen_index_counts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LikeDigitProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScrollProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TabIndex(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScreenIndexCountsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProfileScrollProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReelProfileScrollProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LikeProfileScrollProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReelScreenIndexCountProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Instagram Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
        ),
        home: const LoadingScreen()
      ),
    );
  }
}


