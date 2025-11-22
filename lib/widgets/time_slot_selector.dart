import 'package:flutter/material.dart';
import 'package:quickservice/widgets/time_slot_card.dart';

import '../core/booking_state.dart';
import '../theme/app_theme.dart';
import '../view_models/booking _view_model.dart';

class TimeSlotSelector extends StatelessWidget {
  final BookingState state;
  final BookingViewModel viewModel;
  final List<String> timeSlots;

  const TimeSlotSelector({
    super.key,
    required this.state,
    required this.viewModel,
    required this.timeSlots,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Select Time',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: timeSlots.length,
            itemBuilder: (context, index) {
              final slot = timeSlots[index];
              final isBooked = viewModel.isSlotBooked(slot);
              final isSelected = state.selectedTimeSlot == slot;

              return TimeSlotCard(
                slot: slot,
                isBooked: isBooked,
                isSelected: isSelected,
                onTap: isBooked ? null : () => viewModel.selectTimeSlot(slot),
              );
            },
          ),
        ],
      ),
    );
  }
}
