class EventModel {
  int? id;
  String? name;
  String? topic;
  String? date;
  String? place;
  int? numberOfSeats;
  String? ticketPrice;
  String? curenncy;

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
    this.guests,
    this.thumbnail,
    this.description,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    print(json);
    id = json["id"];
    name = json["name"];
    topic = json["topic"];
    date = json["date"];
    place = json["place"];
    numberOfSeats = json["number_of_seats"];
    ticketPrice = json["ticket_price"];
    curenncy = json["curenncy"];

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
      "guests": guests,
      "thumbnail": thumbnail,
      "description": description,
    };
  }
}
