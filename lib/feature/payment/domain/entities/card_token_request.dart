class CardTokenRequest {
  final String cardNumber;
  final String expiryMonth;
  final String expiryYear;
  final String cvv;
  final String holderName;

  const CardTokenRequest({
    required this.cardNumber,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvv,
    required this.holderName,
  });

  List<Object?> get props => [
    cardNumber,
    expiryMonth,
    expiryYear,
    cvv,
    holderName,
  ];

  CardTokenRequest copyWith({
    String? cardNumber,
    String? expiryMonth,
    String? expiryYear,
    String? cvv,
    String? holderName,
  }) {
    return CardTokenRequest(
      cardNumber: cardNumber ?? this.cardNumber,
      expiryMonth: expiryMonth ?? this.expiryMonth,
      expiryYear: expiryYear ?? this.expiryYear,
      cvv: cvv ?? this.cvv,
      holderName: holderName ?? this.holderName,
    );
  }

  // Helper methods
  String get maskedCardNumber {
    if (cardNumber.length < 4) return cardNumber;
    return '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}';
  }

  String get expiryDate => '$expiryMonth/$expiryYear';

  Map<String, dynamic> toMap() {
    return {
      'name': holderName,
      'number': cardNumber,
      'month': expiryMonth,
      'year': expiryYear,
      'cvc': cvv,
    };
  }
}
