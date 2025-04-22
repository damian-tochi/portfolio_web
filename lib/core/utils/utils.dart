import 'package:url_launcher/url_launcher.dart';

class Utilty {
  static Future<void> openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future<void> openMail() => openUrl("mailto:nkwocha.damian@gmail.com");

  static Future<void> openMyLocation() =>
      openUrl("https://maps.app.goo.gl/oa6Y59cZiKACfPNL6");
  static Future<void> openMyPhoneNo() => openUrl("tel:+2348066855471");
  static Future<void> openWhatsapp() => openUrl("https://wa.me/8066855471");
}
