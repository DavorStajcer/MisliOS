import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/common/network_info.dart';
import 'package:misli_os_app/domain/models/home_tab.dart';
import 'package:misli_os_app/domain/models/home_tab_custom.dart';
import 'package:misli_os_app/domain/models/tab_type.dart';

final tabsRepositoryProvider = Provider<TabsRepository>((ref) {
  final netowrkInfo = ref.read(networkInfoProvider);
  return TabsRepositoryImpl(netowrkInfo);
});

abstract class TabsRepository {
  Future<List<HomeTab>> getTabs();
}

class TabsRepositoryImpl extends TabsRepository {
  final NetworkInfo _networkInfo;
  TabsRepositoryImpl(this._networkInfo);

  @override
  Future<List<HomeTab>> getTabs() async {
    final hasInternet = await _networkInfo.isConnected;
    if (!hasInternet) {
      throw NoInternetException('No internet connection');
    }
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('tabs')
          .orderBy('orderNum')
          .get();
      final List<HomeTab> tabs = [];
      for (var docSnapshot in querySnapshot.docs) {
        final fireTab = docSnapshot.data();
        log('$fireTab');
        final String type = fireTab['type'];
        final HomeTab tab;
        if (type == TabType.naslovnica) {
          tab = HomeTab.fromJson(fireTab);
        } else {
          tab = HomeTabCustom.fromJson(fireTab);
        }
        tabs.add(tab);
      }
      log('tabs: tabs repo, returning $tabs');
      return tabs;
    } catch (e) {
      log('tabs repo, $e');
      throw ServerException('Could not fetch data from server. Try again.');
    }
  }
}
