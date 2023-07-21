import 'package:flutter/material.dart';
import 'package:instagram_clone/view/screens/reel_screen/more_menu.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.1,
        // controller: _controller,
        maxChildSize: 0.7,
        expand: false,
        // snap: true,
        builder: (_, controller) => ListView(
          // shrinkWrap: true,
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    height: 5,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: const BorderRadius.all(Radius.circular(16))),
                  ),
                ),
                const SizedBox(height: 10,),
                const ProfileScreenMenuItem(
                  icon: Icons.settings,
                  text: "Settings",
                ),
                const ProfileScreenMenuItem(
                  icon: Icons.lock_reset,
                  text: "Archive",
                ),
                const ProfileScreenMenuItem(
                  icon:Icons.history_toggle_off,
                  text: "Your activity",
                ),
                const ProfileScreenMenuItem(
                  icon: Icons.qr_code_2_outlined,
                  text: "QR code",
                ),
                const ProfileScreenMenuItem(
                  icon: Icons.bookmark_border,
                  text: "Saved",
                ),
                const ProfileScreenMenuItem(
                  icon: Icons.verified_user_outlined,
                  text: "Digital collectibles",
                ),
                const ProfileScreenMenuItem(
                  icon: Icons.list,
                  text: "Close friends",
                ),
                const ProfileScreenMenuItem(
                  icon: Icons.star_border_outlined,
                  text: "Favourites",
                ),
                const ProfileScreenMenuItem(
                  icon: Icons.coronavirus_outlined,
                  text: "COVID- 19 Information Centre",
                ),
              ],
            ),
          ],
        )
    );
  }
}

class ProfileScreenMenuItem extends StatelessWidget {
  const ProfileScreenMenuItem({
    super.key,
  required this.text,
  required this.icon
  });

  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: (){

        },
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
          children:  [
           Icon(icon,size: 25,color: Colors.black,),
    const SizedBox(width: 15,),
    Text(
          text,
          style: const TextStyle(
              color: Colors.black87,
              // fontWeight: FontWeight.w500,
              fontSize: 17,
          ),
    )
          ],
        ),
        ),
      ),
    );
  }
}
