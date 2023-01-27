import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/common/network_info.dart';
import 'package:misli_os_app/domain/models/misli_os_stats.dart';

final generalRepositoryProvider = Provider<GeneralInfoRepository>((ref) {
  final netowrkInfo = ref.read(networkInfoProvider);
  return GeneralInfoRepositoryImpl(netowrkInfo);
});

abstract class GeneralInfoRepository {
  Future<List<MisliOsStat>> getStats();
  Future<String> getMainImageUrl();
}

class GeneralInfoRepositoryImpl extends GeneralInfoRepository {
  final NetworkInfo _networkInfo;
  GeneralInfoRepositoryImpl(this._networkInfo);
  @override
  Future<List<MisliOsStat>> getStats() async {
    final hasInternet = await _networkInfo.isConnected;
    if (!hasInternet) {
      throw NoInternetException('No internet connection');
    }
    try {
      log('statsstuff: getting stats..');

      final querySnapshot = await FirebaseFirestore.instance
          .collection('general')
          .doc('stats')
          .collection('numbers')
          .get();
      final docSnapshots = querySnapshot.docs;
      final List<MisliOsStat> stats = [];
      for (var docSnapshot in docSnapshots) {
        final data = docSnapshot.data();
        final stat = MisliOsStat.fromJson(data);
        stats.add(stat);
      }
      log('statsstuff: got stats $stats');
      return stats;
    } catch (e) {
      log('statsstuff: error getting stats $e');

      throw ServerException('Could not fetch data from server. Try again.');
    }
  }

  @override
  Future<String> getMainImageUrl() async {
    final hasInternet = await _networkInfo.isConnected;
    if (!hasInternet) {
      throw NoInternetException('No internet connection');
    }
    try {
      log('statsstuff: getting stats..');

      final docSnpashot = await FirebaseFirestore.instance
          .collection('general')
          .doc('home_page_picture')
          .get();
      final data = docSnpashot.data();
      final imageUrl = data?["imageUrl"];
      if (imageUrl == null) {
        throw ServerException('Could not fetch data from server. Try again.');
      }
      log('statsstuff: got imageUrl $imageUrl');
      return imageUrl;
    } catch (e) {
      log('statsstuff: error getting stats $e');

      throw ServerException('Could not fetch data from server. Try again.');
    }
  }
}
