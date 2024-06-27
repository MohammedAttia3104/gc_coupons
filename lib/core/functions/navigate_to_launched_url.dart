import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> navigateToLaunchedUrl({required String link}) async {
  Uri url = Uri.parse(link);
  try {
    if (await canLaunchUrl(url)) {
      await navigateToLaunchedUrl( link: link);
      debugPrint('URL: $url launched successfully');
      return true;
    } else {
      debugPrint('Could not launch URL: $url');
      return false;
    }
  } catch (e) {
    debugPrint('Could not launch URL: $url');
    return  false;
  }
}
