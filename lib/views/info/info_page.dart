import 'package:flutter/material.dart';
import 'package:user/core/contants/global.dart';
import 'package:user/core/utils/screen_width.dart';
import 'package:user/views/info/widgets/contact_us.dart';
import 'package:user/views/info/widgets/detail_page.dart';
import 'package:user/views/info/widgets/info_item.dart';

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
                  "assets/images/batch-logo.png",
                  width: w * .7,
                ),
                InfoItem(
                  w: w,
                  title: "History",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailPage(
                              title: 'History',
                              text: InfoTexts.historyText,
                            )));
                  },
                ),
                InfoItem(
                  w: w,
                  title: "Objective",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailPage(
                              title: 'Objective',
                              text: InfoTexts.objectiveText,
                            )));
                  },
                ),
                InfoItem(
                  w: w,
                  title: "Purpose",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => DetailPage(
                              title: 'Purpose',
                              text: InfoTexts.purposeText,
                            )));
                  },
                ),
                ContactUs(w: w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
