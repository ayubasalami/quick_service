import 'package:flutter/material.dart';

import '../core/booking_state.dart';
import '../theme/app_theme.dart';
import '../view_models/booking _view_model.dart';

class DurationSelector extends StatelessWidget {
  final BookingState state;
  final BookingViewModel viewModel;
  final List<int> durations;

  const DurationSelector({
    super.key,
    required this.state,
    required this.viewModel,
    required this.durations,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Duration',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppRadius.sm),
              border: Border.all(color: AppColors.divider),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: state.selectedDuration,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.textSecondary,
                ),
                items: durations.map((duration) {
                  return DropdownMenuItem(
                    value: duration,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule,
                          size: 20,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Text(
                          '$duration hour${duration > 1 ? 's' : ''}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    viewModel.selectDuration(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
