import 'dart:math';

import 'package:dio/dio.dart';
import 'package:ticket/features/events/data/models/event_model.dart';

class EventRemoteData {
  final Dio dio;

  EventRemoteData({required this.dio});

  Future createEvent({required Map<String, dynamic> event}) async {
    Response res = await dio.post(
      '/events/create/',
      data: FormData.fromMap(event),
    );
    if (res.statusCode != 201) {
      throw Exception('Error');
    }
    return res.data;
  }

  Future getEvents() async {
    Response res = await dio.get('/events/all');

    if (res.statusCode == 200) {
      return EventModel.fromJson(res.data);
    } else {
      throw Exception('Error');
    }
  }
}
