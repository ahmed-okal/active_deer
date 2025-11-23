import 'package:active_deer/core/widgets/failed_snack_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubBranchsController extends GetxController {
  Future<void> openGoogleMaps(String mapsUrl) async {
    try {
      final Uri uri = Uri.parse(mapsUrl);

      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      try {
        // Fallback: try alternative Google Maps URL
        final String fallbackUrl = mapsUrl;
        final Uri fallbackUri = Uri.parse(fallbackUrl);

        await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
      } catch (e2) {
        failedSnaskBar('لا يمكن فتح خرائط جوجل. الإحداثيات');
      }
    }
  }

  RxInt currentBranch = 0.obs;
  void changeBranch(int index) {
    currentBranch.value = index;
  }
}
