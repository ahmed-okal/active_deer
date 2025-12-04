import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/saved_card_model.dart';
import '../../../domain/use_cases/get_card_use_case.dart';

class GetSavedCardsController extends GetxController {
  final GetCardUseCase getCardUseCase;

  final RxList<String> savedTokens = <String>[].obs;

  final RxList<SavedCardModel> savedCards = <SavedCardModel>[].obs;

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  GetSavedCardsController({required this.getCardUseCase});

  void clear() {
    savedCards.clear();
    errorMessage.value = '';
  }

  Future<void> fetchSavedCards() async {
    if (savedTokens.isEmpty) {
      errorMessage.value = 'No saved cards found';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    savedCards.clear();

    for (final token in savedTokens) {
      final Either<Failure, SavedCardModel> result = await getCardUseCase.call(
        token,
      );
      result.fold(
        (failure) {
          errorMessage.value = failure.message;
        },
        (card) {
          savedCards.add(card);
        },
      );
    }
    isLoading.value = false;
  }
}
