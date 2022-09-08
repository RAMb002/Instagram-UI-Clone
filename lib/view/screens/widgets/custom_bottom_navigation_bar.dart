// import 'package:flutter/material.dart';
//
// class CustomBottomNavigationBar extends StatefulWidget {
//    CustomBottomNavigationBar({Key? key,required this.navIndex}) : super(key: key);
//
//    int navIndex;
//
//   @override
//   _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
// }
//
// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     print('bottom');
//     return Container(
//       height: 50,
//       color: Colors.redAccent,
//       child: Row(
//         children: [
//           Expanded(
//               child: GestureDetector(
//                 onTap: (){
//                   setState(() {
//                     widget.navIndex = 0;
//                   });
//                   print('hi');
//                 },
//                 child: Container(
//                   height: 50,
//                   color: Colors.blue,
//                   child: Icon(Icons.home),
//                 ),
//               )),
//           Expanded(
//               child: Container(
//                 child: Icon(Icons.home),
//               )),
//           Expanded(
//               child: Container(
//                 child: Icon(Icons.home),
//               )),
//           Expanded(
//               child: Container(
//                 child: Icon(Icons.home),
//               )),
//           Expanded(
//               child: Container(
//                 child: Icon(Icons.home),
//               )),
//         ],
//       ),
//     );
//   }
// }
