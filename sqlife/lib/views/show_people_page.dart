import 'package:flutter/material.dart';
import 'package:sqlife/controllers/people_controller.dart';
import 'package:sqlife/models/people_model.dart';
import 'package:sqlife/views/create_people_page.dart';
import 'package:sqlife/views/detail_people_page.dart';

class ShowPeoplePage extends StatefulWidget {
  const ShowPeoplePage({Key? key}) : super(key: key);

  @override
  State<ShowPeoplePage> createState() => _ShowPeoplePageState();
}

class _ShowPeoplePageState extends State<ShowPeoplePage> {
  @override
  void initState() {
    super.initState();
    selectPeople();
  }

  List<PeopleModel> list = [];
  bool status = false;

  selectPeople() async {
    list = await PeopleController().selectPeople();
    if (list.isEmpty) {
      setState(() {
        status = false;
      });
    } else {
      setState(() {
        status = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List People'),
      ),
      body: Visibility(
        visible: true,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var data = list[index];
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DetailPeoplePage(peopleModel: data),
                    ),
                  );
                },
                leading: CircleAvatar(
                  child: Text(data.id.toString()),
                ),
                title: Text(data.name),
                subtitle: Text(data.address),
                trailing: Text(data.gender),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CreatePeoplePage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
