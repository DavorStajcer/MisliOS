import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:riverpod/riverpod.dart';

final networkInfoProvider = Provider<NetworkInfo>((ref) => const NetworkInfo());

class NetworkInfo {
  const NetworkInfo();

  Future<bool> get isConnected async {
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
