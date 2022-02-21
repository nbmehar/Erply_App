import 'package:url_launcher/url_launcher.dart';

class OpenUrl {
  void start({required String url}) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
