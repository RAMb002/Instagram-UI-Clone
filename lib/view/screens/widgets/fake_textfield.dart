import 'package:flutter/material.dart';


class FakeTextField extends StatelessWidget {
  const FakeTextField({
  super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
          height: 35,
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: Colors.grey.shade200, borderRadius: const BorderRadius.all(Radius.circular(8))),
          child: Row(
            children: const [
              Icon(
                Icons.search,
                color: Colors.black45,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Search",
                style: TextStyle(color: Colors.black45,fontSize: 15),
              )
            ],
          )),
    );
  }
}
