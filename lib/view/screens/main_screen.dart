import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/home_screen/chat_screen.dart';
import 'package:instagram_clone/view/screens/home_screen/home_screen.dart';
import 'package:instagram_clone/view/screens/like_screen.dart';
import 'package:instagram_clone/view/screens/profile_screen/profile_screen.dart';
import 'package:instagram_clone/view/screens/reel_screen/reel_screen.dart';
import 'package:instagram_clone/view/screens/search_screen/search_screen.dart';
import 'package:instagram_clone/view_model/profile_screen/scroll_provider.dart';
import 'package:instagram_clone/view_model/reel_screen_index_counts.dart';
import 'package:instagram_clone/view_model/screen_index_counts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
// import 'package:instagram_clone/view/screens/widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController reelScreenPageController = PageController();
  int _currentIndex = 0;

  late List<Widget> bodies;
  late PersistentTabController _controller;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

    bodies = [
      HomeScreen(
        pageController: _pageController,
      ),
      const SearchScreen(),
      ReelScreen(
        pageController: reelScreenPageController,
      ),
      const LikeScreen(),
      ProfileScreen(
        data: Data.myProfile[0],
        isLikeScreen: false,
        isHomeScreen: false,
        isReelScreen: false,
        isMyProfile: true,
      )
    ];
  }

  List<int> navIndexList = [];
  bool reelScreen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final pScreenIndexCount = Provider.of<ScreenIndexCountsProvider>(context,listen: false);
    final pReelScreenIndexCount = Provider.of<ReelScreenIndexCountProvider>(context,listen: false);

    return WillPopScope(
      onWillPop: () async {

        if(_currentIndex==3 && pScreenIndexCount.likeScreenCount!=0){
          pScreenIndexCount.incrementOrDecrementLikeScreenCount(increment: false);
          return true;
        }
        else if(_currentIndex==2 && pReelScreenIndexCount.reelScreenCount!=0){
          pReelScreenIndexCount.incrementOrDecrementReelScreenCount(increment: false);
          return true;
        }
        else if(_currentIndex==0 && pScreenIndexCount.homeScreenCount!=0){
          pScreenIndexCount.incrementOrDecrementHomeScreenCount(increment: false);
          return true;
        }
       else if (_pageController.page != 0) {
          _pageController.animateToPage(0,
              duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
          return false;
        } else if (navIndexList.isNotEmpty) {
          if (navIndexList.last == _currentIndex) {
            navIndexList.removeLast();
          }
          if (navIndexList.isEmpty) {
            if (_currentIndex != 0) {
              setState(() {
                _controller.index = 0;
                _currentIndex = 0;
              });
            }
          }
          setState(() {
            _currentIndex = navIndexList.last;
            _controller.index = navIndexList.last;

            navIndexList.removeLast();
          });
          if (_currentIndex == 4) {
            final pScrollProvider = Provider.of<ScrollProvider>(context, listen: false);
            pScrollProvider.changeOffSetValue(0);
            pScrollProvider.changeExpandStatus(true);
          }
          return false;
        } else if (navIndexList.isEmpty) {
          if (_currentIndex != 0) {
            setState(() {
              _controller.index = 0;
              _currentIndex = 0;
            });
            return false;
          } else {
            return true;
          }
        } else {
          return true;
        }
      },
      child: PageView(
        physics: _currentIndex == 0 ? null : const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Consumer<ReelScreenIndexCountProvider>(
            builder: (context,data,child){
              bool reelScreenBottomNavColor = data.reelScreenCount!=0 && _currentIndex==2;
              return PersistentTabView(
                context,
                controller: _controller,
                onItemSelected: (index) {
                  if(index==0 && pScreenIndexCount.homeScreenCount!=0){
                    pScreenIndexCount.incrementOrDecrementHomeScreenCount(increment: false);
                  }
                   else if(_currentIndex==2 && index==2 && pReelScreenIndexCount.reelScreenCount!=0){
                    pReelScreenIndexCount.incrementOrDecrementReelScreenCount(increment: false);
                  }
                   else if(index==3 && pScreenIndexCount.likeScreenCount!=0){
                    pScreenIndexCount.incrementOrDecrementLikeScreenCount(increment: false);

                  }
                   if(_currentIndex!=index) {
                     setState(() {
                       navIndexList.add(index);
                       _currentIndex = index;
                     });
                   }
                },
                padding: const NavBarPadding.all(0),
                screens: bodies,
                items: [
                  PersistentBottomNavBarItem(
                    icon: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: Icon(
                        _currentIndex == 0 ? Icons.home : Icons.home_outlined,
                        size: 28,
                        color: _currentIndex == 2 && !reelScreenBottomNavColor ? Colors.white : Colors.black,
                      ),
                    ),
                    // title: ("Home"),
                    activeColorPrimary: CupertinoColors.activeBlue,
                    inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: Icon(
                        Icons.search,
                        size: 28,
                        color: _currentIndex == 2 && !reelScreenBottomNavColor ? Colors.white : Colors.black,
                      ),
                    ),
                    // title: ("Settings"),
                    // activeColorPrimary: CupertinoColors.activeBlue,
                    // inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: Image.asset(
                      "assets/images/reel2.png",
                      height: 23,
                      width: 23,
                      color: _currentIndex == 2 && !reelScreenBottomNavColor ? Colors.white : Colors.grey.shade700,
                    ),
                    // title: ("Settings"),
                    // activeColorPrimary: CupertinoColors.activeBlue,
                    // inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: Icon(
                        _currentIndex != 3 ? Icons.favorite_border : Icons.favorite,
                        size: 28,
                        color: _currentIndex == 2  && !reelScreenBottomNavColor? Colors.white : Colors.black,
                      ),
                    ),
                    // title: (""),
                    // activeColorPrimary: CupertinoColors.activeBlue,
                    // inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                  PersistentBottomNavBarItem(
                    icon: Container(
                      color: Colors.transparent,
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
                    // title: ("Settings"),
                    // activeColorPrimary: CupertinoColors.activeBlue,
                    // inactiveColorPrimary: CupertinoColors.systemGrey,
                  ),
                ],

                confineInSafeArea: true,
                backgroundColor:data.reelScreenCount==0 && _currentIndex==2 ? Colors.black : Colors.white, // Default is Colors.white.
                handleAndroidBackButtonPress: true, // Default is true.
                resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true, // Default is true.
                hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                // decoration: NavBarDecoration(
                //   borderRadius: BorderRadius.circular(10.0),
                //   colorBehindNavBar: Colors.white,
                // ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: const ItemAnimationProperties(
                  // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation(
                  // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 1),
                ),
                navBarStyle: NavBarStyle.style2, // Choose the nav bar style with this property.
              );

            }
          ),
          ChatScreen(
            pageController: _pageController,
          )
        ],
      ),
    );
  }
}
