import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticket/features/reservation/provider/reservation_provider.dart';

class ReservationAll extends StatefulWidget {
  const ReservationAll({super.key});

  @override
  State<ReservationAll> createState() => _ReservationAllState();
}

class _ReservationAllState extends State<ReservationAll> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ReservationProviderr>(builder: (context, provider, child) {
      if (provider.status == Status.uninitialized) {
        Provider.of<ReservationProviderr>(context, listen: false).getReservations();
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (provider.status == Status.creating) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (provider.status == Status.created) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Reservation All'),
          ),
          body: SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: provider.reservations!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Image.network(find(provider, index).thumbnail),
                      title: Text(
                        '${find(provider, index).name}',
                        style: const TextStyle(color: Colors.orange),
                      ),
                      subtitle: Text(find(provider, index).description),
                      trailing: TextButton(
                          onPressed: () {
                            Provider.of<ReservationProviderr>(context, listen: false).cancelres(provider.reservations![index].id);
                          },
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                  );
                }),
          )),
        );
      } else if (provider.status == Status.error) {
        return Center(
          child: Text('${provider.error}'),
        );
      } else {
        return const Center(
          child: Text('unknown error'),
        );
      }
    });
  }

  find(provider, index) {
    return provider.events!.firstWhere((element) => provider.reservations![index].event == element.id);
  }
}
