import 'package:crudzoo_flutter_web/domain/task.dart';
import 'package:crudzoo_flutter_web/view/provider/tasks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddTaskForm extends ConsumerStatefulWidget {
  const AddTaskForm({super.key});

  @override
  AddTaskFormState createState() {
    return AddTaskFormState();
  }
}

class AddTaskFormState extends ConsumerState<AddTaskForm> {
  final _formKey = GlobalKey<FormState>();

  final subjectController = TextEditingController();
  final bodyController = TextEditingController();
  final linkController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    bodyController.dispose();
    linkController.dispose();
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
                      controller: subjectController,
                      decoration:
                          const InputDecoration(hintText: 'Enter subject'),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: linkController,
                      decoration: const InputDecoration(hintText: 'Enter link'),
                      validator: (String? value) {
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: bodyController,
                      decoration: const InputDecoration(hintText: 'Enter body'),
                      validator: (String? value) {
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final content = TaskContent(subjectController.text,
                                linkController.text, bodyController.text);
                            final messenger = ScaffoldMessenger.of(context);
                            ref.read(tasksUsecaseProvider).createTask(content);
                            ScaffoldMessenger.of(context).showMaterialBanner(
                                MaterialBanner(
                                    content: const Text('Create Task Success'),
                                    leading: const Icon(Icons.info,
                                        color: Colors.white),
                                    backgroundColor: Colors.greenAccent,
                                    actions: [
                                  TextButton(
                                    child: const Text('hide'),
                                    onPressed: () {
                                      messenger.hideCurrentMaterialBanner();
                                    },
                                  ),
                                ]));
                          }
                        },
                        child: const Text('Add'),
                      ),
                    )
                  ],
                )))));
  }
}
