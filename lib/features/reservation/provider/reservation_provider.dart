import 'package:flutter/material.dart';
import 'package:ticket/features/events/data/models/event_model.dart';
import 'package:ticket/features/events/data/repositories/event_repositories.dart';
import 'package:ticket/features/reservation/data/models/reservation_model.dart';
import 'package:ticket/features/reservation/data/repository/repositories.dart';

import '../../../injection.dart';

enum Status { uninitialized, created, creating, error }

class ReservationProviderr with ChangeNotifier {
  ReservationsRepositories reservationRepositories;
  ReservationProviderr({required this.reservationRepositories});
  List<ReservationModel>? reservations;
  List<EventModel>? events;
  String? error;
  Status status = Status.uninitialized;
  Future<void> createReservation(Map<String, dynamic> reservation) async {
    try {
      status = Status.creating;
      notifyListeners();
      await reservationRepositories.createReservation(reservation);
      status = Status.created;
      notifyListeners();
      status = Status.uninitialized;
    } catch (e) {
      print(e);
      status = Status.error;
      notifyListeners();
      error = 'Invalid  $e';
      notifyListeners();
    }
  }

  Future cancelres(int id) async {
    await reservationRepositories.cancelRes(id);

    status = Status.uninitialized;
    notifyListeners();
  }

  Future getReservations() async {
    status = Status.creating;
    notifyListeners();
    try {
      reservations = await reservationRepositories.getReservations();
      events = await sl<EventRepositories>().getEvents();
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
