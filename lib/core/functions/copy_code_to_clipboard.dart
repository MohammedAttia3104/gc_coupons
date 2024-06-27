import 'package:flutter/services.dart';

Future<void> copyCodeToClipboard({required String code}) async {
  await Clipboard.setData(
    ClipboardData(
      text: code,
    ),
  );
}
