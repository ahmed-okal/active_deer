import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';

class DaysWheel extends StatelessWidget {
  const DaysWheel({super.key});

  @override
  Widget build(BuildContext context) {
    const baseFontSize = 25.0;
    final baseTextStyle = TextStyle(
      fontSize: AppSize.getSize(baseFontSize),
      fontWeight: FontWeight.w900,
    );
    final wheelStyle = WheelPickerStyle(
      itemExtent: baseFontSize * 1.6,
      squeeze: 0.7,
      diameterRatio: 100.0,
      surroundingOpacity: .35,
      magnification: 52.0 / baseFontSize,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        Center(
          child: Container(
            height: AppSize.getHeight(67),
            width: AppSize.getWidth(120),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primary),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSize.getWidth(24)),
          child: DefaultTextStyle(
            style: baseTextStyle.copyWith(color: AppColors.darkGrey),
            child: WheelPicker(
              itemCount: 20,
              initialIndex: 0,
              looping: true,
              style: wheelStyle,
              selectedIndexColor: AppColors.primary,
              builder: (context, index) =>
                  Center(child: Text('${index + 1}', style: baseTextStyle)),
            ),
          ),
        ),
      ],
    );
  }
}

