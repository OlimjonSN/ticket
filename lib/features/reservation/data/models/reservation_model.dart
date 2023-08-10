// model for reservation

class ReservationModel {
  final int id;
  final int event;
  final int number_of_tickets;
  final int guest;
  final String status;

  ReservationModel({
    required this.id,
    required this.event,
    required this.number_of_tickets,
    required this.guest,
    required this.status,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      event: json['event'],
      number_of_tickets: json['number_of_tickets'],
      guest: json['guest'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'event': event,
      'number_of_tickets': number_of_tickets,
      'guest': guest,
      'status': status,
    };
  }
}
