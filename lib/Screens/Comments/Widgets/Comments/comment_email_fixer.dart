import '../../../../Constants/app_texts.dart';

String shortenEmail(String email) {
  final parts = email.split('@');
  final firstPart = parts[0];
  return '${firstPart.substring(0, 2)}****${firstPart.substring(firstPart.length - 2)}${AccountActions.schoolMail}';
}
