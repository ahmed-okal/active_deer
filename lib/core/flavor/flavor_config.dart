import 'package:active_deer/core/enums/flavors_enum.dart';

class FlavorConfig {
  final Flavor flavor;

  static FlavorConfig? _instance;

  FlavorConfig._internal({required this.flavor});

  FlavorConfig({required this.flavor}) {
    _instance = FlavorConfig._internal(flavor: flavor);
  }

  static FlavorConfig get instance {
    _instance ??= FlavorConfig(flavor: Flavor.development);
    return _instance!;
  }
}
