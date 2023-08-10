import 'package:dio/dio.dart';
import 'package:ticket/features/reservation/data/models/reservation_model.dart';

class ReservationRemoteData {
  final Dio dio;
  ReservationRemoteData({required this.dio});

  Future createReservation({required Map<String, dynamic> reservation}) async {
    Response res = await dio.post(
      '/reservations/create/',
      data: FormData.fromMap(reservation),
    );
    if (res.statusCode != 201) {
      throw Exception('Error');
    }
  }

  Future<void> cancelReservation(int id) async {
    Response res = await dio.delete(
      '/reservations/$id/cancel/',
    );
    if (res.statusCode != 204) {
      throw Exception('Error');
    }
  }

  Future<List<ReservationModel>> getReservations() async {
    final response = await dio.get('/reservations/all/');
    return (response.data as List).map((e) => ReservationModel.fromJson(e)).toList();
  }
}
