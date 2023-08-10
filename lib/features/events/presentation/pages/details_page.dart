import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ticket/features/events/data/models/event_model.dart';

import '../../../reservation/provider/reservation_provider.dart';

class DeatailPage extends StatefulWidget {
  EventModel data;
  DeatailPage({super.key, required this.data});

  @override
  State<DeatailPage> createState() => _DeatailPageState();
}

class _DeatailPageState extends State<DeatailPage> {
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(widget.data.thumbnail!),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(flex: 4, child: SizedBox()),
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 45,
                            decoration: ShapeDecoration(color: Colors.cyan, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.chair, color: Colors.white, size: 24),
                                Text('${widget.data.numberOfSeats}', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Text('\$ ${widget.data.ticketPrice}', textAlign: TextAlign.center, style: TextStyle(color: Color(0xFFDFA308), fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(widget.data.name!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.w500)),
                      Row(
                        children: [
                          Text('Description', style: const TextStyle(color: Color(0xFF838181), fontSize: 18, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                        ],
                      ),
                      // const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(widget.data.description!, style: const TextStyle(color: Color(0xFF838181), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                          const SizedBox(height: 10),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Location: ' + widget.data.place!, style: const TextStyle(color: Color(0xFF838181), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                        ],
                      ),

                      Row(
                        children: [
                          Text('Date: ' + DateFormat('dd-mm-yyyy : hh-MM').format(DateTime.parse(widget.data.date!)), style: const TextStyle(color: Color(0xFF838181), fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (number > 1) {
                                    number--;
                                  }
                                });
                              },
                              icon: Icon(Icons.remove_circle_outline, size: 20),
                              color: Colors.cyan,
                              iconSize: 30),
                          Text('$number'),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  number++;
                                });
                              },
                              icon: Icon(Icons.add_circle_outline, size: 20),
                              color: Colors.cyan,
                              iconSize: 30),
                          TextButton(
                              onPressed: () {
                                context.read<ReservationProviderr>().createReservation({'event': widget.data.id, 'number_of_tickets': number});
                              },
                              child: Text('add reservation', style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Poppins', fontWeight: FontWeight.w400)),
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan)))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
