import 'package:flutter/material.dart';
import 'package:user/core/contants/global.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/views/info/utils/enum_helpers.dart';
import 'package:user/views/info/widgets/contact_us.dart';
import 'package:user/views/info/widgets/detail_page.dart';
import 'package:user/views/info/widgets/info_item.dart';
import 'package:user/views/info/widgets/self_info_widget.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    double w = getScreenWidth(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  AppImagePaths.batchLogo,
                  width: w * .7,
                ),
                InfoItem(
                  w: w,
                  title: InfoItems.History.name,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailPage(
                              title: InfoItems.History.name,
                              text: InfoTexts.historyText,
                            )));
                  },
                ),
                InfoItem(
                  w: w,
                  title: InfoItems.Objective.name,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailPage(
                              title: InfoItems.Objective.name,
                              text: InfoTexts.objectiveText,
                            )));
                  },
                ),
                InfoItem(
                  w: w,
                  title: InfoItems.Purpose.name,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailPage(
                              title: InfoItems.Purpose.name,
                              text: InfoTexts.purposeText,
                            )));
                  },
                ),
                ContactUs(w: w),
                SelfInfoWidget(w: w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
