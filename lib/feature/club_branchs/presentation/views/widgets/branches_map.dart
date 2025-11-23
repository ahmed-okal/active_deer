import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../getx/controllers/club_branchs_controller.dart';

class BranchesMap extends GetView<ClubBranchsController> {
  const BranchesMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.getHeight(101),
      width: AppSize.getWidth(123),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey, width: AppSize.getHeight(1)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: const LatLng(30.825347, 31.010891),
            initialZoom: 15.0,
            minZoom: 10.0,
            maxZoom: 18.0,
            interactionOptions: const InteractionOptions(
              flags: InteractiveFlag.all,
            ),
            onTap: (tapPosition, point) => controller.openGoogleMaps(
              'https://www.google.com/maps/search/?api=1&query=30.825347,31.010891',
            ),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.active_deer',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: const LatLng(30.825347, 31.010891),
                  child: const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
