import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gunaso/provider/gunaso_provider.dart';

import '../provider/form_provider.dart';

class GunasoForm extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _form = GlobalKey<FormState>();

  GunasoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      label: const Text('Title'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: const Text('Description'),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10)),
                    child: MaterialButton(
                        onPressed: () async {
                          _form.currentState!.save();
                          _form.currentState!.validate();
                          final response = await ref
                              .read(formProvider)
                              .formData(
                                  title: titleController.text.trim(),
                                  description:
                                      descriptionController.text.trim());
                          ref.refresh(gunasoProvider.notifier);

                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
