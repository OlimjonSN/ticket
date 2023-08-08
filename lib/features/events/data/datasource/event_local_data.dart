import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/features/events/data/models/event_model.dart';

class EventLocalData {
  SharedPreferences sharedPreference;
  EventLocalData({required this.sharedPreference});

  //save model
  Future<void> saveEventModel(EventModel eventModel) async {
    await sharedPreference.setString('eventModel', jsonEncode(eventModel.toJson()));
  }

  //get model
  Future getEvents() async {
    String? eventModelString = sharedPreference.getString('eventModel');
    if (eventModelString != null) {
      return EventModel.fromJson(jsonDecode(eventModelString));
    } else {
      throw Exception('No event model found');
    }
  }
}
