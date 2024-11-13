import 'package:url_launcher/url_launcher.dart';
import 'package:user/core/contants/global.dart';

void openWhatsapp() async {
  var uri = Uri.parse('https://wa.me/$phoneNumber');

  launchUrl(uri);
}

void openDevWhatsapp() async {
  var uri = Uri.parse('https://wa.me/$myPhoneNumber');

  launchUrl(uri);
}

void openSocialMedia() async {
  var uri = Uri.parse(mySocial);
  launchUrl(uri);
}
