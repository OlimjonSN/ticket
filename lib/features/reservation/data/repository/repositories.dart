import 'package:ticket/core/network/network_info.dart';
import 'package:ticket/features/reservation/data/datasource/reservation_remote_data.dart';
import 'package:ticket/features/reservation/data/models/reservation_model.dart';

class ReservationsRepositories {
  final ReservationRemoteData reservationRemoteData;
  final NetworkInfo networkInfo;

  ReservationsRepositories({required this.reservationRemoteData, required this.networkInfo});

  Future<List<ReservationModel>> getReservations() async {
    if (await networkInfo.isConnected) {
      final reservations = await reservationRemoteData.getReservations();
      return reservations;
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<void> cancelRes(int id) async {
    if (await networkInfo.isConnected) {
      await reservationRemoteData.cancelReservation(id);
    } else {
      throw Exception('No internet connection');
    }
  }

  Future createReservation(Map<String, dynamic> reservation) async {
    if (await networkInfo.isConnected) {
      await reservationRemoteData.createReservation(reservation: reservation);
    } else {
      throw Exception('No internet connection');
    }
  }
}
