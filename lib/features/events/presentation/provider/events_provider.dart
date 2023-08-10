import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../data/models/event_model.dart';
import '../../data/repositories/event_repositories.dart';

enum Status { uninitialized, created, creating, error }

class EventsProvider with ChangeNotifier {
  EventRepositories eventsRepositories;
  EventsProvider({required this.eventsRepositories});
  List<EventModel>? events;
  String? error;
  Status status = Status.uninitialized;
  Future<void> createEvent(Map<String, dynamic> event) async {
    try {
      status = Status.creating;
      notifyListeners();
      await eventsRepositories.createEvent(event);
      status = Status.created;
      notifyListeners();
      status = Status.uninitialized;
    } catch (e) {
      if (e is DioException) {
        error = e.response?.data.toString();
        status = Status.error;
        notifyListeners();
        return;
      } else {
        status = Status.error;
        notifyListeners();
      }

      error = 'Invalid  $e';
      notifyListeners();
    }
  }

  Future getEvents() async {
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
