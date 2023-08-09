import 'package:dio/dio.dart';

import '../models/event_model.dart';

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
  }

  Future<List<EventModel>> getEvents() async {
    final response = await dio.get('/events/all/');
    return (response.data as List).map((e) => EventModel.fromJson(e)).toList();
  }
}
