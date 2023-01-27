import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:riverpod/riverpod.dart';

final networkInfoProvider = Provider<NetworkInfo>((ref) => const NetworkInfo());

class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected async =>
      kIsWeb ? _isConnectedWeb : _isConnectedMobile;

  Future<bool> get _isConnectedMobile async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } on SocketException catch (_) {
      return Future.value(false);
    }
  }

  Future<bool> get _isConnectedWeb async {
    try {
      final result = await http.get(Uri.parse('www.google.com'));
      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
