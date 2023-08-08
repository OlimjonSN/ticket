import 'package:ticket/core/network/network_info.dart';
import 'package:ticket/features/events/data/datasource/event_local_data.dart';
import 'package:ticket/features/events/data/datasource/event_remote_data.dart';
import 'package:ticket/features/events/data/models/event_model.dart';

class EventRepositories {
  final EventRemoteData eventRemoteDataSource;
  final EventLocalData eventLocalDataSource;
  final NetworkInfo networkInfo;

  EventRepositories({
    required this.networkInfo,
    required this.eventRemoteDataSource,
    required this.eventLocalDataSource,
  });

  Future<EventModel> getEvents() async {
    if (await networkInfo.isConnected) {
      final events = await eventRemoteDataSource.getEvents();
      await eventLocalDataSource.saveEventModel(events);
      return events;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<EventModel> createEvent(Map<String, dynamic> event) async {
    if (await networkInfo.isConnected) {
      final events = await eventRemoteDataSource.createEvent(event: event);

      return events;
    } else {
      throw Exception('No internet connection');
    }
  }
}
