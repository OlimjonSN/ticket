import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:ticket/features/events/data/models/event_model.dart';
import 'package:ticket/features/events/data/repositories/event_repositories.dart';

enum Status { uninitialized, created, creating, error }

class EventsProvider with ChangeNotifier {
  EventRepositories eventsRepositories;
  EventsProvider({required this.eventsRepositories});
  EventModel? events;
  String? error;
  Status status = Status.uninitialized;
  Future<void> createEvent(Map<String, dynamic> event) async {
    try {
      status = Status.creating;
      notifyListeners();
      await eventsRepositories.createEvent(event);
      status = Status.created;
      notifyListeners();
    } catch (e) {
      print(e);
      status = Status.error;
      notifyListeners();
      error = 'Invalid  $e';
      notifyListeners();
    }
  }

  Future<void> getEvents() async {
    try {
      status = Status.creating;
      notifyListeners();
      events = await eventsRepositories.getEvents();
      status = Status.created;
      notifyListeners();
    } catch (e) {
      status = Status.error;
      notifyListeners();
      error = 'Invalid  $e';
      notifyListeners();
    }
  }
}
