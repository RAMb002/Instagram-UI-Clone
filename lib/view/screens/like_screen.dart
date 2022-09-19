import 'package:flutter/material.dart';
import 'package:instagram_clone/model/user_data/data.dart';
import 'package:instagram_clone/view/screens/constants.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          "Activity",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: Data.horizontalList.length,
          itemBuilder: (context,index){
        return Stack(
          alignment:AlignmentDirectional.center ,
          children: [
            SizedBox(
              height: 70,
              width: MediaQuery.of(context).size.width,


            ),
            Positioned(child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.transparent,
                    child: Container(
                      height:70 ,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            )),
            Positioned(
              // right: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IgnorePointer(
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kUnloadedColor,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      Data.horizontalList[index].imageUrl
                                  ),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: IgnorePointer(
                          child: RichText(
                            text: TextSpan(
                              text: Data.horizontalList[index].name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold

                              ),
                              children: const <TextSpan>[
                                TextSpan(text: ' started following you', style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      const ActivityButton()
                    ],
                  ),
                ),)
          ],
        );
      }),
    );
  }
}

class ActivityButton extends StatefulWidget {
  const ActivityButton({
    super.key,
  });

  @override
  State<ActivityButton> createState() => _ActivityButtonState();
}

class _ActivityButtonState extends State<ActivityButton> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          status = !status;
        });
      },
      child: Ink(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 14),
                decoration:  BoxDecoration(
        color: status ? Colors.grey.shade300 : Colors.blue,
        borderRadius: const BorderRadius.all(Radius.circular(6))
                ),
                child:  Text(
      status ? "Following" : "Follow",
      style: TextStyle(
          color:status ? Colors.black : Colors.white70
      ),
                ),
              ),
    );
  }
}
