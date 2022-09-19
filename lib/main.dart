import 'package:flutter/material.dart';
import 'package:instagram_clone/view/screens/loading_screen.dart';
// import 'package:instagram_clone/view/screens/home_screen/home_screen.dart';
import 'package:instagram_clone/view/screens/main_screen.dart';
import 'package:instagram_clone/view_model/home_screen/likeDigit_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/tab_index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        title: 'Instagram Clone',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const LoadingScreen()
      ),
    );
  }
}


