import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:gunaso/widget/gunaso_form.dart';
import 'package:gunaso/provider/gunaso_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final data = ref.watch(gunasoProvider);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Jana Gunaso',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: data.gunasoData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ExpansionTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('assets/appreance.jpeg'),
                  ),
                  title: Text(data.gunasoData[index].user_name),
                  subtitle: Text(
                    data.gunasoData[index].title,
                    style:const TextStyle(fontSize: 16),
                  ),
                  children: [
                    Row(
                      children: [
                        Flexible(
                            child: Text(data.gunasoData[index].description)),
                      ],
                    ),
                  ],
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => GunasoForm());
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
