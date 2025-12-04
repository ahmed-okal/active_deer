class SavedCard {
  final String id;
  final String token;
  final String brand;
  final String lastFour;
  final String holderName;
  final String expiryMonth;
  final String expiryYear;
  final String funding;
  final String country;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SavedCard({
    required this.id,
    required this.token,
    required this.brand,
    required this.lastFour,
    required this.holderName,
    required this.expiryMonth,
    required this.expiryYear,
    required this.funding,
    required this.country,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  List<Object?> get props => [
    id,
    token,
    brand,
    lastFour,
    holderName,
    expiryMonth,
    expiryYear,
    funding,
    country,
    isActive,
    createdAt,
    updatedAt,
  ];

  SavedCard copyWith({
    String? id,
    String? token,
    String? brand,
    String? lastFour,
    String? holderName,
    String? expiryMonth,
    String? expiryYear,
    String? funding,
    String? country,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SavedCard(
      id: id ?? this.id,
      token: token ?? this.token,
      brand: brand ?? this.brand,
      lastFour: lastFour ?? this.lastFour,
      holderName: holderName ?? this.holderName,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      funding: funding ?? this.funding,
      country: country ?? this.country,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  // Helper getters
  String get maskedNumber => '**** **** **** $lastFour';
  String get expiryDate => '$expiryMonth/$expiryYear';
  bool get isExpired {
    final now = DateTime.now();
    final currentYear = now.year % 100; // Get last 2 digits
    final currentMonth = now.month;
    final cardYear = int.tryParse(expiryYear) ?? 0;
    final cardMonth = int.tryParse(expiryMonth) ?? 0;

    return cardYear < currentYear ||
        (cardYear == currentYear && cardMonth < currentMonth);
  }
}
