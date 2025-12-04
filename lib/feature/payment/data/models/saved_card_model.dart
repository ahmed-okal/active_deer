import '../../domain/entities/saved_card.dart';

class SavedCardModel extends SavedCard {
  const SavedCardModel({
    required super.id,
    required super.token,
    required super.brand,
    required super.lastFour,
    required super.holderName,
    required super.expiryMonth,
    required super.expiryYear,
    required super.funding,
    required super.country,
    required super.isActive,
    required super.createdAt,
    required super.updatedAt,
  });

  factory SavedCardModel.fromJson(Map<String, dynamic> json) {
    return SavedCardModel(
      id: json['id'] ?? '',
      token: json['token'] ?? '',
      brand: json['brand'] ?? '',
      lastFour: json['last_four'] ?? '',
      holderName: json['name'] ?? '',
      expiryMonth: json['month'] ?? '',
      expiryYear: json['year'] ?? '',
      funding: json['funding'] ?? '',
      country: json['country'] ?? '',
      isActive: json['status'] == 'active',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  factory SavedCardModel.fromMoyasarResponse(Map<String, dynamic> json) {
    return SavedCardModel(
      id: json['id'] ?? '',
      token: json['id'] ?? '', // Moyasar uses id as token
      brand: json['brand'] ?? '',
      lastFour: json['last_four'] ?? '',
      holderName: json['name'] ?? '',
      expiryMonth: json['month'] ?? '',
      expiryYear: json['year'] ?? '',
      funding: json['funding'] ?? '',
      country: json['country'] ?? '',
      isActive: json['status'] == 'active',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'token': token,
      'brand': brand,
      'last_four': lastFour,
      'name': holderName,
      'month': expiryMonth,
      'year': expiryYear,
      'funding': funding,
      'country': country,
      'status': isActive ? 'active' : 'inactive',
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Map<String, dynamic> toLocalStorage() {
    return {
      'id': id,
      'token': token,
      'brand': brand,
      'lastFour': lastFour,
      'holderName': holderName,
      'expiryMonth': expiryMonth,
      'expiryYear': expiryYear,
      'funding': funding,
      'country': country,
      'isActive': isActive,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory SavedCardModel.fromLocalStorage(Map<String, dynamic> json) {
    return SavedCardModel(
      id: json['id'] ?? '',
      token: json['token'] ?? '',
      brand: json['brand'] ?? '',
      lastFour: json['lastFour'] ?? '',
      holderName: json['holderName'] ?? '',
      expiryMonth: json['expiryMonth'] ?? '',
      expiryYear: json['expiryYear'] ?? '',
      funding: json['funding'] ?? '',
      country: json['country'] ?? '',
      isActive: json['isActive'] ?? true,
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] ?? 0),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] ?? 0),
    );
  }

  @override
  SavedCardModel copyWith({
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
    return SavedCardModel(
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
}
