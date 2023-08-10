import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../provider/events_provider.dart';

class EventsAll extends StatefulWidget {
  const EventsAll({super.key});

  @override
  State<EventsAll> createState() => _EventsAllState();
}

class _EventsAllState extends State<EventsAll> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EventsProvider>(builder: (context, provider, child) {
      if (provider.status == Status.uninitialized) {
        Provider.of<EventsProvider>(context, listen: false).getEvents();
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
            title: const Text('Events'),
          ),
          body: SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: provider.events!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () => context.go('/eventsAll/detailPage', extra: provider.events![index]),
                      leading: Image.network(provider.events![index].thumbnail!),
                      title: Text(
                        provider.events![index].name!,
                        style: TextStyle(color: Colors.orange),
                      ),
                      subtitle: Text(provider.events![index].description!),
                      trailing: Text(provider.events![index].place!),
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

  //get eevents all
}
