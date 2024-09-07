import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:postableapp/main.dart';
import 'package:postableapp/service/context_utility.dart';

import 'package:uni_links/uni_links.dart';

class UniService {
  static String _code = '';
  static String get code => _code;
  static bool get hasCode => _code.isNotEmpty;
  static void reset() => _code = '';
  static init() async {
    try {
      if (kIsWeb) {
        // Handle web-specific logic, if necessary
        log('Running on Web. UniLinks stream is not available.');
        return;
      }
      final Uri? uri = await getInitialUri();
      uniHandler(uri);
    } on PlatformException {
      log('Failed to receive the code');
    } on FormatException {
      log("wrong format code received");
    }

    uriLinkStream.listen((Uri? uri) async {
      uniHandler(uri);
    }, onError: (error) {
      log("OnUriLink Error$error");
    });
  }

  static uniHandler(Uri? uri) {
    if (uri == null || uri.queryParameters.isEmpty) return;
    Map<String, String> param = uri.queryParameters;
    String receivedCode = param['code'] ?? '';
    try {
      if (receivedCode == "image") {
        Navigator.push(ContextUtitlity.context!,
            MaterialPageRoute(builder: (_) => const MyHomePage()));
      }
      if (receivedCode == "text") {
        Navigator.push(ContextUtitlity.context!,
            MaterialPageRoute(builder: (_) => const MyHomePage()));
      }
      if (receivedCode == "video") {
        Navigator.push(ContextUtitlity.context!,
            MaterialPageRoute(builder: (_) => const MyHomePage()));
      }
    } catch (e) {
      log("error found $e");
    }
  }
}
