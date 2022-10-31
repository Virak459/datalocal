import 'package:flutter/material.dart';
import 'package:sqlife/controllers/people_controller.dart';
import 'package:sqlife/models/people_model.dart';

import 'show_people_page.dart';

class DetailPeoplePage extends StatefulWidget {
  final PeopleModel peopleModel;
  const DetailPeoplePage({
    Key? key,
    required this.peopleModel,
  }) : super(key: key);

  @override
  State<DetailPeoplePage> createState() => _DetailPeoplePageState();
}

class _DetailPeoplePageState extends State<DetailPeoplePage> {
  late TextEditingController name;
  late TextEditingController gender;
  late TextEditingController address;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.peopleModel.name);
    gender = TextEditingController(text: widget.peopleModel.gender);
    address = TextEditingController(text: widget.peopleModel.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail People'),
        actions: [
          IconButton(
            onPressed: () {
              var people = PeopleModel(
                id: widget.peopleModel.id,
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
              debugPrint('People updated');
            },
            icon: const Icon(Icons.done),
          ),
        ],
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
                  PeopleController().deletePeople(widget.peopleModel.id);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ShowPeoplePage()),
                  );
                  debugPrint('People deleted');
                },
                child: const Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
