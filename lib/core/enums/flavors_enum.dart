enum Flavor {
  development,
  test,
  production;

  bool get isDevelopment => this == Flavor.development;
  bool get isTest => this == Flavor.test;
  bool get isProduction => this == Flavor.production;

  String get appName {
    return switch (this) {
      Flavor.production => 'Active Deer',
      Flavor.test => 'Active Deer (Test)',
      Flavor.development => 'Active Deer (Development)',
    };
  }

  static Flavor fromString(String? value) {
    return Flavor.values.firstWhere(
      (e) => e.toString().split('.').last.toLowerCase() == value?.toLowerCase(),
    );
  }
}
