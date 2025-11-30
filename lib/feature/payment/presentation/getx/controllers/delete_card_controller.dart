import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/models/saved_card_model.dart';
import '../../../domain/use_cases/delete_card_use_case.dart';

class DeleteCardController extends GetxController {
  final DeleteCardUseCase deleteCardUseCase;

  DeleteCardController({required this.deleteCardUseCase});

  final RxBool isLoading = false.obs;
  final Rx<SavedCardModel?> deletedCard = Rx<SavedCardModel?>(null);
  final RxString errorMessage = ''.obs;

  Future<void> deleteCard(String token) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      deletedCard.value = null;

      final Either<Failure, SavedCardModel> result = await deleteCardUseCase(
        token,
      );

      result.fold(
        (failure) {
          errorMessage.value = failure.message;
        },
        (card) {
          deletedCard.value = card;
        },
      );
    } catch (e) {
      errorMessage.value = 'حدث خطأ غير متوقع';
    } finally {
      isLoading.value = false;
    }
  }
}
