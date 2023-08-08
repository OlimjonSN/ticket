class EventModel {
  int? id;
  String? name;
  String? topic;
  String? date;
  String? place;
  int? numberOfSeats;
  String? ticketPrice;
  String? curenncy;
  String? host;
  List? guests;
  String? thumbnail;
  String? description;

  EventModel({
    this.id,
    this.name,
    this.topic,
    this.date,
    this.place,
    this.numberOfSeats,
    this.ticketPrice,
    this.curenncy,
    this.host,
    this.guests,
    this.thumbnail,
    this.description,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    topic = json["topic"];
    date = json["date"];
    place = json["place"];
    numberOfSeats = json["number_of_seats"];
    ticketPrice = json["ticket_price"];
    curenncy = json["curenncy"];
    host = json["host"];
    guests = json["guests"];
    thumbnail = json["thumbnail"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "topic": topic,
      "date": date,
      "place": place,
      "number_of_seats": numberOfSeats,
      "ticket_price": ticketPrice,
      "curenncy": curenncy,
      "host": host,
      "guests": guests,
      "thumbnail": thumbnail,
      "description": description,
    };
  }
}
