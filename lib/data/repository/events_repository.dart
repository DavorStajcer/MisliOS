import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misli_os_app/common/exception.dart';
import 'package:misli_os_app/common/network_info.dart';
import 'package:misli_os_app/domain/models/event_model.dart';

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  final networkInfo = ref.read(networkInfoProvider);
  return EventsRepositoryImpl(networkInfo);
});

abstract class EventsRepository {
  Future<List<EventModel>> getEvents();
}

class EventsRepositoryImpl extends EventsRepository {
  final NetworkInfo _networkInfo;
  EventsRepositoryImpl(this._networkInfo);
  @override
  Future<List<EventModel>> getEvents() async {
    final hasInternet = await _networkInfo.isConnected;
    if (!hasInternet) {
      throw NoInternetException('No internet connection');
    }
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('events')
          .orderBy('dateCreated', descending: true)
          .get();
      final List<EventModel> eventHtmlBodies = [];
      for (var docSnapshot in querySnapshot.docs) {
        final fireEvent = docSnapshot.data();
        final event = EventModel.fromJson(fireEvent);
        eventHtmlBodies.add(event);
      }
      return eventHtmlBodies;
    } catch (e) {
      throw ServerException('Could not fetch data from server. Try again.');
    }
  }
}
