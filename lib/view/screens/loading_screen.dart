import 'package:flutter/material.dart';
import 'package:instagram_clone/view/screens/main_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();

  }

  void load()async{
    await Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pushReplacement<void, void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const MainScreen(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Colors.black,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Image.asset(
                "assets/images/insta_pure_logo.png",
                height: 70,
                width: 70,
                fit: BoxFit.contain,

              ),
            ),
          ),
          Positioned(
            bottom: 20,
              child: Image.asset(
            'assets/images/meta_logo.jpg',
            height: 100,
            width: 100,

          ))
        ],
      ),
    );
  }
}
