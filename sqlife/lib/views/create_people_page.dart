import 'package:flutter/material.dart';
import 'package:sqlife/controllers/people_controller.dart';
import 'package:sqlife/models/people_model.dart';

import 'show_people_page.dart';

class CreatePeoplePage extends StatelessWidget {
  CreatePeoplePage({Key? key}) : super(key: key);

  final name = TextEditingController();
  final gender = TextEditingController();
  final address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create People'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: name,
                style: const TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: gender,
                style: const TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Gender',
                ),
              ),
              const SizedBox(height: 20.0),
              TextField(
                controller: address,
                style: const TextStyle(fontSize: 20.0),
                decoration: const InputDecoration(
                  hintText: 'Address',
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  var people = PeopleModel(
                    id: 0,
                    name: name.text,
                    gender: gender.text,
                    address: address.text,
                  );
                  PeopleController().insertPeople(people);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ShowPeoplePage()),
                  );
                  debugPrint('People Inserted');
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
