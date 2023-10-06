import 'package:url_launcher/url_launcher.dart';
import 'package:yeye/Constants/app_texts.dart';

void agreementLauncher(String urlPath) async {
  Uri url = Uri.parse(urlPath);
  var urllaunchable = await canLaunchUrl(url);
  if (urllaunchable) {
    final Uri emailLaunchUri =
        Uri(scheme: 'mailto', path: 'yeye.app@yahoo.com');

    await launchUrl(urlPath == LoadMoneyMessages.mailUrl ? emailLaunchUri : url,
        mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
