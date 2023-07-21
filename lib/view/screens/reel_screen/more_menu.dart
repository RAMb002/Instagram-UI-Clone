import 'package:flutter/material.dart';

const kPadding = EdgeInsets.symmetric(horizontal: 24.0,vertical: 20);
class MoreMenu extends StatelessWidget {
  const MoreMenu({Key? key,required this.icon,required this.menuItemText,required this.initialSize}) : super(key: key);

  final IconData icon;
  final String menuItemText;
  final double initialSize;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: initialSize,
        minChildSize: 0.1,
        // controller: _controller,
        maxChildSize: 0.99,
        expand: false,
        snap: true,
        builder: (_, controller) => Container(
          height: 265,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 0),
          decoration:const  BoxDecoration(
            // color:  Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: const BorderRadius.all(Radius.circular(16))),
              ),
              Padding(
                padding: kPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MenuCircle(
                      icon: Icons.share_outlined,
                      text: "Share",
                    ),MenuCircle(
                      icon: Icons.link_outlined,
                      text: "Link",
                    ),MenuCircle(
                      icon: Icons.bookmark_outline,
                      text: "Save",
                    ),MenuCircle(
                      icon: Icons.data_saver_on_outlined,
                      text: "Remix",
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.black26,height: 2,thickness: 1,),
              Padding(
                padding: kPadding,
                child: Column(
                  children: [
                    MenuItems(
                      text: menuItemText,
                      color: Colors.black,
                      icon: icon,
                    ),
                    const SizedBox(height: 25,),
                    const MenuItems(
                      text: "Report...",
                      color: Colors.red,
                      icon: Icons.report_outlined,
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
    );

  }
}

class MenuItems extends StatelessWidget {
  const MenuItems({
    super.key,
  required this.icon,
  required this.text,
  required this.color
  });

  final IconData icon;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        Icon(icon,size: 25,color: color,),
         const SizedBox(width: 15,),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w500,
            fontSize: 17
          ),
        )
      ],
    );
  }
}

class MenuCircle extends StatelessWidget {
  const MenuCircle({
    super.key,
  required this.text,
  required this.icon
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,width: 60,
        decoration: BoxDecoration(
          // color: Colors.red,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black,width: 1)

        ),
          child: Icon(icon,color: Colors.black,size: 28,),
        ),
        const SizedBox(height: 5,),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}
