import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';
import 'package:instagram_clone/view/screens/home_screen/widgets/horizontal_list.dart';

class SendScreen extends StatelessWidget {
  SendScreen({Key? key}) : super(key: key);

  DraggableScrollableController _controller = DraggableScrollableController();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.1,
        // controller: _controller,
        maxChildSize: 0.97,
        expand: false,
        snap: true,
        builder: (_, controller) => Container(
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ListView.builder(
                    itemCount: Data.horizontalList.length,
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    controller: controller,
                    itemBuilder: (context, index) {
                      var data =Data.horizontalList[Data.horizontalList.length - index -1];
                      return Column(
                        children: [
                           SizedBox(height: index==0 ? 140 : 0,),
                          index == 0 ? SendBody(data: data, status: true) : const SizedBox(),
                          SendBody(data: data,status: false,),
                        ],
                      );
                    }),
                Positioned(
                  top: 0,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 5,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade600,
                              borderRadius: BorderRadius.all(Radius.circular(16))),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 70,
                          width: screenWidth,
                          child: const TextField(
                            decoration: InputDecoration(
                                hintText: "Write a message...",
                                contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 30)),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SearchTextField(screenWidth: screenWidth),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: widget.screenWidth - 40,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.only(bottom: 0, left: 5, right: 5),
      child: Focus(
        child: FocusScope(
          onFocusChange: (focus) => setState(() {
            status=!status;
          }),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                contentPadding: const EdgeInsets.only(left: 2),
                prefixIcon:  Icon(
                  Icons.search,
                  color: status ? Colors.black : Colors.black45,
                ),
                suffixIcon:  Icon(
                  Icons.group_add_outlined,
                  color: status ? Colors.black : Colors.black45,
                ),
                fillColor: Colors.grey.shade200,
                disabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(color: Colors.grey.shade200)),
                focusColor: Colors.grey.shade200,
                focusedBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(color: Colors.grey.shade200)),
                enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.all(Radius.circular(18)),
                    borderSide: BorderSide(color: Colors.grey.shade200))),
          ),
        ),
      ),
    );
  }
}

class SendBody extends StatelessWidget {
   SendBody({
    super.key,
    required this.data,
   required this.status
  });

   var data;
   final bool status;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(color: kUnloadedColor, shape: BoxShape.circle,
              image: status ? DecorationImage(
                image: AssetImage(
                     Data.myProfile[0].imageUrl
                ),
                fit: BoxFit.cover
              ) :DecorationImage(
                  image: NetworkImage(
                    data.imageUrl
                  ),
                  fit: BoxFit.cover
              )  ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                status ? "Add reel to your story" : data.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            status ? Icon(Icons.arrow_forward_ios_rounded,size: 18,) : SendButton(),
          ],
        ));
  }
}

class SendButton extends StatefulWidget {
  SendButton({Key? key}) : super(key: key);

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        splashColor: Colors.white10,
        onTap: () async {
          if (index == 1) {
            setState(() {
              index = 0;
            });
          } else if (index != 2) {
            setState(() {
              index = 1;
            });
            await Future.delayed(const Duration(seconds: 3));
            setState(() {
              index = 2;
            });
          }
        },
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          decoration: BoxDecoration(
              color: index == 0 ? Colors.blue : Colors.white,
              // color: Colors.blue,
              border: Border.all(color: index == 0 ? Colors.blue : Colors.grey.shade300, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Text(
            text(index),
            style: TextStyle(color: index == 0 ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }

  String text(int index) {
    if (index == 0) {
      return "Send";
    } else if (index == 1) {
      return "Undo";
    } else
      return "Sent";
  }
}
