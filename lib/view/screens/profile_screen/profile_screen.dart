import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/content.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';
import 'package:instagram_clone/view/screens/profile_screen/profile_settings.dart';
import 'package:instagram_clone/view_model/profile_screen/home_profile_scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/like_profile_scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/reel_profile_scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/scroll_provider.dart';
import 'package:instagram_clone/view_model/profile_screen/tab_index.dart';
import 'package:instagram_clone/view_model/reel_screen_index_counts.dart';
import 'package:instagram_clone/view_model/screen_index_counts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, this.isMyProfile = true, required this.data,
  required this.isReelScreen, required this.isHomeScreen,required this.isLikeScreen}) : super(key: key);

  final bool isMyProfile;
  final Content data;
  final bool isReelScreen;
  final bool isHomeScreen;
  final bool isLikeScreen;


  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  final ScrollController _listScrollController = ScrollController();
  final ScrollController _gridScrollControllerOne = ScrollController(initialScrollOffset: 0);
  final ScrollController _gridScrollControllerTwo = ScrollController(initialScrollOffset: 0);
  final ScrollController _gridScrollControllerThree = ScrollController(initialScrollOffset: 0);
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    late final pScrollProvider;
    if(widget.isLikeScreen){
      pScrollProvider = Provider.of<LikeProfileScrollProvider>(context, listen: false);
    }
    else if(widget.isHomeScreen){
      pScrollProvider = Provider.of<HomeProfileScrollProvider>(context, listen: false);
    }
    else if(widget.isReelScreen){
      pScrollProvider=Provider.of<ReelProfileScrollProvider>(context, listen: false);
    }
    else {
      pScrollProvider = Provider.of<ScrollProvider>(context, listen: false);
    }

    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _listScrollController.addListener(() {

      pScrollProvider.changeOffSetValue(_listScrollController.offset);
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _listScrollController.dispose();
    // _gridScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final pScroll;
    if(widget.isLikeScreen){
      pScroll = Provider.of<LikeProfileScrollProvider>(context, listen: false);
    }
    else if(widget.isHomeScreen){
      pScroll = Provider.of<HomeProfileScrollProvider>(context, listen: false);
    }
    else if(widget.isReelScreen){
      pScroll=Provider.of<ReelProfileScrollProvider>(context, listen: false);
    }
    else {
      pScroll = Provider.of<ScrollProvider>(context, listen: false);
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    void onTap(int index) {
      Provider.of<TabIndex>(context, listen: false).changeIndex(index);
      if(!pScroll.expandStatus){
        if(pScroll.offsetValue()<screenWidth * 0.83){
          _listScrollController.jumpTo(pScroll.offsetValue());
        }
        else{
          _listScrollController.jumpTo(screenWidth * 0.84);
        }
      }
      else{
        if(pScroll.offsetValue()< screenWidth * 1.45){
          _listScrollController.jumpTo(pScroll.offsetValue());
        }
        else{
          _listScrollController.jumpTo(screenWidth * 1.46);
        }
      }
    };
    _tabController.addListener(() {
      Provider.of<TabIndex>(context, listen: false).changeIndex(_tabController.index);
      onTap(_tabController.index);
    });

    Consumer tabViewVisibility(){
      if(widget.isHomeScreen){
        return Consumer<HomeProfileScrollProvider>(
          builder: (context, data, child) => Visibility(
            visible: data.expandStatus
                ? data.offsetValue() > screenWidth * 1.44
                : data.offsetValue() > screenWidth * 0.83,
            child: MyTabView(
                screenWidth: screenWidth,
                tabController: _tabController,
                onTap: onTap
            ),
          ),
        );
      }
      else if(widget.isLikeScreen){
        return Consumer<LikeProfileScrollProvider>(
          builder: (context, data, child) => Visibility(
            visible: data.expandStatus
                ? data.offsetValue() > screenWidth * 1.44
                : data.offsetValue() > screenWidth * 0.83,
            child: MyTabView(
                screenWidth: screenWidth,
                tabController: _tabController,
                onTap: onTap
            ),
          ),
        );
      }
      else if(widget.isReelScreen){
        return Consumer<ReelProfileScrollProvider>(
          builder: (context, data, child) => Visibility(
            visible: data.expandStatus
                ? data.offsetValue() > screenWidth * 1.44
                : data.offsetValue() > screenWidth * 0.83,
            child: MyTabView(
                screenWidth: screenWidth,
                tabController: _tabController,
                onTap: onTap
            ),
          ),
        );
      }
      else {
        return Consumer<ScrollProvider>(
          builder: (context, data, child) => Visibility(
            visible: data.expandStatus
                ? data.offsetValue() > screenWidth * 1.44
                : data.offsetValue() > screenWidth * 0.83,
            child: MyTabView(
                screenWidth: screenWidth,
                tabController: _tabController,
                onTap: onTap
            ),
          ),
        );
      }
    }
    return Scaffold(
        extendBody: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.1,
          leading: !widget.isMyProfile ? IconButton(onPressed: (){
            final pReelScreenIndexCount = Provider.of<ReelScreenIndexCountProvider>(context,listen: false);
            final pScreenIndexCount = Provider.of<ScreenIndexCountsProvider>(context,listen: false);


            if(widget.isReelScreen && pReelScreenIndexCount.reelScreenCount!=0){
            pReelScreenIndexCount.incrementOrDecrementReelScreenCount(increment: false);
            }
            else if(widget.isLikeScreen && pScreenIndexCount.likeScreenCount!=0){
              pScreenIndexCount.incrementOrDecrementLikeScreenCount(increment: false);
            }
            else if(widget.isHomeScreen && pScreenIndexCount.homeScreenCount!=0){
              pScreenIndexCount.incrementOrDecrementHomeScreenCount(increment: false);
            }

            Navigator.pop(context);
          }, icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          )) : null,
          title: Text(
            widget.isMyProfile ? "_._Rambo_._._" : widget.data.name,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            Container(
              // height: 20,
              // width: 30,
              padding: const EdgeInsets.symmetric(horizontal: 1),
              margin: const EdgeInsets.symmetric(vertical: 17, horizontal: 13),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 17,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  splashRadius: 0.1,
                  onPressed: () {
                    showModalBottomSheet(

                      useRootNavigator: true,
                        isScrollControlled : true,
                        // backgroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        context: context, builder: (context)=>
                    const ProfileSettings());
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 28,
                  )),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.white,
              child: ListView(
                  controller: _listScrollController,
                  // physics: data.gridStatus ? const NeverScrollableScrollPhysics() : null,
                  physics: null,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: screenWidth * 0.195,
                            // height: 80,
                            width: screenWidth * 0.195,
                            // width: 80,
                            decoration: BoxDecoration(
                                image: widget.isMyProfile
                                    ? DecorationImage(
                                        image: AssetImage(
                                          widget.data.imageUrl,
                                        ),
                                        fit: BoxFit.cover)
                                    : DecorationImage(
                                        image: NetworkImage(
                                          widget.data.imageUrl,
                                        ),
                                        fit: BoxFit.cover),
                                shape: BoxShape.circle,
                                color: kUnloadedColor),
                          ),
                          const ProfileData(
                            digit: 2,
                            description: "Posts",
                          ),
                          ProfileData(
                            digit: widget.data.followers,
                            description: "Followers",
                          ),
                          ProfileData(
                            digit: widget.data.following,
                            description: "Following",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 7),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.name,
                            style:
                                const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text(
                            widget.data.description,
                            style: TextStyle(color: Colors.black87.withOpacity(0.8)),
                          ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                        ],
                      ),
                    ),
                    DiscoverPeople(
                      screenWidth: screenWidth,
                      screenHeight: screenHeight,
                    isReelScreen: widget.isReelScreen,
                      isHomeScreen: widget.isHomeScreen,
                      isProfileScreen: widget.isMyProfile,
                      isLikeScreen: widget.isLikeScreen,
                    ),
                    SizedBox(
                      height: screenWidth * 0.35,
                      // height: 100,
                      // color: Colors.blue,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Data.suggestedReels.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                SizedBox(
                                  width: index == 0 ? 18 : 0,
                                ),
                                Container(
                                  height: screenWidth * 0.24,
                                  // height: 60,
                                  width: 65,
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      // color: Colors.red,
                                      border: Border.all(color: Colors.black45, width: 0.5),
                                      shape: BoxShape.circle),
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        color: kUnloadedColor,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                              Data.suggestedReels[index].image,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                SizedBox(
                                  width: index == Data.suggestedReels.length - 1 ? 18 : 20,
                                ),
                                // const SizedBox(width: 20)
                              ],
                            );
                          }),
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                      // SizedBox(height: 20.0),
                      // Text('Tabs Inside Body', textAlign: TextAlign.center, style: TextStyle(fontSize: 22)),
                      Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                        MyTabView(
                          screenWidth: screenWidth,
                          tabController: _tabController,
                          onTap: onTap,
                        ),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                              border: Border(top: BorderSide(color: Colors.grey.shade300, width: 0.5))),
                        ),
                        SizedBox(
                            height: (screenWidth * 0.58) * 3, //height of TabBarView
                            child: TabBarView(controller: _tabController, children: <Widget>[
                              GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 1.5,
                                    mainAxisSpacing: 1.5,
                                    childAspectRatio: 1,
                                    // mainAxisExtent: screenWidth * 0.4
                                  ),
                                  // padding: EdgeInsets.zero,
                                  itemCount: Data.searchGridAllData.length,
                                  // itemCount: 20,
                                  // physics: data.gridStatus ? null :const NeverScrollableScrollPhysics(),
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: _gridScrollControllerOne,
                                  // shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: kUnloadedColor,
                                              image: DecorationImage(
                                                  image: NetworkImage(Data.searchGridAllData[index]),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Positioned(
                                            top: 10,
                                            right: 10,
                                            child: Image.asset(
                                              'assets/images/reel2.png',
                                              height:  18,
                                              width:  18,
                                              color: Colors.white,
                                            )
                                        )
                                      ],
                                    );
                                  }),
                              GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 1.5,
                                      mainAxisSpacing: 1.5,
                                      mainAxisExtent: screenWidth * 0.58),
                                  // padding: EdgeInsets.zero,
                                  itemCount: Data.suggestedReels.length,
                                  // itemCount: 20,
                                  // physics: data.gridStatus ? null :const NeverScrollableScrollPhysics(),
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: _gridScrollControllerTwo,
                                  // shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              color: kUnloadedColor,
                                              image: DecorationImage(
                                                  image: AssetImage(Data.suggestedReels[index].image),
                                                  fit: BoxFit.cover)),
                                        ),
                                        Positioned(
                                            bottom: 5,
                                            left: 5,
                                            child: Row(
                                              children: const[
                                                Icon(Icons.play_arrow_rounded,color: Colors.white,),
                                                SizedBox(width: 5,),
                                                Text(
                                                  "4,232",
                                                  style: TextStyle(color: Colors.white),
                                                )
                                              ],
                                            ))
                                      ],
                                    );
                                  }),
                              GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 1.5,
                                    mainAxisSpacing: 1.5,
                                    childAspectRatio: 1,
                                    // mainAxisExtent: screenWidth * 0.4
                                  ),
                                  controller: _gridScrollControllerThree,
                                  // padding: EdgeInsets.zero,
                                  itemCount: Data.searchGridAllData.length,
                                  // itemCount: 20,
                                  // physics: data.gridStatus ? null :const NeverScrollableScrollPhysics(),
                                  physics: const NeverScrollableScrollPhysics(),
                                  // controller: _gridScrollController,
                                  // shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                          color: kUnloadedColor,
                                          image: DecorationImage(
                                              image: NetworkImage(Data.searchGridAllData[
                                                  (Data.searchGridAllData.length) -
                                                      (index == 0 ? 1 : index + 1)]),
                                              fit: BoxFit.cover)),
                                    );
                                  }),
                            ]))
                      ]),
                    ]),
                  ]),
            ),
            Positioned(
              top: 0,
              child: tabViewVisibility()
            )
          ],
        ));



  }
}

class MyTabView extends StatelessWidget {
  const MyTabView(
      {super.key, required this.screenWidth, required TabController tabController, required this.onTap})
      : _tabController = tabController;

  final double screenWidth;
  final TabController _tabController;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      // width: double.infinity,
      width: screenWidth,
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        onTap: onTap,
        indicatorColor: Colors.black,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black45,
        tabs: [
          const Tab(icon: Icon(Icons.view_comfortable_sharp)),
          Consumer<TabIndex>(builder: (context, tabIndex, child) {
            return Tab(
              child: Image.asset(
                "assets/images/reel2.png",
                height: 20,
                width: 20,
                color: tabIndex.index == 1 ? Colors.black : Colors.black45,
              ),
            );
          }),
          const Tab(
            icon: Icon(Icons.assignment_ind_outlined),
          ),
        ],
      ),
    );
  }
}

class DiscoverPeople extends StatefulWidget {
  const DiscoverPeople({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  required this.isReelScreen,
  required this.isHomeScreen,
  required this.isProfileScreen,
  required this.isLikeScreen
  });

  final double screenWidth;
  final double screenHeight;
  final bool isProfileScreen;
  final bool isReelScreen;
  final bool isHomeScreen;
  final bool isLikeScreen;

  @override
  State<DiscoverPeople> createState() => _DiscoverPeopleState();
}

class _DiscoverPeopleState extends State<DiscoverPeople> {
  // bool status = Provider.of<ScrollProvider>(context, listen: false).expandStatus;
  @override
  Widget build(BuildContext context) {
    late final pStatus;
    if(widget.isLikeScreen){
      pStatus = Provider.of<LikeProfileScrollProvider>(context.read(), listen: false);
    }
    else if(widget.isHomeScreen){
      pStatus = Provider.of<HomeProfileScrollProvider>(context, listen: false);
    }
    else if(widget.isReelScreen){
      pStatus=Provider.of<ReelProfileScrollProvider>(context, listen: false);
    }
    else {
      // context.read<ScrollProvider>().expandStatus;
      pStatus = Provider.of<ScrollProvider>(context, listen: false);
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 7),
          child: Row(
            children: [
              SizedBox(
                height: 33,
                width: widget.screenWidth * 0.79,
                child: widget.isProfileScreen ? MyElevatedButton(
                  textColor: Colors.black,
                  buttonColor: Colors.grey.shade300,
                  text: 'Edit Profile',
                ) : Row(
                  children: [
                    const Expanded(
                      child: MyElevatedButton(
                        textColor: Colors.white,
                        buttonColor: Colors.blue,
                        text: 'Follow',
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: MyElevatedButton(
                        textColor: Colors.black,
                        buttonColor: Colors.grey.shade300,
                        text: 'Message',
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              Expanded(
                child: SizedBox(
                  height: 33,
                  // width: 0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape:
                            const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        primary: Colors.grey.shade300, // background
                        onPrimary: Colors.grey.shade400, // foreground
                      ),
                      onPressed: () {
                        pStatus.changeExpandStatus(!pStatus.expandStatus);
                        setState(() {
                          // status = !status;
                        });
                      },
                      child: const Center(
                        child:  Icon(
                          Icons.person_add,
                          size: 18,
                          color: Colors.black,
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: pStatus.expandStatus,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Discover people",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: pStatus.expandStatus,
          child: SizedBox(
            // height: widget.screenHeight * 0.3,
            height: widget.screenWidth * 0.5,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Data.horizontalList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(
                        width: index == 0 ? 18 : 0,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: widget.screenWidth * 0.5,
                            width: widget.screenWidth * 0.4,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                border: Border.all(color: Colors.grey.shade300, width: 1),
                                borderRadius: const BorderRadius.all(Radius.circular(6))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: widget.screenWidth * 0.2,
                                      width: widget.screenHeight * 0.2,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kUnloadedColor,
                                          image: DecorationImage(
                                              image: NetworkImage(Data.horizontalList[index].imageUrl),
                                              fit: BoxFit.cover)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0, bottom: 5),
                                      child: Text(
                                        Data.horizontalList[index].name,
                                        style:
                                            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Text(
                                      "Suggested for your work",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.black54, fontSize: 13),
                                    ),
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.all(Radius.circular(7))),
                                    child: const Center(
                                      child: Text(
                                        "Follow",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const Positioned(
                              top: 5,
                              right: 5,
                              child: Icon(
                                Icons.close,
                                color: Colors.black45,
                                size: 23,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: index == Data.horizontalList.length - 1 ? 18 : 5,
                      ),
                    ],
                  );
                }),
          ),
        ),
      ],
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key,
  required this.textColor,
  required this.buttonColor,
  required this.text
  });

  final Color textColor;
  final Color buttonColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          primary: buttonColor, // background
          onPrimary: Colors.grey.shade400, // foreground
        ),
        onPressed: () {},
        child:  Text(
          text,
          style: TextStyle(color:textColor, fontSize: 15),
        ));
  }
}

class ProfileData extends StatelessWidget {
  const ProfileData({super.key, required this.digit, required this.description});

  final int digit;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          digit.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: TextStyle(
            color: Colors.black87.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget widget;

  PersistentHeader({required this.widget});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => 2256.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
