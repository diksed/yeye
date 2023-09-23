import 'package:url_launcher/url_launcher.dart';

void agreementLauncher(String urlPath) async {
  Uri url = Uri.parse(urlPath);
  var urllaunchable = await canLaunchUrl(url);
  if (urllaunchable) {
    await launchUrl(url, mode: LaunchMode.inAppWebView);
  } else {
    throw 'Could not launch $url';
  }
}
