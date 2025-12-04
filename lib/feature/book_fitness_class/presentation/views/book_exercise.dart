import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/exercise_book_item.dart';

class BookExercise extends StatelessWidget {
  const BookExercise({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, dynamic>?;
    final heroTag = arguments?['heroTag'] ?? 'exercise';
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Hero(
                tag: heroTag,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppAssets.test),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  flexibleSpace: CustomAppBar(title: 'bookFitnessClass'.tr),
                ),
              ],
            ),
            const BookExerciseContent(),
          ],
        ),
      ),
    );
  }
}
