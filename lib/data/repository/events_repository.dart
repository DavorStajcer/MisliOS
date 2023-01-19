import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/common/network_info.dart';

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  final networkInfo = ref.read(networkInfoProvider);
  return EventsRepositoryImpl(networkInfo);
});

abstract class EventsRepository {
  Future<List<String>> getEvents();
}

class EventsRepositoryImpl extends EventsRepository {
  final NetworkInfo _networkInfo;
  EventsRepositoryImpl(this._networkInfo);
  @override
  Future<List<String>> getEvents() async {
    final hasInternet = await _networkInfo.isConnected;
    if (!hasInternet) {
      throw NoInternetException('No internet connection');
    }
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('events').get();
      final List<String> eventHtmlBodies = [];
      for (var docSnapshot in querySnapshot.docs) {
        final fireEvent = docSnapshot.data();
        log('$fireEvent');
        final eventHtmlBody = fireEvent['body'];
        eventHtmlBodies.add(eventHtmlBody);
      }
      log('events: events repo, returning $eventHtmlBodies');
      return eventHtmlBodies;
    } catch (e) {
      log('events repo, $e');
      throw ServerException('Could not fetch data from server. Try again.');
    }
  }
}
