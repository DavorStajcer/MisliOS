import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/common/network_info.dart';
import 'package:misli_os_app/domain/models/misli_os_stats.dart';

final statsRepositoryProvider = Provider<StatsRepository>((ref) {
  final netowrkInfo = ref.read(networkInfoProvider);
  return StatsRepositoryImpl(netowrkInfo);
});

abstract class StatsRepository {
  Future<MisliOsStats> getStats();
}

class StatsRepositoryImpl extends StatsRepository {
  final NetworkInfo _networkInfo;
  StatsRepositoryImpl(this._networkInfo);
  @override
  Future<MisliOsStats> getStats() async {
    final hasInternet = await _networkInfo.isConnected;
    if (!hasInternet) {
      throw NoInternetException('No internet connection');
    }
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('general')
          .doc('stats')
          .get();
      final fireStats = docSnapshot.data();
      if (fireStats == null) {
        throw ServerException('Could not fetch data from server. Try again.');
      }
      final MisliOsStats misliOsStats = MisliOsStats.fromJson(fireStats);
      return misliOsStats;
    } catch (e) {
      log('stats repo, $e');

      throw ServerException('Could not fetch data from server. Try again.');
    }
  }
}
