import 'package:flutter/material.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  AddTaskFormState createState() {
    return AddTaskFormState();
  }
}

class AddTaskFormState extends State<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            padding: const EdgeInsets.all(32),
            child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: titleController,
                      decoration:
                          const InputDecoration(hintText: 'Enter task title'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: bodyController,
                      decoration:
                          const InputDecoration(hintText: 'Enter task body'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final messenger = ScaffoldMessenger.of(context);
                            ScaffoldMessenger.of(context).showMaterialBanner(
                              MaterialBanner(
                                  content: const Text('Processing Data'),
                                  leading: const Icon(Icons.info, color: Colors.white),
                                  backgroundColor: Colors.blueAccent,
                                  actions: [
                                    TextButton(
                                      child: const Text('hide'),
                                      onPressed: () {
                                        messenger.hideCurrentMaterialBanner();
                                      },
                                    ),
                                  ]
                              ),
                            );
                          }
                        },
                        child: const Text('Add'),
                      ),
                    )
                  ],
                )))));
  }
}
