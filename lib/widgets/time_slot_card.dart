import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class TimeSlotCard extends StatelessWidget {
  final String slot;
  final bool isBooked;
  final bool isSelected;
  final VoidCallback? onTap;

  const TimeSlotCard({
    super.key,
    required this.slot,
    required this.isBooked,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isBooked
              ? AppColors.disabled
              : isSelected
              ? AppColors.primary
              : Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.sm),
          border: Border.all(
            color: isBooked
                ? AppColors.disabled
                : isSelected
                ? AppColors.primary
                : AppColors.divider,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time,
              size: 20,
              color: isBooked
                  ? AppColors.textHint
                  : isSelected
                  ? Colors.white
                  : AppColors.textSecondary,
            ),
            const SizedBox(height: 4),
            Text(
              slot,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isBooked
                    ? AppColors.textHint
                    : isSelected
                    ? Colors.white
                    : AppColors.textPrimary,
              ),
            ),
            if (isBooked)
              const Text(
                'Booked',
                style: TextStyle(fontSize: 11, color: AppColors.textHint),
              ),
          ],
        ),
      ),
    );
  }
}
