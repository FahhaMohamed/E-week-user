import 'package:flutter/material.dart';
import 'package:user/core/contants/global.dart';
import 'package:user/core/utils/launch_urls.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SelfInfoWidget extends StatelessWidget {
  const SelfInfoWidget({
    super.key,
    required this.w,
  });

  final double w;

  @override
  Widget build(BuildContext context) {

    const String _myName = "Mohamed Fahham";
    const String _contactMe = "─── ⋆⋅ Contact Me ⋅⋆ ──";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Developed by "),
            Text(
              _myName,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(_contactMe),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ZoomTapAnimation(
                onTap: () {
                  openDevWhatsapp();
                },
                child: Image.asset(
                  AppImagePaths.whatsappIcon,
                  width: w * .1,
                )),
            ZoomTapAnimation(
                onTap: () {
                  openSocialMedia();
                },
                child: Image.asset(
                  AppImagePaths.instagramIcon,
                  width: w * .1,
                )),
          ],
        )
      ],
    );
  }
}