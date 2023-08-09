// ignore_for_file: curly_braces_in_flow_control_structures, deprecated_member_use, use_build_context_synchronously

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ticket/core/constants/size_constants.dart';
import 'package:ticket/features/events/presentation/provider/events_provider.dart';
import 'package:ticket/features/widgets/date_select.dart';
import 'package:ticket/features/widgets/decoration_input.dart';

class EventCreate extends StatefulWidget {
  const EventCreate({super.key});

  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  File? image;
  final _picker = ImagePicker();
  bool showSnipper = false;
  Future getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(pickedFile!.path);
    });
  }

  TextEditingController nameContoller = TextEditingController();
  TextEditingController locationContoller = TextEditingController();
  TextEditingController numberOfSeatsController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController thumbnailController = TextEditingController();
  String? selectedItem;
  String? topicItem;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SizeConstants.paddingLarge),
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              const SizedBox(height: SizeConstants.paddingMedium),
              const Text('Create Event', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: SizeConstants.paddingLarge),
              TextFormField(
                controller: nameContoller,
                cursorColor: Theme.of(context).colorScheme.secondary,
                decoration: decorationInput('Event Name', context),
              ),
              const SizedBox(height: SizeConstants.paddingMedium),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${selectedDate.year}-0${selectedDate.month}-${selectedDate.day}', style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: SizeConstants.paddingMedium),
                  ElevatedButton(
                      onPressed: () async {
                        selectedDate = (await showDateTimePicker(context: context))!;
                      },
                      child: Text('Select Date', style: Theme.of(context).textTheme.subtitle1))
                ],
              ),
              const SizedBox(width: 20),
              DropdownButton<String>(
                value: topicItem,
                items: ['Biology', 'Information Technologies', 'Science', 'Bussiness', 'Marketing'].map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // When the dropdown value is changed, update the selected item
                  setState(() {
                    topicItem = newValue;
                  });
                },
                hint: const Text('Select an topic'), // Optional: Displayed when no item is selected
              ),
              SizedBox(height: SizeConstants.paddingMedium),
              TextFormField(
                controller: locationContoller,
                cursorColor: Theme.of(context).colorScheme.secondary,
                decoration: decorationInput('Location', context),
              ),
              const SizedBox(height: SizeConstants.paddingMedium),
              TextFormField(
                controller: numberOfSeatsController,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).colorScheme.secondary,
                decoration: decorationInput('Number of Seats', context),
              ),
              const SizedBox(height: SizeConstants.paddingMedium),
              const SizedBox(height: SizeConstants.paddingMedium),
              TextFormField(
                maxLines: 2,
                controller: descriptionController,
                cursorColor: Theme.of(context).colorScheme.secondary,
                decoration: decorationInput('Description', context),
              ),
              const SizedBox(height: SizeConstants.paddingMedium),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                cursorColor: Theme.of(context).colorScheme.secondary,
                decoration: decorationInput('Price', context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text('currency', style: Theme.of(context).textTheme.subtitle1),
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedItem,
                      items: ['USD', 'UZS', 'RUB'].map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        // When the dropdown value is changed, update the selected item
                        setState(() {
                          selectedItem = newValue;
                        });
                      },
                      hint: const Text('Select an option'), // Optional: Displayed when no item is selected
                    ),
                  ),
                ],
              ),
              const SizedBox(height: SizeConstants.paddingMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 80,
                      width: 80,
                      child: image == null
                          ? Center(child: InkWell(onTap: getImage, child: const Text('Pic image')))
                          : Center(
                              child: Image.file(
                                File(image!.path).absolute,
                                fit: BoxFit.cover,
                              ),
                            )),
                ],
              ),
              const SizedBox(height: SizeConstants.paddingMedium),
              ElevatedButton(onPressed: createFunc, child: Text('Create', style: Theme.of(context).textTheme.subtitle1))
            ],
          ),
        ),
      ),
    );
  }

  void createFunc() async {
    final eventsProvider = Provider.of<EventsProvider>(context, listen: false);
    await eventsProvider.createEvent({
      'name': nameContoller.text,
      'topic': topicItem,
      'date': selectedDate.toIso8601String(),
      'place': locationContoller.text,
      'number_of_seats': numberOfSeatsController.text,
      'ticket_price': priceController.text,
      'currency': selectedItem,
      'thumbnail': [await MultipartFile.fromFile(image!.path, filename: image!.path)],
      'description': descriptionController.text,
    });

    if (eventsProvider.status == Status.created) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Event created successfully')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Event created failed ${eventsProvider.error}')));
    }
  }
}
