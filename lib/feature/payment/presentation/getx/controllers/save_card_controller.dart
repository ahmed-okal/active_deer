import 'package:get/get.dart';

import '../../../data/models/saved_card_model.dart';
import '../../../domain/entities/card_token_request.dart';
import '../../../domain/use_cases/get_card_use_case.dart';
import '../../../domain/use_cases/save_card_use_case.dart';
import 'package:get_storage/get_storage.dart';

class SavedCardsController extends GetxController {
  final SaveCardUseCase saveCardUseCase;
  final GetCardUseCase getCardUseCase;
  final storage = GetStorage();

  final RxList<SavedCardModel> savedCards = <SavedCardModel>[].obs;
  final RxBool isLoading = false.obs;

  SavedCardsController(this.saveCardUseCase, this.getCardUseCase);

  @override
  void onInit() {
    super.onInit();
    loadSavedCards();
  }

  void loadSavedCards() {
    final data = storage.read<List>('saved_cards') ?? [];
    savedCards.assignAll(data.map((e) => SavedCardModel.fromJson(e)).toList());
  }

  Future<void> addCard(CardTokenRequest request) async {
    isLoading.value = true;
    final result = await saveCardUseCase(request);
    result.fold(
      (failure) {
        Get.snackbar('Error', failure.message);
      },
      (card) {
        savedCards.add(card);
        _saveToStorage();
        Get.snackbar('Success', 'Card saved successfully');
      },
    );
    isLoading.value = false;
  }

  Future<void> fetchCardByToken(String token) async {
    isLoading.value = true;
    final result = await getCardUseCase(token);
    result.fold(
      (failure) {
        Get.snackbar('Error', failure.message);
      },
      (card) {
        savedCards.add(card);
        _saveToStorage();
      },
    );
    isLoading.value = false;
  }

  void deleteCard(int index) {
    savedCards.removeAt(index);
    _saveToStorage();
  }

  void _saveToStorage() {
    storage.write('saved_cards', savedCards.map((e) => e.toJson()).toList());
  }

  bool get hasActiveCards => activeCards.isNotEmpty;

  List<SavedCardModel> get activeCards {
    return savedCards
        .where((card) => card.isActive && !card.isExpired)
        .toList();
  }

  List<SavedCardModel> get expiredCards {
    return savedCards.where((card) => card.isExpired).toList();
  }

  Future<void> refreshCards() async {
    loadSavedCards();
  }
}
