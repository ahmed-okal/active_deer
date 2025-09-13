import 'package:active_deer/feature/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/widgets/custom_drawer.dart';
import '../getx/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(top: false, child: HomeViewBody()),
      drawer: CustomDrawer(),
    );
  }
}
