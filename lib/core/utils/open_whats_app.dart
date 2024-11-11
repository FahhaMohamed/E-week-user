import 'package:url_launcher/url_launcher.dart';
import 'package:user/core/contants/global.dart';

Future<void> openWhatsApp() async {
  const url = 'https://wa.me/$phoneNumber';

  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
