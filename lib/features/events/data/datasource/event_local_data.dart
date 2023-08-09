import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/features/events/data/models/event_model.dart';

class EventLocalData {
  SharedPreferences sharedPreference;
  EventLocalData({required this.sharedPreference});

  //save model
  Future<void> saveEventModel(List<EventModel> eventModel) async {
    await sharedPreference.setStringList('eventModel', eventModel.map((e) => jsonEncode(e.toJson())).toList());
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
