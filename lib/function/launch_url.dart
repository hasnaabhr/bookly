import 'package:bookly/function/custome_snakbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url!=null) {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    customeSnackBar(context, 'can not launch $url');
  }
}
}


