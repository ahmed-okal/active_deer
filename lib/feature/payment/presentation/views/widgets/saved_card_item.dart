import 'package:flutter/material.dart';

import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/size_config.dart';
import '../../../domain/entities/saved_card.dart';

class SavedCardItem extends StatelessWidget {
  final SavedCard card;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const SavedCardItem({
    super.key,
    required this.card,
    required this.isSelected,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSize.getHeight(12)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primary : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
        color: isSelected
            ? AppColors.primary.withValues(alpha: 0.05)
            : Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.all(AppSize.getWidth(16)),
            child: Row(
              children: [
                // Card brand icon
                Container(
                  width: AppSize.getWidth(40),
                  height: AppSize.getHeight(25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: _getCardBrandColor(),
                  ),
                  child: Center(
                    child: Text(
                      _getCardBrandText(),
                      style: AppTextTheme.primary600(
                        size: 10,
                      ).copyWith(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(width: AppSize.getWidth(12)),

                // Card details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card.maskedNumber,
                        style: AppTextTheme.primary600(size: 14),
                      ),
                      SizedBox(height: AppSize.getHeight(4)),
                      Row(
                        children: [
                          Text(
                            card.holderName,
                            style: AppTextTheme.primary400(
                              size: 12,
                            ).copyWith(color: Colors.grey.shade600),
                          ),
                          const Spacer(),
                          Text(
                            card.expiryDate,
                            style: AppTextTheme.primary400(
                              size: 12,
                            ).copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Selection indicator and delete button
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isSelected)
                      Icon(
                        Icons.check_circle,
                        color: AppColors.primary,
                        size: AppSize.getWidth(20),
                      ),

                    if (onDelete != null) ...[
                      SizedBox(width: AppSize.getWidth(8)),
                      GestureDetector(
                        onTap: onDelete,
                        child: Icon(
                          Icons.delete_outline,
                          color: Colors.red.shade400,
                          size: AppSize.getWidth(20),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getCardBrandColor() {
    switch (card.brand.toLowerCase()) {
      case 'visa':
        return const Color(0xFF1A1F71);
      case 'mastercard':
        return const Color(0xFFEB001B);
      case 'mada':
        return const Color(0xFF00A651);
      default:
        return Colors.grey.shade600;
    }
  }

  String _getCardBrandText() {
    switch (card.brand.toLowerCase()) {
      case 'visa':
        return 'VISA';
      case 'mastercard':
        return 'MC';
      case 'mada':
        return 'MADA';
      default:
        return card.brand.toUpperCase().substring(0, 2);
    }
  }
}
