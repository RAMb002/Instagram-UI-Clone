import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:instagram_clone/view/screens/home_screen/chat_screen.dart';
import 'package:instagram_clone/view/screens/home_screen/home_screen.dart';
import 'package:instagram_clone/view/screens/like_screen.dart';
import 'package:instagram_clone/view/screens/profile_screen.dart';
import 'package:instagram_clone/view/screens/reel_screen.dart';
import 'package:instagram_clone/view/screens/search_screen/search_screen.dart';
// import 'package:instagram_clone/view/screens/widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  List<Widget> bodies = [
    HomeScreen(),
    const SearchScreen(),
    const ReelScreen(),
    const LikeScreen(),
    const ProfileScreen()
  ];

  final PageController _pageController = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // print('home');
    return PageView(
      controller: _pageController,
      children: [
        Container(),
        Scaffold(
          backgroundColor: Colors.white,
          appBar: _currentIndex ==0 ? AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Container(
              height: 30,
              width: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Instagram_logo.png",
                      ),
                      fit: BoxFit.cover)),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("assets/images/more.png"), fit: BoxFit.contain),
                    )),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      _pageController.animateToPage(2, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Container(
                          height: 20,
                          width: 20,
                          decoration: const BoxDecoration(
                            // color: Colors.redAccent,
                            image: DecorationImage(
                                image: AssetImage("assets/images/images.png"), fit: BoxFit.contain),
                          )),
                    ),
                  ),
                  Positioned(
                    top: 13,
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.redAccent),
                      padding: const EdgeInsets.only(left: 1, top: 1.5),
                      child: const Center(
                        child: Text(
                          "9",
                          style: TextStyle(fontSize: 9),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ) : null,
          bottomNavigationBar: Stack(
            children: [
              SizedBox(
                height: 50,
                // color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        if (_currentIndex != 0) {
                          setState(() {
                            _currentIndex = 0;
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        color: Colors.transparent,
                        child: Icon(
                          _currentIndex == 0 ? Icons.home : Icons.home_outlined,
                          size: 28,
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        if (_currentIndex != 1) {
                          setState(() {
                            _currentIndex = 1;
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        color: Colors.transparent,
                        child: const Icon(
                          Icons.search,
                          size: 28,
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        if (_currentIndex != 2) {
                          setState(() {
                            _currentIndex = 2;
                          });
                        }
                      },
                      child: Image.asset("assets/images/reel2.png",height: 23,width: 23,color:_currentIndex==2 ? Colors.black :  Colors.grey.shade700,)
                      // SizedBox(
                      //     height: 50,
                      //     child: Center(
                      //       child: Container(
                      //         // height: 10,
                      //         // width: 10,
                      //         decoration: BoxDecoration(
                      //           color: Colors.transparent,
                      //           borderRadius: const BorderRadius.all(Radius.circular(10)),
                      //           border: Border.all(color: Colors.black, width: 1.5),
                      //         ),
                      //         child: const Icon(
                      //           Icons.play_arrow,
                      //           size: 19,
                      //         ),
                      //       ),
                      //     )),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        if (_currentIndex != 3) {
                          setState(() {
                            _currentIndex = 3;
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        color: Colors.transparent,
                        child: Icon(
                          _currentIndex != 3 ? Icons.favorite_border : Icons.favorite,
                          size: 28,
                        ),
                      ),
                    )),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        if (_currentIndex != 4) {
                          setState(() {
                            _currentIndex = 4;
                          });
                        }
                      },
                      child: SizedBox(
                        height: 50,
                        child: Center(
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage("assets/images/myProfile.jpg"), fit: BoxFit.cover)),
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Positioned(
                  top: 0,
                  child: Container(
                    height: 0.5,
                    width: screenWidth,
                    color: Colors.black,
                  ))
            ],
          ),
          body: bodies[_currentIndex],
          // BottomNavigationBar(
          //   unselectedItemColor: Colors.black,
          //   selectedItemColor: Colors.black ,
          //   currentIndex:_currentIndex ,
          //     showSelectedLabels: false,
          //     showUnselectedLabels: false,
          //   backgroundColor: Colors.redAccent,
          //     onTap: (index){
          //     setState(() {
          //       _currentIndex = index;
          //     });
          //     },
          //     items: [
          //   BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          //   BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
          //   BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          //   BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          //   BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          //
          //
          // ]),
        ),
         ChatScreen(pageController: _pageController,)
      ],
    );
  }
}
