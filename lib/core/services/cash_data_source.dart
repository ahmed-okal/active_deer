import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../routes/app_pages.dart';

class CashDataSource {
  final box = GetStorage();
  void saveAuthDetails(
    String userId,
    String token,
    String name,
    String tenantId,
    String companyId,
    String branchId,
    String? logo,
  ) {
    box.write('userId', userId);
    box.write('authToken', token);
    box.write('isAuthenticated', true);
    box.write('userName', name);
    box.write('tenantId', tenantId);
    box.write('companyId', companyId);
    box.write('branchId', branchId);
    box.write('logo', logo);
  }

  bool isAuthenticated() {
    return box.read('isAuthenticated') ?? false;
  }

  void logout() {
    Get.find<CashDataSource>().clearInvoiceData();
    Get.find<CashDataSource>().clearSessionData();
    box.erase();
    Get.offAllNamed(Routes.auth);
  }

  // Save invoice data
  void saveInvoiceData({
    required String logo,
    required String commerce,
    required String cashierName,
    required String restaurantName,
    required String vatNumber,
    required String vat,
    required String mainAddress,
    required String websiteUrl,
    bool? addTax,
    bool? kitchenPageActive,
    bool? tablesActive,
  }) {
    box.write('invoice_logo', logo);
    box.write('invoice_commerce', commerce);
    box.write('invoice_cashier_name', cashierName);
    box.write('invoice_restaurant_name', restaurantName);
    box.write('invoice_vat_number', vatNumber);
    box.write('invoice_vat', vat);
    box.write('invoice_main_address', mainAddress);
    box.write('invoice_website_url', websiteUrl);
    if (addTax != null) {
      box.write('invoice_add_tax', addTax);
    }
    if (kitchenPageActive != null) {
      box.write('kitchen_page_active', kitchenPageActive);
    }
    if (tablesActive != null) {
      box.write('tables_active', tablesActive);
    }
  }

  // Get invoice data
  Map<String, dynamic> getInvoiceData() {
    return {
      'logo': box.read('invoice_logo') ?? '',
      'commerce': box.read('invoice_commerce') ?? '',
      'cashierName': box.read('invoice_cashier_name') ?? 'Cashier',
      'restaurantName': box.read('invoice_restaurant_name') ?? 'Restaurant',
      'vatNumber': box.read('invoice_vat_number') ?? '0',
      'vat': box.read('invoice_vat') ?? '0',
      'mainAddress': box.read('invoice_main_address') ?? 'No Address',
      'websiteUrl': box.read('invoice_website_url') ?? 'Ahmed M. Okal',
      'addTax': box.read('invoice_add_tax') ?? false,
      'kitchenPageActive': box.read('kitchen_page_active') ?? false,
      'tablesActive': box.read('tables_active') ?? false,
    };
  }

  // Clear invoice data
  void clearInvoiceData() {
    box.remove('invoice_logo');
    box.remove('invoice_commerce');
    box.remove('invoice_cashier_name');
    box.remove('invoice_restaurant_name');
    box.remove('invoice_vat_number');
    box.remove('invoice_vat');
    box.remove('invoice_main_address');
    box.remove('invoice_website_url');
    box.remove('invoice_add_tax');
    box.remove('kitchen_page_active');
    box.remove('tables_active');
  }

  // Save addTax setting separately
  void saveAddTaxSetting(bool addTax) {
    box.write('invoice_add_tax', addTax);
  }

  // Get addTax setting
  bool getAddTaxSetting() {
    return box.read('invoice_add_tax') ?? false;
  }

  bool getKitchenPageActive() {
    return box.read('kitchen_page_active') ?? false;
  }

  bool getTablesActive() {
    return box.read('tables_active') ?? false;
  }

  // Session management methods
  void saveSessionData({
    required int sessionId,
    required String sessionCode,
    required String openCash,
    String? openNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    box.write('session_id', sessionId);
    box.write('session_code', sessionCode);
    box.write('session_open_cash', openCash);
    box.write('session_open_notes', openNotes);
    box.write('session_created_at', createdAt?.toIso8601String());
    box.write('session_updated_at', updatedAt?.toIso8601String());
    box.write('session_active', true);
  }

  // Get session data
  Map<String, dynamic> getSessionData() {
    return {
      'sessionId': box.read('session_id'),
      'sessionCode': box.read('session_code'),
      'openCash': box.read('session_open_cash'),
      'openNotes': box.read('session_open_notes'),
      'createdAt': box.read('session_created_at'),
      'updatedAt': box.read('session_updated_at'),
      'isActive': box.read('session_active') ?? false,
    };
  }

  // Check if session is active
  bool isSessionActive() {
    return box.read('session_active') ?? false;
  }

  // Get current session ID
  int? getCurrentSessionId() {
    return box.read('session_id');
  }

  // Get current session code
  String? getCurrentSessionCode() {
    return box.read('session_code');
  }

  // Clear session data (when session is closed)
  void clearSessionData() {
    box.remove('session_id');
    box.remove('session_code');
    box.remove('session_open_cash');
    box.remove('session_open_notes');
    box.remove('session_created_at');
    box.remove('session_updated_at');
    box.remove('session_active');
  }

  // Update session status
  void updateSessionStatus(bool isActive) {
    box.write('session_active', isActive);
  }
}
