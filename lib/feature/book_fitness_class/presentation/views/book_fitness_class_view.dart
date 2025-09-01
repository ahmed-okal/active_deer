import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../getx/controllers/book_fitness_class_controller.dart';

class BookFitnessClassView extends GetView<BookFitnessClassController> {
  const BookFitnessClassView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookFitnessClassView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookFitnessClassView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
